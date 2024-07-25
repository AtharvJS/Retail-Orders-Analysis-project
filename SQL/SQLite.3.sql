-- Top 5 highest selling products in each region
with cte as (
SELECT region, product_id, sum(selling_price) as sales 
from orders_cleaned
group by region, product_id)
SELECT * from (
SELECT * 
, row_number() over(partition by region order by sales DESC) as rank
from cte) as A
where rank <= 5
