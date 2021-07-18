--WINDOWS FUNCTIONS -  MIN 
select order_id,order_date,customer_name,city,order_amount,
	min(order_amount) over(PARTITION BY city) as extra
	from orders_wf


select order_id,order_date,customer_name,city,order_amount,
	max(order_amount) over(PARTITION BY city) as extra
	from orders_wf


select order_id,order_date,customer_name,city,order_amount,
	min(order_amount) over(PARTITION BY city) as minimo,
	max(order_amount) over(PARTITION BY city) as maximo
	from orders_wf


