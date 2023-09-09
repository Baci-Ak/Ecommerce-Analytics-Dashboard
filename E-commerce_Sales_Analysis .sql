show databases;
use projects;
show tables;

SELECT * FROM Online_Retail_clean limit 20;

SELECT * from Online_Retail_clean WHERE CustomerID is NULL; 



----------- Top Selling Products by Description ---------------

# Find the top-selling products based on the total quantity sold.

SELECT StockCode, Description, SUM(Quantity) AS TotalQuantity
FROM Online_Retail_clean
GROUP BY StockCode, Description
ORDER BY TotalQuantity DESC
LIMIT 10;



---------------- Calculate the total revenue for each transaction ---------

SELECT InvoiceNo, SUM(Quantity * UnitPrice) AS Revenue
FROM Online_Retail_clean
GROUP BY InvoiceNo;



--------------- Identify top customers by total spending -------------

SELECT CustomerID, SUM(Quantity * UnitPrice) AS TotalSpending
FROM Online_Retail_clean
GROUP BY CustomerID
ORDER BY TotalSpending DESC
LIMIT 15;



--------------- Calculate the average order value ------------------

# what are the average order by InvoiceNo 
SELECT InvoiceNo, SUM(Quantity * UnitPrice) AS OrderValue
FROM Online_Retail_clean
GROUP BY InvoiceNo;



------------------ Calculate the percentage of customers who made repeat purchases -----------------

# what is the percentage of customers who made repeat purchases.
SELECT COUNT(DISTINCT CustomerID) AS TotalCustomers,
       COUNT(DISTINCT CASE WHEN RepeatPurchaseCount > 1 THEN CustomerID END) AS RepeatCustomers
FROM (
    SELECT CustomerID, COUNT(DISTINCT InvoiceNo) AS RepeatPurchaseCount
    FROM Online_Retail_clean
    GROUP BY CustomerID
) AS CustomerRepeatPurchases;




---------------------- Geographic Analysis -------------------------

#Business Question: What are the top revenue-generating countries?

SELECT Country, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM Online_Retail_clean
GROUP BY Country
ORDER BY TotalRevenue DESC;


# Analyze sales by country: what are the top generating customers and sales countries.

SELECT Country, COUNT(DISTINCT CustomerID) AS TotalCustomers, 
	SUM(Quantity * UnitPrice) AS TotalSales
FROM Online_Retail_clean
GROUP BY Country
ORDER BY TotalSales DESC;




---------------------- Seasonal Sales Analysis -----------------------

# Business Question: What are the sales trends over different months?

SELECT DATE_FORMAT(STR_TO_DATE(InvoiceDate, '%m/%d/%y %H:%i'), '%Y-%m') AS Month,
       SUM(Quantity * UnitPrice) AS TotalSales
FROM Online_Retail_clean
GROUP BY Month
ORDER BY Month;



-------------------- Customer Segmentation ----------------------------------
	
# Business Question: How can we segment customers based on their spending behavior?

SELECT CustomerID,
       CASE
           WHEN SUM(Quantity * UnitPrice) > 1000 THEN 'High Spender'
           WHEN SUM(Quantity * UnitPrice) > 500 THEN 'Medium Spender'
           ELSE 'Low Spender'
       END AS CustomerSegment
FROM Online_Retail_clean
GROUP BY CustomerID;



---------------------- Customer Churn Analysis -----------------------------

#Business Question: Which customers haven't made purchases recently? What's the churn rate?

SELECT CustomerID,
       CASE
           WHEN DATEDIFF(NOW(), MAX(STR_TO_DATE(InvoiceDate, '%m/%d/%y %H:%i'))) > 180 THEN 'Churned'
           ELSE 'Active'
       END AS CustomerStatus
FROM Online_Retail_clean orc 
GROUP BY CustomerID;





SELECT CustomerID,
       CASE
           WHEN DATEDIFF('2011-12-31', MAX(STR_TO_DATE(InvoiceDate, '%m/%d/%y %H:%i'))) > 180 THEN 'Churned'
           ELSE 'Active'
       END AS CustomerStatus
FROM Online_Retail_clean
GROUP BY CustomerID;
