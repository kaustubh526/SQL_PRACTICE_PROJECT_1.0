create table retail_sales
(transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
)
--/////////////// Data Cleaning

select * from retail_sales
select count(*) from retail_sales
-- 

select * from retail_sales
where quantity is null
-- 

delete from retail_sales 
where quantity IS NULL

--//////////////// data exploration

-- how manny sales we have
select count(*)  as total_sale from retail_sales

-- how many ID's do we have
select count(distinct transactions_id) as unique_customers from retail_sales 

-- how many unique customers do we have 
select count(distinct customer_id) as unique_customers from retail_sales

-- how many category do we have
select count(distinct category ) as category_list from retail_sales

select distinct category as category_list from retail_sales

--//////////////// Data Analysis & Business Key Problems & Answers

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

select * from retail_sales 
where sale_date  = '2022-11-05'
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
SELECT
transactions_id,
quantity,
category
FROM retail_sales
WHERE category = 'Clothing'
  AND quantity <= 2
  AND sale_date BETWEEN '2022-11-01' AND '2022-11-30';

  
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select
category,
sum(total_sale) as sale_by_category
from retail_sales
group by category

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT 
    CAST(AVG(age) AS INT) AS average_age
FROM retail_sales
WHERE category = 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT 
* 
from retail_sales
where total_sale > 1000
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select 
gender,
category,
count(transactions_id) as transaction_count
from retail_sales
group by category, gender
order by gender, category
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT
    EXTRACT(YEAR FROM sale_date) AS year,
    EXTRACT(MONTH FROM sale_date) AS month,
    AVG(total_sale) AS avg_sale
FROM retail_sales
GROUP BY
    EXTRACT(YEAR FROM sale_date),
    EXTRACT(MONTH FROM sale_date)
ORDER BY year, month
//////////////////////////////////////////////////////

WITH monthly_sales AS (
    SELECT
        EXTRACT(YEAR FROM sale_date) AS year,
        EXTRACT(MONTH FROM sale_date) AS month,
        AVG(total_sale) AS avg_sale
    FROM retail_sales
    GROUP BY
        EXTRACT(YEAR FROM sale_date),
        EXTRACT(MONTH FROM sale_date)
),
ranked_months AS (
    SELECT *,
           RANK() OVER (
               PARTITION BY year
               ORDER BY avg_sale DESC
           ) AS rank
    FROM monthly_sales
)
SELECT
    year,
    month,
    avg_sale
FROM ranked_months
WHERE rank = 1
ORDER BY year;
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales
SELECT 
customer_id,
sum(total_sale) as highest_sale
from retail_sales
group by customer_id
order by sum(total_sale) desc
limit 5
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
SELECT
    CASE
        WHEN sale_time <= '12:00:00' THEN 'Morning'
        WHEN sale_time > '12:00:00' AND sale_time <= '17:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(transactions_id) AS number_of_orders
FROM retail_sales
GROUP BY
    CASE
        WHEN sale_time <= '12:00:00' THEN 'Morning'
        WHEN sale_time > '12:00:00' AND sale_time <= '17:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END;

