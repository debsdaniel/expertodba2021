with inicial (fecha,item) as
(
select cast('01-01-20' as date),'apple' union all
select cast('01-01-20' as date),'apple' union all
select cast('01-01-20' as date),'pear' union all
select cast('01-01-20' as date),'pear' union all
select cast('01-02-20' as date),'pear' union all
select cast('01-02-20' as date),'pear' union all
select cast('01-02-20' as date),'pear' union all
select cast('01-02-20' as date),'orange'
)
--select * from inicial
,recuento as (
select fecha,item,count(item) as conteo
	from inicial
	group by fecha,item
),
final as (
select *,
	rank() over (partition by fecha order by conteo desc) as rango
	from recuento
)
select fecha,item,conteo,rango
	from final 
	where rango=1