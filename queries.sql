#Indicating the database to work on
USE mintclassics;
#to view the warehouses available
SELECT * FROM warehouses;
#To view the locations where customers order FROM
SELECT DISTINCT city FROM customers;
SHOW TABLES;
SELECT * FROM products;
#To explore products currently in inventory
-- Retrieve details of products currently in inventory across all warehouses
SELECT p.productCode, p.productName, p.productDescription, p.quantityInStock, w.warehouseName
FROM products p
JOIN warehouses w ON p.warehouseCode = w.warehouseCode
WHERE p.quantityInStock > 0;
-- Retrieve sales volume for each product by warehouse, this enables us to know which
--- products is more popular and from which warehouse is it being shipped from. 
---The least performing warehouse may be a good option for closure
SELECT p.productCode, p.productName, SUM(od.quantityOrdered) AS totalSold, w.`warehouseName`
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
JOIN warehouses w ON p.warehouseCode = w.warehouseCode
GROUP BY p.productCode, w.warehouseName
ORDER BY totalSold ASC;
---this shows the least product sold is 1957 ford thunderbird with 767
---and the warehouse for this is East
SELECT * FROM warehouses

SHOW TABLES


--- TO know the number of orders from each warehouses
SELECT w.warehouseName, COUNT(DISTINCT o.orderNumber) AS totalOrders
FROM warehouses w
JOIN products p ON w.warehouseCode = p.warehouseCode
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
GROUP BY w.warehouseName;

-- Identify low-performing products (products with high stock and low sales)
SELECT p.productCode, p.productName, p.quantityInStock, SUM(od.quantityOrdered) AS totalSold
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode
HAVING totalSold < 700 -- threshold for low-performing products
ORDER BY totalSold ASC;

SELECT p.productCode, p.productName, p.quantityInStock, 
       COALESCE(SUM(od.quantityOrdered), 0) AS totalSold
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode
HAVING totalSold < 700 -- threshold for low-performing products
ORDER BY totalSold ASC;
--- the information from the query above showsthe product that has a totalsold of 0
--- the COALESCE used in the query was used to retrieve all products with no totalsold at all, If a product has not been ordered, it will show totalSold as 0 instead of NULL.

--- to know the warehouse this is stored
SELECT p.productCode, p.productName, p.quantityInStock, 
       COALESCE(SUM(od.quantityOrdered), 0) AS totalSold, 
       w.warehouseName
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
JOIN warehouses w ON p.warehouseCode = w.warehouseCode
GROUP BY p.productCode, w.warehouseName
HAVING totalSold < 700 -- threshold for low-performing products
ORDER BY totalSold ASC;
--- this shows the warehouse this is stored is East 
--- However, this project will be inconclusive because the information of the warehouse capacity and location is not provided
--- Therefore, i wont be able to suggest which warehouse to put the goods in.


-- Estimate the impact of closing a specific warehouse
SELECT w.warehouseName, SUM(od.quantityOrdered) AS totalSold, COUNT(DISTINCT o.customerNumber) AS customersServed
FROM warehouses w
JOIN products p ON w.warehouseCode = p.warehouseCode
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
GROUP BY w.warehouseName;


SELECT w.warehouseName, p.productName, SUM(od.quantityOrdered) AS totalSold
FROM warehouses w
JOIN products p ON w.warehouseCode = p.warehouseCode
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY w.warehouseName, p.productName
ORDER BY totalSold DESC;
