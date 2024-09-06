#The main objective of this project is to analyze retail sales data to gain actionable insights 
#that will enhance the performance of the Coffee Shop


#                                      Recommended Analysis
# 1. How do sales vary by day of the week and hour of the day?
# 2. Are there any peak times for sales activity?
# 3. What is the total sales revenue for each month?
# 4. How do sales vary across different store locations?
# 5. what is the average price/order per person?
# 6. Which products are the best selling in terms of quantity and revenue?
# 7. How do sales vary by product category and type?

show databases;
Select count(*) 
    from `coffee shop store`.`coffee shop sales`;
    
Select * from
	`coffee shop store`.`coffee shop sales` limit 10;


-----------TO Find the Total Sales------------
SELECT SUM(Total_bill)
	from  `coffee shop store`.`coffee shop sales`; 

-----------TO find total Footfall in the coffee shop----------
SELECT COUNT(transaction_qty)
	from  `coffee shop store`.`coffee shop sales`;

-----------TO find Avg bill per person in the  coffee shop----------
SELECT avg(Total_bill) 
	from  `coffee shop store`.`coffee shop sales`;

-----------TO find Order per person in the coffee shop-------------
SELECT avg(transaction_qty) 
	from  `coffee shop store`.`coffee shop sales`;


------------To find total sales revenue for each month-------------
SELECT SUM(Total_bill) as Revenue, `Month Name`  as Month
from `coffee shop store`.`coffee shop sales`
group by `Month Name`
order by Revenue;

----------TO find top 5 product over Revenue-----------------------
SELECT  product_type ,sum(Total_bill)  as total_revenue
 from  `coffee shop store`.`coffee shop sales`
 group by product_type  
 order by total_revenue DESC
 LIMIT 5;
 
-------------To Find Footfall  and Sales_revenue over store location------------
SELECT COUNT(transaction_qty) as Footfall, store_location, SUM(Total_bill)
 from `coffee shop store`.`coffee shop sales`
 group by store_location
 order by Footfall; 
 
 --------------To find Order and footfall over Weekdays-----------------------------
 SELECT COUNT(transaction_qty) as Footfall, Sum(Total_bill), Day_Name
 from  `coffee shop store`.`coffee shop sales`
 group by Day_Name
 order by Footfall;
 
----------------TO Find transaction_qty over Hours to find the pick hours of shop------------
 SELECT SUM(transaction_qty) as Orders, Hour 
 from `coffee shop store`.`coffee shop sales` 
 group by Hour 
 order by Orders;
 
 ---------------% size Distribution on Orders------------------
 SELECT Size, 
        (SUM(transaction_qty) / (SELECT SUM(transaction_qty)
										FROM `coffee shop store`.`coffee shop sales`)) *100 AS Percantage_qty 
 from  `coffee shop store`.`coffee shop sales`
 group by Size
 order by Percantage_qty DESC ;
 
 -------------To Find Categories % Distribution based on Sales---------------------
 SELECT product_category,
	    (SUM(transaction_qty) / (SELECT SUm(transaction_qty)
										FROM `coffee shop store`.`coffee shop sales`)) * 100 as Percentage_qty
 from  `coffee shop store`.`coffee shop sales`
 group by product_category
 order by Percentage_qty DESC;
 
 ----------------------TO Rename Column Day Name to Day_Name
ALTER TABLE  `coffee shop store`.`coffee shop sales` RENAME COLUMN `Day Name` TO Day_Name;
