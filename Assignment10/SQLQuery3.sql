--find top 10 highest reveue generating products 
select top 10 product_id,sum(sale_price) as sales
from df_orders
group by product_id
order by sales desc