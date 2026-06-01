USE bakery;

Select * from product_suggestions;

ALTER TABLE product_suggestions
RENAME COLUMN `ï»¿product_suggestion_id`
TO `product_suggestion_id`;

CREATE TABLE product_suggestions2 (
    product_suggestion_id INT,
    product_suggestion_name TEXT,
    date_received TEXT,
    PRIMARY KEY (product_suggestion_id)
);

Select * from product_suggestions2;

SELECT * 
FROM (
 SELECT c.customer_id, first_name, order_total, ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_total DESC) as row_num 
FROM customers c 
JOIN customer_orders co 
   ON c.customer_id = co.customer_id ) AS row_table 
WHERE row_num < 3 ;