Overview

The Customer Behaviour Analysis Dashboard is a data analytics project designed to analyze customer shopping patterns and generate business insights using SQL, Python, and Power BI.

This project transforms raw customer transaction data into interactive visual dashboards that help identify purchasing trends, product performance, customer segments, and revenue distribution.

The dashboard enables businesses to make data-driven decisions regarding marketing strategies, product placement, discount policies, and customer engagement.

Project Preview

(Add a screenshot of your Power BI dashboard here)

Example:

![Dashboard Screenshot](dashboard.png)
Tech Stack
Technology	Purpose
SQL	Data querying and analysis
Python (Jupyter Notebook)	Data exploration and preprocessing
Power BI	Data visualization and dashboard creation
CSV Dataset	Customer shopping behavior data
Dataset Information

The dataset contains customer purchase records and behavioral attributes including:

Customer ID

Gender

Age Group

Product Category

Item Purchased

Purchase Amount

Review Rating

Shipping Type

Discount Applied

Subscription Status

Previous Purchases

This data helps in analyzing customer demographics, product popularity, and revenue patterns.

Key Business Questions Answered

This project answers several important business questions:

Which customer segment generates the highest revenue?

What are the top rated products?

Which products receive the most discounts?

How do shipping methods affect spending behavior?

Do subscription customers spend more than non-subscribers?

Which age group contributes the most to sales?

What are the top selling products in each category?

Key SQL Analysis
Revenue by Gender
SELECT gender, SUM(purchase_amount) AS revenue
FROM customer
GROUP BY gender;
Top Rated Products
SELECT item_purchased,
ROUND(AVG(review_rating),2) AS avg_rating
FROM customer
GROUP BY item_purchased
ORDER BY avg_rating DESC
LIMIT 5;
Subscription vs Revenue
SELECT subscription_status,
COUNT(customer_id) AS total_customers,
ROUND(AVG(purchase_amount),2) AS avg_spend,
SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY subscription_status;
Top Products by Category (Window Function)
ROW_NUMBER() OVER(
PARTITION BY category
ORDER BY COUNT(customer_id) DESC
)

Used to identify the Top 3 best selling items in each category.

Power BI Dashboard Features

The interactive dashboard includes:

Revenue by Gender

Revenue by Age Group

Top Rated Products

Subscription vs Non-Subscription Revenue

Discount Impact on Products

Shipping Type Analysis

Category Wise Top Selling Products

Dashboard Capabilities

Interactive filters

KPI cards

Bar charts and ranking visuals

Dynamic insights for customer behavior

Project Workflow
1 Data Collection

Customer shopping dataset collected in CSV format.

2 Data Exploration

Initial exploration and validation using Python (Jupyter Notebook).

3 Data Analysis

SQL queries used to analyze:

Customer spending

Product ratings

Discount impact

Revenue distribution

4 Data Visualization

Power BI used to build an interactive dashboard for business insights.

Key Insights

Some important insights derived from the analysis:

Certain age groups contribute significantly more revenue.

Subscription customers show higher repeat purchases.

Discounts significantly influence high value purchases.

Some products consistently receive higher customer ratings.

Shipping type affects average purchase value.

Project Structure
Customer-Behaviour-Analysis
│
├── dataset
│   └── customer_shopping_behavior.csv
│
├── sql
│   └── customer_behaviour.sql
│
├── notebooks
│   └── customer_behaviour.py.ipynb
│
├── dashboard
│   └── Customer Behaviour Dashboard.pbix
│
└── README.md
Future Improvements

Potential enhancements for the project:

Customer segmentation using Machine Learning

Predictive analysis for customer churn

Time series analysis for sales trends

Deploy dashboard using Power BI Service

Add automated data pipelines
