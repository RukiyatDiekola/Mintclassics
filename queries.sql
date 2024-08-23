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
