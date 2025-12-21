--find top 5 highest selling products in each region
with cte as (
select region,product_id,sum(sale_price) as sales
from df_orders
group by region,product_id)
select * from (
select *
, row_number() over(partition by region order by sales desc) as rn
from cte) A
where rn<=5