-- Top 5 highest profit making products in each region
with cte as (
SELECT region, product_id, total_profit as profit 
from orders_cleaned
group by region, product_id)
SELECT * from (
SELECT * 
, row_number() over(partition by region order by profit DESC) as rank
from cte) as A
where rank <= 5
