--for each category which month had highest sales 
with cte as (
select category,format(order_date,'yyyyMM') as order_year_month
, sum(sale_price) as sales 
from df_orders
group by category,format(order_date,'yyyyMM')
--order by category,format(order_date,'yyyyMM')
)
select * from (
select *,
row_number() over(partition by category order by sales desc) as rn
from cte
) a
where rn=1
