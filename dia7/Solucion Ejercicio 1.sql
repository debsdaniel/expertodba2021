--ejercicio 1 CTE
WITH users(user_id,accion,fecha) as
(
SELECT 1,'start',cast('01-01-20' AS date) UNION ALL
SELECT 1,'cancel',cast('01-02-20' AS date) UNION ALL
SELECT 2,'start',cast('01-03-20' AS date) UNION ALL
SELECT 2,'publish',cast('01-04-20' AS date) UNION ALL
SELECT 3,'start',cast('01-05-20' AS date) UNION ALL
SELECT 3,'cancel',cast('01-06-20' AS date) UNION ALL
SELECT 1,'start',cast('01-07-20' AS date) UNION ALL
SELECT 1,'publish',cast('01-08-20' AS date)
),
--SELECT * FROM users u
t1 as (
SELECT u.user_id,
	sum(CASE WHEN accion='start' THEN 1 ELSE 0 END) as start,
	sum(CASE WHEN accion='cancel' THEN 1 ELSE 0 END) as cancel,
	sum(CASE WHEN accion='publish' THEN 1 ELSE 0 END) as publish
	from users AS u
	GROUP BY u.user_id
)
SELECT t.user_id,
	1.0*t.cancel/t.start AS porcentaje_rechazadas,
	1.0*t.publish/t.start AS porcentaje_aceptadas
	from t1 t
------
GO
WITH users(user_id,accion,fecha) AS
(
SELECT 1,'start',cast('01-01-20' AS date) UNION ALL
SELECT 1,'cancel',cast('01-02-20' AS date) UNION ALL
SELECT 2,'start',cast('01-03-20' AS date) UNION ALL
SELECT 2,'publish',cast('01-04-20' AS date) UNION ALL
SELECT 3,'start',cast('01-05-20' AS date) UNION ALL
SELECT 3,'cancel',cast('01-06-20' AS date) UNION ALL
SELECT 1,'start',cast('01-07-20' AS date) UNION ALL
SELECT 1,'publish',cast('01-08-20' AS date)
),
inicio (user_id,cont) AS (
	select u.user_id,
		count(*)
		from users u
		WHERE u.accion='start'
	GROUP BY u.user_id
),
rechazada (user_id,cont) AS (
	select u.user_id,
		count(*)
		from users u
		WHERE u.accion='cancel'
	GROUP BY u.user_id
),
aceptada (user_id,cont) AS (
	select u.user_id,
		count(*)
		from users u
		WHERE u.accion='publish'
	GROUP BY u.user_id
),
t2 AS (
SELECT i.user_id,i.cont AS Iniciadas,
	coalesce(r.cont,null,null,null,0) AS rechazadas,
	isnull(a.cont,0) AS aceptadas
	FROM inicio i left JOIN rechazada r ON i.user_id=r.user_id
	left JOIN aceptada a ON i.user_id=a.user_id
)
SELECT user_id,
	1.0*rechazadas/iniciadas AS por_rechazada,
	1.0*aceptadas/iniciadas AS por_aceptadas
	from t2