-- PayPal / Final Account Balance

WITH total_transactions AS (
  SELECT account_id,
    SUM(CASE WHEN transaction_type = 'Deposit' THEN amount ELSE 0 END) as total_deposit,
    SUM(CASE WHEN transaction_type = 'Withdrawal' THEN amount ELSE 0 END) as total_withdrawal
  FROM transactions
  GROUP BY account_id
)

SELECT account_id, (total_deposit - total_withdrawal) as final_balance
FROM total_transactions;

-- Alternative Solution
SELECT account_id,
        SUM(CASE WHEN transaction_type = 'Deposit' THEN amount ELSE -amount END) as final_balance
FROM transactions
GROUP BY account_id;
