USE sales_analytics;
SELECT COUNT(*) AS total_rows FROM orders;
DESCRIBE orders;
USE sales_analytics;
SELECT COUNT(*) AS total_rows FROM orders;
DESCRIBE orders;
SELECT
  SUM(Order_ID IS NULL) AS null_order_id,
  SUM(Order_Date IS NULL) AS null_order_date,
  SUM(Sales IS NULL) AS null_sales,
  SUM(Profit IS NULL) AS null_profit
FROM orders;
SELECT Row_ID, COUNT(*) AS cnt
FROM orders
GROUP BY Row_ID
HAVING COUNT(*) > 1;
SELECT Category, ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY Category
ORDER BY Total_Sales DESC;
SELECT Category, ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Category
ORDER BY Total_Profit DESC;
SELECT Region, ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC;
SELECT Segment, ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY Segment
ORDER BY Total_Sales DESC;
SELECT Product_Name, ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT Product_Name, ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Product_Name
ORDER BY Total_Profit DESC
LIMIT 10;
SELECT Sub_Category, ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY Sub_Category
ORDER BY Total_Sales DESC;
SELECT Sub_Category, ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Sub_Category
ORDER BY Total_Profit DESC;
SELECT YEAR(Order_Date) AS Order_Year,
       ROUND(SUM(Sales),2) AS Total_Sales,
       ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY YEAR(Order_Date)
ORDER BY Order_Year;
SELECT YEAR(Order_Date) AS Order_Year,
       ROUND(SUM(Profit)/SUM(Sales)*100,2) AS Profit_Margin_Percent
FROM orders
GROUP BY YEAR(Order_Date)
ORDER BY Order_Year;
SELECT Sub_Category, ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Sub_Category
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;
SELECT Discount,
       COUNT(*) AS Order_Lines,
       ROUND(SUM(Sales),2) AS Total_Sales,
       ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Discount
ORDER BY Discount;
SELECT Ship_Mode,
       COUNT(DISTINCT Order_ID) AS Total_Orders,
       ROUND(AVG(DATEDIFF(Ship_Date, Order_Date)),2) AS Avg_Shipping_Days
FROM orders
GROUP BY Ship_Mode
ORDER BY Avg_Shipping_Days;
SELECT YEAR(Order_Date) AS Order_Year,
       MONTH(Order_Date) AS Order_Month,
       ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Order_Year, Order_Month;
SELECT Customer_Name,
       COUNT(DISTINCT Order_ID) AS Total_Orders,
       ROUND(SUM(Sales),2) AS Total_Sales,
       ROUND(SUM(Profit),2) AS Total_Profit
FROM orders
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT Region,
       ROUND(SUM(Sales),2) AS Total_Sales,
       ROUND(SUM(Profit),2) AS Total_Profit,
       ROUND(SUM(Profit)/SUM(Sales)*100,2) AS Profit_Margin_Percent
FROM orders
GROUP BY Region
ORDER BY Total_Profit DESC;