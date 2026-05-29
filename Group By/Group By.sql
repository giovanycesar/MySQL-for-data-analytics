USE bakery;

   
SELECT 
    customer_id, SUM(tip) AS total_tips
FROM
    customer_orders
GROUP BY customer_id;

SELECT 
    product_id, ROUND(AVG(order_total), 2)
FROM
    customer_orders
GROUP BY product_id
ORDER BY AVG(order_total) DESC;

SELECT 
    customer_id, AVG(tip) AS avg_tips
FROM
    customer_orders
GROUP BY customer_id
ORDER BY avg_tips;

SELECT 
    customer_id, MAX(tip) AS biggest_tips
FROM
    customer_orders
GROUP BY customer_id
ORDER BY biggest_tips;

SELECT 
    customer_id, MIN(tip) AS smallest_tips
FROM
    customer_orders
GROUP BY customer_id
ORDER BY smallest_tips;

SELECT 
    customer_id, COUNT(tip) AS count_of_tips
FROM
    customer_orders
GROUP BY customer_id
ORDER BY count_of_tips;

Select product_id, tip, COUNT(tip), COUNT(DISTINCT tip)
From customer_orders
GROUP BY product_id, tip
ORDER BY product_id;

SELECT 
    customer_id, SUM(tip) AS total_tip
FROM
    customer_orders
GROUP BY customer_id
HAVING total_tip > 5;

SELECT 
    *
FROM
    customer_orders;
    
SELECT 
    customer_id, SUM(order_total) AS total
FROM
    customer_orders
GROUP BY customer_id
HAVING total > 40
ORDER BY 2;

SELECT 
    customer_id, SUM(tip) AS total_tip
FROM
    customer_orders
GROUP BY customer_id WITH ROLLUP;

SELECT 
    customer_id, COUNT(tip) AS count_tips
FROM
    customer_orders
GROUP BY customer_id WITH ROLLUP;