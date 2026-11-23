-- TikTok / Signup Activation Rate

WITH user_with_activation_status AS (
  SELECT
    emails.user_id AS user_id,
    MAX(CASE WHEN texts.signup_action = 'Confirmed'
    THEN 1 ELSE 0 END) AS activation_status
  FROM emails
  LEFT JOIN texts
  ON emails.email_id = texts.email_id
  GROUP BY emails.user_id
)

SELECT
  ROUND(
    (SUM(activation_status)*1.00) / (COUNT(user_id)*1.00)
  , 2) AS confirm_rate
FROM user_with_activation_status;

-- Alternartive Solution
-- better to use CAST for DECIMAL conversion instead of multiplying by 1.00
SELECT
    ROUND(COUNT(texts.email_id)::DECIMAL
      /COUNT(DISTINCT emails.email_id), 2) AS activation_rate
FROM emails
LEFT JOIN texts
ON emails.email_id = texts.email_id
AND texts.signup_action = 'Confirmed';
