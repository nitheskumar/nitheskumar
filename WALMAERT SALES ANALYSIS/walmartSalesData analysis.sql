CREATE DATABASE IF NOT EXISTS Walmartsalesdata;
use walmartsalesdata;

CREATE TABLE IF NOT EXISTS sales (
            invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
            Branch VARCHAR(5) NOT NULL,
            City VARCHAR(30) NOT NULL,
            Customertype VARCHAR(30) NOT NULL,
            Gender VARCHAR(30) NOT NULL,
            Product_line VARCHAR(100) NOT NULL,
			Unitprice DECIMAL(15,2) NOT NULL,
            Quantity INT NOT NULL,
            Tax_pct FLOAT(6,4) NOT NULL,
	        Total DECIMAL (12,4) NOT NULL,
            Date DATETIME NOT NULL,
            Time TIME NOT NULL,
            Payment VARCHAR(30) NOT NULL,
            cogs DECIMAL(10,2) NOT NULL,
            gross_margin_percentage	FLOAT(11,9) ,
            gross_income DECIMAL (12,4),
            Rating FLOAT(2,1)
            );
            
            
            -- DATA CLEANING --
            
            
SELECT * FROM sales;
            
SELECT
	time,
	(CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END) AS time_of_day
FROM sales;

ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;

UPDATE sales  
SET time_of_day = (  
    CASE  
        WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"  
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"  
        ELSE "Evening"  
    END  
);

SET SQL_SAFE_UPDATES = 1;


                                     -- day name--
                                     
SELECT 
     date,
     DAYNAME (date)
FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;

UPDATE sales
SET day_name = DAYNAME (date);

SET SQL_SAFE_UPDATES = 1;
            
									-- month name--
                                    
SELECT 
     date,
     MONTHNAME (date)
FROM sales;           

ALTER TABLE sales ADD COLUMN month_name VARCHAR (20);                         
                                    
SET SQL_SAFE_UPDATES = 0;

UPDATE sales
SET month_name = MONTHNAME (date);

SET SQL_SAFE_UPDATES = 1;




									 -- year --
SELECT 
     date,
     YEAR (date)
FROM sales;           

ALTER TABLE sales ADD COLUMN sales_year int;

SET SQL_SAFE_UPDATES = 0;

UPDATE sales
SET sales_year = YEAR (date);

SET SQL_SAFE_UPDATES = 1;


                                   -- distinct --
                                   
SELECT
      DISTINCT city
FROM sales;	


SELECT
      DISTINCT Branch
FROM sales;	

SELECT
      DISTINCT Customertype
FROM sales;	

SELECT
      DISTINCT Gender
FROM sales;	

SELECT
      DISTINCT product_line
FROM sales;	

SELECT
      DISTINCT payment
FROM sales;	

                                       --  Total revenue by month --

SELECT 
     month_name AS month,
     SUM(total) AS total_revenue 
FROM sales
GROUP BY month_name
ORDER BY total_revenue DESC;

SELECT 
     product_line AS Unitprice,
     SUM(Unitprice) AS Unitprice
FROM sales
GROUP BY product_line
ORDER BY Unitprice DESC;




                                     -- what month had the largest COGS --

SELECT 
     month_name AS month,
     SUM(cogs) AS cogs 
FROM sales
GROUP BY month_name
ORDER BY cogs;
     
     
SELECT 
     payment AS Total,
     SUM(Total) AS Total
FROM sales
GROUP BY payment
ORDER BY Total;
     
                                    -- ORDER BY --
                                    
SELECT
    *
FROM sales
ORDER BY payment; 

SELECT
    *
FROM sales
ORDER BY Customertype; 


SELECT
    *
FROM sales
ORDER BY City;    


SELECT
    *
FROM sales
ORDER BY product_line;     


SELECT
    *
FROM sales
ORDER BY payment;  

                        -- What is the gender of most of the customers?


SELECT
	gender,
	COUNT(*) as gender_cnt
FROM sales
GROUP BY gender
ORDER BY gender_cnt DESC;

                                   -- What is the gender distribution per branch?
SELECT
	gender,
	COUNT(*) as gender_cnt
FROM sales
WHERE branch = "C"
GROUP BY gender
ORDER BY gender_cnt DESC;

SELECT
	time_of_day,
	COUNT(*) AS total_sales
FROM sales
WHERE day_name = "Sunday"
GROUP BY time_of_day 
ORDER BY total_sales DESC;



                              -- Which city has the largest tax/VAT percent?
SELECT
	city,
    ROUND(AVG(tax_pct), 2) AS avg_tax_pct
FROM sales
GROUP BY city 
ORDER BY avg_tax_pct DESC;

                                -- Which customer type pays the most in VAT?
SELECT
	customertype,
	AVG(tax_pct) AS total_tax
FROM sales
GROUP BY customertype
ORDER BY total_tax;
