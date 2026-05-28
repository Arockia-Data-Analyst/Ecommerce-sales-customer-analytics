create database sales_analysis;
use sales_analysis;
select * from orders;
select category,sales from orders;
select * from orders;
select category,sales from orders;
select * from orders where category='Technology';
select category,sum(Sales) from orders group by category;
select category,sum(Sales) as Total_Sales from orders group by category order by Total_Sales desc;
select category,count(*) as Total_Orders from orders group by category;
select category,sum(Sales) as Total_Sales from orders group by category having Total_Sales>700000;
select region,avg(profit) as Avg_Profit from orders group by region having Avg_Profit>30;
create table customers as select distinct Customer_ID,Customer_Name,Segment,Region from ord
use sales_analysis;
use sales_analysis;
create table customers as select distinct Customer_ID,Customer_Name,Segment,Region from orders;
select * from orders;
create table customers as select distinct 'Customer ID','Customer Name',Segment,Region from orders;
select * from customers;
select * from orders;
create table products as select distinct 'Product ID','Product Name',Category,'Sub Category' from orders;
select * from products;
select * from customers;
drop table customers;
drop table products;
CREATE TABLE customers AS SELECT DISTINCT ‘Customer ID‘, ‘Customer Name‘, Segment, Region FROM orders;
describe orders;
create table customers as select distinct 'Customer ID','Customer Name','Segment','Region' from orders;
select * from customers;
create table customers as select distinct Customer ID,Customer Name,Segment,Region from orders;
drop table customers;
create table customers as select distinct Customer ID,Customer Name,Segment,Region from orders;
create table customers as select distinct Customer_ID,Customer_Name,Segment,Region from orders;
CREATE TABLE customers AS SELECT DISTINCT `Customer ID`, `Customer Name`, Segment, Region FROM orders;

select * from customers;
create table products as select distinct `Product ID`,`Product Name`,Category,`Sub Category` from orders;
describe orders;
create table products as select distinct `Product ID`,`Product Name`,Category,`Sub-Category` from orders;
select * from products;
select customers.`Customer Name`,orders.Sales from customers inner join orders on customers.`Customer ID`=orders.`Customer ID`;
select products.`Product Name`,products.Category,orders.Sales from products inner join orders on products.`Product ID`=orders.`Product ID`;
select customers.`Customer Name`,products.`Product Name`,products.Category,orders.Sales from orders inner join customers on customers.`Customer ID`=orders.`Customer ID` inner join products on products.`Product ID`=orders.`Product ID`;
select customers.`Customer Name`,sum(orders.Sales) as Total_Sales from customers inner join orders on customers.`Customer ID`=orders.`Customer ID`group by customers.`Customer Name` order by Total_Sales desc limit 5;
SELECT products.Category, SUM(orders.Profit) AS Total_Profit FROM products INNER JOIN orders ON products.`Product ID`=orders.`Product ID` GROUP BY products.Category ORDER BY Total_Profit DESC;
SELECT customers.Region, SUM(orders.Sales) AS Total_Sales FROM customers INNER JOIN orders ON customers.`Customer ID`=orders.`Customer ID` GROUP BY customers.Region ORDER BY Total_Sales DESC;
use sales_analysis;
select customers.`Customer Name`,products.`Product Name`,products.Category,orders.Sales from orders inner join customers on customers.`Customer ID`=orders.`Customer ID` inner join products on products.`Product ID`=orders.`Product ID`;
CREATE DATABASE ecommerce_project;
USE ecommerce_project;
SELECT * FROM superstore;
SELECT 
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore;
SELECT 
    Region,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC;
SELECT 
    Category,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Profit DESC;
SELECT 
    `Customer Name`,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT 
    MONTH(`Order Date`) AS Month_Number,
    MONTHNAME(`Order Date`) AS Month_Name,
    SUM(Sales) AS Total_Sales
FROM superstore
SET SQL_SAFE_UPDATES = 0;
GROUP BY Month_Number, Month_Name
ORDER BY Month_Number;
ALTER TABLE superstore
ADD COLUMN Order_Date_Formatted DATE;
UPDATE superstore SET Order_Date_Formatted = STR_TO_DATE (`Order Date`, '%m/%d/%Y');
SET SQL_SAFE_UPDATES = 0;
UPDATE superstore
SET Order_Date_Formatted =
STR_TO_DATE (`Order Date`, '%m/%d/%Y');
SET SQL_SAFE_UPDATES = 0;

UPDATE superstore
SET Order_Date_Formatted =

CASE

WHEN `Order Date` LIKE '%/%'
THEN STR_TO_DATE(`Order Date`, '%m/%d/%Y')

WHEN `Order Date` LIKE '%-%'
THEN STR_TO_DATE(`Order Date`, '%m-%d-%Y')

END;
SELECT 
    `Order Date`,
    Order_Date_Formatted
FROM superstore
LIMIT 10;
SELECT 
    MONTH(Order_Date_Formatted) AS Month_Number,
    MONTHNAME(Order_Date_Formatted) AS Month_Name,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Month_Number, Month_Name
ORDER BY Month_Number;
SELECT 
    `Product Name`,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT 
    `Ship Mode`,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY `Ship Mode`
ORDER BY Total_Sales DESC;
SELECT 
    State,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT 
    `Sub-Category`,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;
SELECT 
    ROUND(SUM(Sales) / COUNT(DISTINCT `Customer ID`), 2) AS Avg_Sales_Per_Customer
FROM superstore;