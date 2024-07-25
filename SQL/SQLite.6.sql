-- For each category which month had the highest sales
with cte as(
SELECT category, STRFTIME('%Y%m', order_date) as order_year_month, order_date, sum(selling_price) as sales
FROM orders_cleaned
GROUP by category, order_year_month
)
select * from (
SELECT *,
row_number() over (partition by category order by sales desc) as rank
from cte) as A
where rank = 1