-- Zomato / Swapped Food Delivery

WITH order_with_prev_next AS (
  SELECT
    *,
    LEAD(item) OVER (ORDER BY order_id) AS next_item,
    LAG(item) OVER (ORDER BY order_id) AS prev_item
  FROM orders
)

SELECT
  order_id,
  (CASE
  WHEN order_id%2 != 0 and next_item IS NULL THEN item
  WHEN order_id%2 = 0 THEN prev_item
  WHEN order_id%2 != 0 THEN next_item
  END) AS item
FROM order_with_prev_next;
