# 🛒 Retail Sales SQL Analysis

## 📌 Project Overview

This project focuses on analyzing retail sales data using **SQL** to extract meaningful business insights from customer transactions.

The analysis covers customer behavior, sales performance, product categories, transaction patterns, and time-based sales trends using practical SQL queries.

The project is designed to demonstrate **real-world SQL skills required for Data Analyst and Business Intelligence roles**.

---

## 🗃️ Dataset

The project uses a retail sales transaction dataset containing the following fields:

| Column            | Description                   
 ----------------- | ----------------------------- 
 `transactions_id` | Unique transaction identifier 
 `sale_date`       | Date of the transaction       
 `sale_time`       | Time of the transaction       
 `customer_id`     | Unique customer identifier    
 `gender`          | Customer gender               
 `age`             | Customer age                  
 `category`        | Product category              
 `quantity`        | Number of units purchased     
 `price_per_unit`  | Price per unit                
 `cogs`            | Cost of goods sold            
 `total_sale`      | Total transaction value       

---

## 🛠️ Tech Stack

PostgreSQL
* SQL
* pgAdmin
* Git & GitHub

---

### 📊 SQL Analysis Performed

The project includes queries for:

### 1. Transaction Filtering

* Filtering transactions by product category
* Filtering transactions based on quantity
* Filtering transactions by specific date ranges

### 2. Sales & Aggregation

* Total sales
* Average sales
* Number of transactions
* Average customer age
* Category-wise sales analysis

### 3. Customer Analysis

* Top 5 customers based on total sales
* Number of unique customers by category
* Customer purchase behavior

### 4. Category Analysis

* Category-wise transaction count
* Gender-wise transactions within each category
* Category-wise customer analysis

### 5. Time-Based Analysis

* Monthly average sales
* Best-selling month for each year
* Shift-wise order analysis

### 6. Advanced SQL Concepts

The project also demonstrates practical usage of:

* `SELECT`
* `WHERE`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* `LIMIT`
* `COUNT()`
* `COUNT(DISTINCT)`
* `SUM()`
* `AVG()`
* `MAX()`
* `CASE WHEN`
* Date and time filtering
* Window functions
* `RANK()`
* `PARTITION BY`
* CTEs

---

## 🔎 Example Queries

### Top 5 Customers by Total Sales

```sql
SELECT 
    customer_id,
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
```

### Unique Customers by Category

```sql
SELECT
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;
```

### Shift-wise Number of Orders

```sql
SELECT
    CASE
        WHEN sale_time <= '12:00:00' THEN 'Morning'
        WHEN sale_time > '12:00:00'
             AND sale_time <= '17:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(transactions_id) AS number_of_orders
FROM retail_sales
GROUP BY
    CASE
        WHEN sale_time <= '12:00:00' THEN 'Morning'
        WHEN sale_time > '12:00:00'
             AND sale_time <= '17:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END;
```

---

## 🎯 Key Learning Outcomes

Through this project, I practiced:

* Writing structured SQL queries
* Aggregating and summarizing transactional data
* Analyzing customer purchasing behavior
* Performing category and gender-based analysis
* Working with date and time data
* Creating business-oriented metrics
* Using `CASE WHEN` for data classification
* Applying window functions for ranking
* Solving practical SQL problems similar to Data Analyst interviews

---

## 📂 Project Structure

```text
Retail-Sales-SQL/
│
├── sql/
│   └── retail_sales_queries.sql
│
├── data/
│   └── retail_sales.csv
│
└── README.md
```

---

## 🚀 How to Run

### 1. Clone the repository

```bash
git clone https://github.com/kaustubh526/<SQL_PRACTICE_PROJECT_1.0>.git
```

### 2. Open PostgreSQL / pgAdmin

Create a database and execute the table creation script.

### 3. Import the dataset

Load the retail sales dataset into the `retail_sales` table.

### 4. Run the SQL queries

Execute the queries from:

```text
sql/retail_sales_queries.sql
```

---

## 💡 Business Questions Answered

Some of the questions explored in this project include:

* Which customers generate the highest total sales?
* How many unique customers purchase from each category?
* Which category has the highest transaction activity?
* What is the average age of customers purchasing Beauty products?
* How many transactions occur across different genders and categories?
* What is the average monthly sale?
* Which month performs best in each year?
* During which shift are the most orders placed?

---

## 👨‍💻 Author

**Kaustubh Parashar**

B.Tech Computer Science
Data Analyst / Data Engineer Aspirant

### Connect with me

* GitHub: https://github.com/kaustubh526
* LinkedIn: https://linkedin.com/in/kaustubh-parashar-7630b332a
