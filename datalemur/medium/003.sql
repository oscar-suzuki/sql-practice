-- Snapchat / Sending vs. Opening Snaps

WITH age_breakdown_agg AS (
  SELECT ab.age_bucket,
    SUM(CASE WHEN ac.activity_type = 'send' THEN ac.time_spent ELSE 0 END) AS total_send,
    SUM(CASE WHEN ac.activity_type = 'open' THEN ac.time_spent ELSE 0 END) AS total_open
  FROM activities ac
  INNER JOIN age_breakdown ab
  ON ac.user_id = ab.user_id
  WHERE ac.activity_type IN ('send', 'open')
  GROUP BY ab.age_bucket
)

SELECT age_bucket,
  ROUND(total_send / (total_send+total_open) * 100.0,2) as sent_perc,
  ROUND(total_open / (total_send+total_open) * 100.0,2) as open_perc
FROM age_breakdown_agg;


-- Alternative Solution: FILTER Clause can be used to simplify the aggregation logic
SELECT
  age.age_bucket,
  ROUND(100.0 *
    SUM(activities.time_spent) FILTER (WHERE activities.activity_type = 'send')/
    SUM(activities.time_spent),2) AS send_perc,
  ROUND(100.0 *
    SUM(activities.time_spent) FILTER (WHERE activities.activity_type = 'open')/
    SUM(activities.time_spent),2) AS open_perc
FROM activities
INNER JOIN age_breakdown AS age
  ON activities.user_id = age.user_id
WHERE activities.activity_type IN ('send', 'open')
GROUP BY age.age_bucket;
