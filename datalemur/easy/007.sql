-- Microsoft / Teams Power Users

-- Also supports extracting date parts using the EXTRACT function.
SELECT sender_id, COUNT(message_id) as message_count
FROM messages
WHERE DATE_PART('year', sent_date) = '2022'
AND DATE_PART('month', sent_date) = '8'
GROUP BY sender_id
ORDER BY 2 DESC
LIMIT 2;
