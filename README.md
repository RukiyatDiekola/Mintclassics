# Mintclassics
## Project Overview
Mint Classics Company, a retailer of classic model cars and other vehicles, is looking at closing one of their storage facilities. 
To support a data-based business decision, they are looking for suggestions and recommendations for reorganizing or reducing inventory, while still maintaining timely service to their customers. They would like to maintain the delivery period which is 24hours after order is being placed.
## Aim and Objectives
### Aim 
To close down one storage facilities
### Objectives
1. Explore products currently in inventory.

2. Determine important factors that may influence inventory reorganization/reduction.

3. Provide analytic insights and data-driven recommendations.
## Tools used 
SQL, Visual studio code.
## Data Exploration
This is crucial step that enable us to understand the data available in MintClassics Database. 
The image below shows the overall table available in the database 

![Screenshot](Tables.PNG)

Now that we know the tables available in the database, lets go deeper by exploring the warehouse table 

![Screenshot](Warehouses.PNG)

## INVENTORY ANALYSIS
To explore the products in inventory, information about the products, warehouses, and potentially orderdetails tables are needed. 

![Screenshot](InventoryAnalysis.PNG)

The screenshot below determined the Number of orders from each warehouse
![Screenshot](OrdersPerWarehouse2.PNG)

The below shows the total quantity of products currently in stock in each warehouse
![Screenshot](TotalInStockByWarehouse.PNG)

The screenshots below was used to retrieve the low performing stock and the storage for this low performing stock.
![Screenshot](LowPerformingStock.PNG)

![Screenshot](StorageForLPS.PNG)

## INSIGHTS
The inventory analysis showed that 2002 Suzuki XREO is the highest product in stock with quanitity in stock of 9997 and 
this is stored in North Warehouse  and the lowest product in stock which is 11960 BSA Gold Star DBD34 with the quanity of 15 are also stored in Warehouse North. 
Further analaysis also showed that the least product sold is 1957 ford thunderbird with overall quantity ordered of 767 stored in the EAST and the highest sold product is 1992 Ferrari 360 Spider red with overall quantity ordered of 1808 also stored in the EAST warehouse
Moreover, the total orders by warehouse analysis done also indicates that Highest Total Orders of 1010 has been sold from EAST Warehouse and West has sold the least orders of 657 just slightly different from that of North Warehouse with total Orders of 695. 
Currently, the stock analysis shows that, SOUTH Warehouse has the least products in stock with 79380, followed by WEST and NORTH with quanitity of 124880 and 131688 respectively. While the EAST has the highest quanity of products in stock. 
An analysis of the low performing product waas also done. The result of the analysis showed that 1985 Toyota Supra is the low performing product with none of it being sold and this is stored in EAST warehouse.

In Conclusion, these analysis as proven that EAST warehouse has been leading in almost all the analysis. It has the highest quantity of goods ordered stored in it, it has the lowest quantity of goods ordered stored in it, it has the highest quantity of products in stock and it stores the least performing product. 
