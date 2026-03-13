select * from customer limit 20;

 Select gender, sum(purchase_amount) as revenue
 from customer
 group by gender;
 
 select customer_id,purchase_amount
 from customer 
 where discount_applied = 'YES' and purchase_amount >= (select AVG(purchase_amount) from customer);
 
 SELECT item_purchased,ROUND(avg(review_rating),2) as "Average product Rating"
 from customer
 group by item_purchased
 order by avg(review_rating) desc
 limit 5;
 
 select shipping_type,
 ROUND(AVG(Purchase_amount),2)
 from customer
 where shipping_type in ('standard','express')
 group by shipping_type;
 
 select subscription_status,
 count(customer_id) as total_customer,
 round(avg(purchase_amount),2) as avg_spend,
 round(SUM(purchase_amount),2) as total_revenue
 from customer
 group by subscription_status
 order by total_revenue, avg_spend desc;
 
SELECT item_purchased,
ROUND(100 * SUM(CASE WHEN discount_applied = "YES" THEN 1 ELSE 0 END) / COUNT(*), 2) AS discount_rate
FROM customer
GROUP BY item_purchased
ORDER BY discount_rate DESC
LIMIT 5;

WITH item_counts AS (
    SELECT 
        category,
        item_purchased,
        COUNT(customer_id) AS total_orders,
        ROW_NUMBER() OVER (
            PARTITION BY category 
            ORDER BY COUNT(customer_id) DESC
        ) AS item_rank
    FROM customer
    GROUP BY category, item_purchased
)

SELECT 
    item_rank,
    category,
    item_purchased,
    total_orders
FROM item_counts
WHERE item_rank <= 3;

select subscription_status,
count(customer_id) as repeat_buyers
from customer
where previous_purchases >5
group by subscription_status;

select age_group ,
sum(purchase_amount) as total_revenue
from customer 
group by age_group 
order by total_revenue desc;