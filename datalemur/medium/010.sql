-- Google / Odd and Even Measurements

WITH tbl_with_num AS (
  SELECT
    measurement_time::DATE AS measurement_day,
    measurement_value,
    ROW_NUMBER() OVER (PARTITION BY measurement_time::DATE ORDER BY measurement_time) AS row_num
  FROM measurements
)

SELECT
  measurement_day,
  SUM(CASE WHEN MOD(row_num,2) = 0 THEN 0 ELSE measurement_value END) AS odd_sum,
  SUM(CASE WHEN MOD(row_num,2) = 0 THEN measurement_value ELSE 0 END) AS even_sum
FROM tbl_with_num
GROUP BY measurement_day
ORDER BY measurement_day;

-- I could use FILTER clauses.
SELECT
  measurement_day,
  SUM(measurement_value) FILTER (WHERE MOD(row_num,2) != 0) AS odd_sum,
  SUM(measurement_value) FILTER (WHERE MOD(row_num,2) = 0)  AS even_sum
FROM tbl_with_num
GROUP BY measurement_day
ORDER BY measurement_day;
