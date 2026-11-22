-- Amazon / Highest-Grossing Items

WITH total_spend_with_rank AS (
    SELECT
        category,
        product,
        SUM(spend) as total_spend,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY SUM(spend) DESC
        ) as rank
    FROM product_spend
    WHERE DATE_PART('year', transaction_date) = '2022'
    GROUP BY category, product
)

SELECT category, product, total_spend
FROM total_spend_with_rank
WHERE rank <= 2;
