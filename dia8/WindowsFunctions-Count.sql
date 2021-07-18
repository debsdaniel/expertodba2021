select city,count(customer_name) as numero
	from orders_wf
	group by city

select city,count(DISTINCT customer_name) as numero
	from orders_wf
	group by city

SELECT * FROM ORDERS_WF WHERE CITY='GuildFord'

select city,customer_name,
	count(customer_name) over(partition by city,customer_name) as numero
	from orders_wf
	
