--WINDOWS FUNCTIONS -  AVG y Particionado por màs de un campo (o expresión)
select order_id,order_date,customer_name,city,order_amount,
	avg(order_amount) over(PARTITION BY city,month(order_date)) as promedio_mensual
	from orders_wf

select order_id,order_date,customer_name,city,order_amount,
	avg(order_amount) over(PARTITION BY city) as promedio_mensual
	from orders_wf


select order_id,order_date,customer_name,city,order_amount,
	avg(order_amount) over(PARTITION BY month(order_date)) as promedio_mensual
	from orders_wf