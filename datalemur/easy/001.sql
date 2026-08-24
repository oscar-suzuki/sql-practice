-- Twitter / Histogram of Tweets

WITH total_number_of_tweets_per_users AS (
  SELECT COUNT(tweet_id) as utweet_bucket, user_id
  FROM tweets
  WHERE tweet_date >= DATE '2022-01-01'
  AND tweet_date < DATE '2023-01-01'
  GROUP BY user_id
)

SELECT utweet_bucket as tweet_bucket,
COUNT(user_id) as users_num
FROM total_number_of_tweets_per_users
GROUP BY utweet_bucket;
