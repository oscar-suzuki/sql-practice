-- Facebook / Average Post Hiatus (Part 1)

WITH tmp AS (
  SELECT user_id, CAST(min(post_date) as DATE) as first_date, CAST(max(post_date) as DATE) as last_date FROM posts
  WHERE post_date >= DATE('2021-01-01') AND
  post_date < DATE('2022-01-01')
  GROUP BY user_id
  HAVING count(post_id) >= 2
)

SELECT user_id, last_date-first_date as days_between
FROM tmp;


-- brushup
-- Supports casting using the ::DATE syntax, which is more common in PostgreSQL.
SELECT user_id, max(post_date::DATE)-min(post_date::DATE) as dayes_between
FROM posts
WHERE DATE_PART('year', post_date::DATE) = 2021
GROUP BY user_id
HAVING count(post_id) >= 2;
