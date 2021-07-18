select order_id,order_date,customer_name,city,ORDER_AMOUNT,
	RANK() OVER(ORDER BY ORDER_AMOUNT) AS RANGO
	from orders_wf

select order_id,order_date,customer_name,city,ORDER_AMOUNT,
	RANK() OVER(ORDER BY ORDER_ID) AS RANGO
	from orders_wf

UPDATE ORDERS_WF SET ORDER_ID = 1001 WHERE ORDER_DATE = '2017-04-01' AND ORDER_AMOUNT = 10000.00
SELECT * FROM ORDERS_WF WHERE ORDER_DATE = '2017-04-01' AND ORDER_AMOUNT = 10000.00
UPDATE ORDERS_WF SET ORDER_ID = 1012 WHERE ORDER_DATE = '2017-01-01' AND ORDER_AMOUNT = 50000.00

select 
	RANK() OVER(PARTITION BY city ORDER BY order_amount) AS id,
	order_id,order_date,customer_name,city,ORDER_AMOUNT
	from orders_wf

select order_id,order_date,customer_name,city,ORDER_AMOUNT,
	RANK() OVER(ORDER BY city) AS RANGO
	from orders_wf
--------------------------- DENSE_RANK

select order_id,order_date,customer_name,city,ORDER_AMOUNT,
	DENSE_RANK() OVER(ORDER BY ORDER_AMOUNT) AS RANGO
	from orders_wf

select order_id,order_date,customer_name,city,ORDER_AMOUNT,
	DENSE_RANK() OVER(ORDER BY city) AS RANGO
	from orders_wf

GO

with cte as
(
select order_id,order_date,customer_name,city,ORDER_AMOUNT,
	DENSE_RANK() OVER(ORDER BY city) AS RANGO
	from orders_wf
)
SELECT DISTINCT RANGO,CITY FROM CTE
SELECT CITY --,COUNT(RANGO)
	FROM CTE
	GROUP BY CITY

--------------ROW_NUMBER
select order_id,order_date,customer_name,city,ORDER_AMOUNT,
	ROW_NUMBER() OVER(ORDER BY ORDER_AMOUNT) AS RANGO
	from orders_wf

select order_id,order_date,customer_name,city,ORDER_AMOUNT,
	ROW_NUMBER() OVER(ORDER BY order_id) AS RANGO
	from orders_wf

select order_id,order_date,customer_name,city,ORDER_AMOUNT,
	ROW_NUMBER() OVER(PARTITION BY city ORDER BY order_id DESC) AS consecutivo
	from orders_wf

select order_id,order_date,customer_name,city,ORDER_AMOUNT,
	ROW_NUMBER() OVER(ORDER BY order_id DESC) AS consecutivo
	from orders_wf

WITH cte_desc as
(
select order_id,order_date,customer_name,city,ORDER_AMOUNT,
	ROW_NUMBER() OVER(ORDER BY order_id DESC) AS consecutivo
	from orders_wf
)
select * from cte_desc order by consecutivo desc

---------------------NTILE
select order_id,order_date,customer_name,city,ORDER_AMOUNT,
	NTILE(7) OVER(ORDER BY city DESC) AS consecutivo
	from orders_wf
12/5 = 2.4
select order_id,order_date,customer_name,city,ORDER_AMOUNT,
	NTILE(7) OVER(ORDER BY city ) AS consecutivo
	from orders_wf

select order_id,order_date,customer_name,city,ORDER_AMOUNT,
	NTILE(4) OVER(ORDER BY order_date ) AS consecutivo
	from orders_wf

select order_id,order_date,customer_name,city,ORDER_AMOUNT,
	NTILE(4) OVER(PARTITION BY CITY ORDER BY ORDER_AMOUNT ) AS consecutivo
	from orders_wf

--LAG  Y LEAD
select order_id,order_date,customer_name,city,ORDER_AMOUNT,
	LAG(order_date,1) OVER(ORDER BY order_date ) AS orden
	from orders_wf

select order_id,order_date,customer_name,city,ORDER_AMOUNT,
	LAG(order_date,2) OVER(ORDER BY order_date ) AS orden
	from orders_wf

select order_id,order_date,customer_name,city,ORDER_AMOUNT,
	LAG(ORDER_AMOUNT,1) OVER(ORDER BY order_date ) AS orden
	from orders_wf
---Diferencia entre monto anterior y actual
with dif as
(
select order_id,order_date,customer_name,city,ORDER_AMOUNT,
	LAG(ORDER_AMOUNT,1) OVER(ORDER BY order_date ) AS anterior
	from orders_wf
)select *,anterior- order_amount as diferencia from dif

select order_id,order_date,customer_name,city,ORDER_AMOUNT,
	LAG(ORDER_AMOUNT,1) OVER(ORDER BY order_date ) AS orden,
	LAG(ORDER_AMOUNT,1) OVER(ORDER BY order_date ) - order_amount as diferencia
	from orders_wf

select order_id,customer_name,city,ORDER_AMOUNT,order_date,
	LAG(order_date,1) OVER(ORDER BY order_date ) AS anterior
	from orders_wf

select order_id,customer_name,city,ORDER_AMOUNT,order_date,
	(select distinct order_date from orders_wf as s where s.order_date<o.order_date) as anterior
	from orders_wf as o


with cte as (
select order_id,customer_name,city,ORDER_AMOUNT,order_date,
	from orders_wf
)
anterior as (
select * from cte where 
)
----LEAD
select order_id,customer_name,city,ORDER_AMOUNT,order_date,
	LEAD(order_date,1) OVER(ORDER BY order_date ) AS siguiente
	from orders_wf

----LEAD  y LAG
select order_id,customer_name,city,ORDER_AMOUNT,order_date,
	LAG(order_date,1) OVER(ORDER BY order_date ) AS anterior,
	LEAD(order_date,1) OVER(ORDER BY order_date ) AS siguiente
	from orders_wf

----FIRST_VALUE y LAST_VALUE
select order_id,customer_name,city,ORDER_AMOUNT,order_date,
	FIRST_VALUE(order_date) OVER(ORDER BY city ) AS primera,
	LAST_VALUE(order_date) OVER(ORDER BY city ) AS ultima
	from orders_wf

select order_id,customer_name,city,ORDER_AMOUNT,order_date,
	FIRST_VALUE(order_date) OVER(PARTITION BY city ORDER BY city,order_date ) AS inicio,
	LAST_VALUE(order_date) OVER(PARTITION BY city ORDER BY city ) AS final
	from orders_wf
