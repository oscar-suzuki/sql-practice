-- Amazon / Average Review Ratings

SELECT DATE_PART('month', submit_date) as mth, product_id, ROUND(AVG(stars),2) as avg_stars
FROM reviews
GROUP BY 1,2
ORDER BY 1,2;
