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

