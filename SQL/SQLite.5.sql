-- Month over month growth comparison for 2022 and 2023, for eg: jan 2022 vs jan 2023 
WITH cte AS (
  SELECT 
    STRFTIME('%Y', order_date) AS year, 
    STRFTIME('%m', order_date) AS month,
    SUM(selling_price) AS sales
  FROM 
    orders_cleaned
  GROUP BY 
    year, month
)
SELECT 
  month,
  MAX(IIF(year = '2022', sales, NULL)) AS sales_2022,
  MAX(IIF(year = '2023', sales, NULL)) AS sales_2023
FROM 
  cte
GROUP BY 
  month;
