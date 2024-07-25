-- Find top 10 highest revenue generating products
SELECT product_id, sum(selling_price) as 'Total_sales'
from orders_cleaned
GROUP by product_id
order by Total_sales DESC
LIMIT 10