-- Find top 10 highest profit generating products
select product_id, total_profit from orders_cleaned 
order by total_profit DESC
limit 10 