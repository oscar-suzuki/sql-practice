--　Robinhood / Cities With Completed Trades

SELECT users.city, COUNT(trades.order_id)
FROM trades
JOIN users ON trades.user_id = users.user_id
WHERE trades.status = 'Completed'
GROUP BY users.city
ORDER BY 2 DESC
LIMIT 3;
