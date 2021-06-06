USE northwind
SELECT productid, productname, supplierid, unitprice 
FROM  products WHERE (productname LIKE 'T%' OR productid = 46)
  AND  (unitprice > 16.00)

SELECT productid, productname, supplierid, unitprice
FROM products
WHERE (productname LIKE 'T%')
   OR (productid = 46 AND unitprice > 16.00)

select * from products