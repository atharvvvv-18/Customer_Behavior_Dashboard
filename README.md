# Customer Behaviour Analysis Dashboard

## Overview
The **Customer Behaviour Analysis Dashboard** is a data analytics project that analyzes customer shopping patterns and generates business insights using **SQL, Python, and Power BI**.

The project transforms raw customer transaction data into an **interactive Power BI dashboard** that helps understand purchasing trends, product performance, customer demographics, and revenue distribution.

This analysis helps businesses make **data-driven decisions** regarding marketing strategies, discount policies, product performance, and customer retention.

---

## Tech Stack

- **SQL** – Data querying and analysis  
- **Python (Jupyter Notebook)** – Data exploration and preprocessing  
- **Power BI** – Dashboard and data visualization  
- **CSV Dataset** – Customer shopping behavior data  

---

## Dataset Description

The dataset contains customer shopping behavior information including:

- Customer ID
- Gender
- Age Group
- Product Category
- Item Purchased
- Purchase Amount
- Review Rating
- Shipping Type
- Discount Applied
- Subscription Status
- Previous Purchases

This dataset is used to analyze **customer purchasing patterns and product performance**.

---

## Key Business Questions Answered

This project answers several important business questions:

- Which **customer segment generates the most revenue?**
- What are the **top rated products?**
- Which **products receive the most discounts?**
- How do **shipping methods affect spending behavior?**
- Do **subscription customers spend more than non-subscribers?**
- Which **age group contributes the most to revenue?**
- What are the **top selling products in each category?**

---

## Key SQL Analysis

### Revenue by Gender

```sql
SELECT gender, SUM(purchase_amount) AS revenue
FROM customer
GROUP BY gender;
```

### Top Rated Products

```sql
SELECT item_purchased,
ROUND(AVG(review_rating),2) AS avg_rating
FROM customer
GROUP BY item_purchased
ORDER BY avg_rating DESC
LIMIT 5;
```

### Subscription vs Revenue

```sql
SELECT subscription_status,
COUNT(customer_id) AS total_customers,
ROUND(AVG(purchase_amount),2) AS avg_spend,
SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY subscription_status;
```

### Top Products by Category (Window Function)

```sql
ROW_NUMBER() OVER(
PARTITION BY category
ORDER BY COUNT(customer_id) DESC
)
```

Used to identify the **Top 3 best selling items in each category**.

---

## Power BI Dashboard Features

The interactive dashboard includes:

- Revenue by Gender
- Revenue by Age Group
- Top Rated Products
- Subscription vs Non-Subscription Revenue
- Discount Impact on Products
- Shipping Type Analysis
- Category-wise Top Selling Products

### Dashboard Capabilities

- Interactive filters
- KPI cards
- Bar charts and ranking visuals
- Dynamic insights into customer behavior

---

## Project Workflow

### 1. Data Collection
Customer shopping dataset collected in CSV format.

### 2. Data Exploration
Initial exploration performed using **Python (Jupyter Notebook)**.

### 3. Data Analysis
SQL queries used to analyze:
- Customer spending patterns
- Product ratings
- Discount impact
- Revenue distribution

### 4. Data Visualization
Power BI used to create an **interactive dashboard for business insights**.

---

## Key Insights

Important insights derived from the analysis:

- Certain **age groups contribute significantly more revenue**
- **Subscription customers show higher repeat purchases**
- Discounts influence **high value purchases**
- Some products consistently receive **higher customer ratings**
- Shipping type impacts **average purchase value**

---

## Project Structure

```
Customer-Behaviour-Analysis
│
├── dataset
│   └── customer_shopping_behavior.csv
│
├── sql
│   └── customer_behaviour.sql
│
├── notebooks
│   └── customer_behaviour.ipynb
│
├── dashboard
│   └── Customer Behaviour Dashboard.pbix
│
└── README.md
```

---

## Future Improvements

Potential improvements for the project:

- Customer segmentation using **Machine Learning**
- Predictive analysis for **customer churn**
- Time-series analysis for **sales trends**
- Deploy dashboard using **Power BI Service**
- Automate data pipelines

---

## Author

**Atharv Pawar**

Data Analytics Enthusiast  
SQL | Python | Power BI | Data Visualization

---

## License

This project is open source and available under the **MIT License**.
