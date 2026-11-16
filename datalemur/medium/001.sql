-- Uber / User's Third Transaction

WITH with_rownum AS (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date) as num
  FROM transactions
)
SELECT user_id, spend, transaction_date
FROM with_rownum
WHERE num = 3;
