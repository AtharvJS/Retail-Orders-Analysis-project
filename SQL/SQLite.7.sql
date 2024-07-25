-- Which sub-category has the highest growth by profit in 2023 compared to 2022
with cte as(
  select
  	sub_category,
  	STRFTIME('%Y', order_date) as year,
  	sum(selling_price) as sales
  FROM
  	orders_cleaned
  GROUP by 
  	sub_category, year
  )
  , cte2 as(
  SELECT
  	sub_category,
    MAX(IIF(year = '2022', sales, NULL)) as sales_2022,
    MAX(IIF(year = '2023', sales, NULL)) AS sales_2023
   from 
   	cte
   group by 
   	sub_category
  )
  SELECT *,
  (sales_2023 - sales_2022) / sales_2022 * 100 as Percent_growth_in_profit
  from 
  	cte2
  order by Percent_growth_in_profit DESC
  --LIMIT 1
 