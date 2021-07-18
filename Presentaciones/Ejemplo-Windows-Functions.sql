CREATE TABLE [dbo].[Orders_WF]
(
	order_id INT,
	order_date DATE,
	customer_name VARCHAR(250),
	city VARCHAR(100),	
	order_amount MONEY
)

GO
select * from Orders_WF

INSERT INTO [dbo].[Orders_WF]
SELECT '1001',cast('20170401' as date),'David Smith','GuildFord',10000
UNION ALL	  
SELECT '1002',cast('20170402' as date),'David Jones','Arlington',20000
UNION ALL	  
SELECT '1003',cast('20170403' as date),'John Smith','Shalford',5000
UNION ALL	  
SELECT '1004',cast('20170404' as date),'Michael Smith','GuildFord',15000
UNION ALL	  
SELECT '1005',cast('20170405' as date),'David Williams','Shalford',7000
UNION ALL	  
SELECT '1006',cast('20170406' as date),'Paum Smith','GuildFord',25000
UNION ALL	 
SELECT '1007',cast('20170410' as date),'Andrew Smith','Arlington',15000
UNION ALL	  
SELECT '1008',cast('20170411' as date),'David Brown','Arlington',2000
UNION ALL	  
SELECT '1009',cast('20170420' as date),'Robert Smith','Shalford',1000
UNION ALL	  
SELECT '1010',cast('20170425' as date),'Peter Smith','GuildFord',500


INSERT INTO [dbo].[Orders_WF]
SELECT '1001',cast('20170101' as date),'David Smith','GuildFord',40000

INSERT INTO [dbo].[Orders_WF]
SELECT '1001',cast('20170101' as date),'David Smith','GuildFord',50000