USE bakery;

SELECT 
    *
FROM
    customers c
        INNER JOIN
    customer_orders co ON c.customer_id = co.customer_id
ORDER BY c.customer_id; 

SELECT 
    product_name, SUM(order_total) AS total
FROM
    products p
        INNER JOIN
    customer_orders co ON p.product_id = co.product_id
GROUP BY product_name
ORDER BY 2;

SELECT 
    *
FROM
    suppliers;

SELECT 
    *
FROM
    ordered_items;
    
SELECT 
   *
FROM
    suppliers s
        INNER JOIN
    ordered_items oi ON s.supplier_id = oi.shipper_id;
    
SELECT 
    product_name, order_total, first_name
FROM
    products p
        JOIN
    customer_orders co ON p.product_id = co.product_id
        JOIN
    customers c ON co.customer_id = c.customer_id; 
    
SELECT 
    *
FROM
    customer_orders;
    
SELECT 
    *
FROM
    customer_orders_review;
    
SELECT 
    *
FROM
    customer_orders co
        JOIN
    customer_orders_review cor ON co.order_id = cor.order_id
        AND co.customer_id = cor.customer_id
        AND co.order_date = cor.order_date; 
        
SELECT 
    c.customer_id, first_name, co.order_id
FROM
    customers c
        LEFT JOIN
    customer_orders co ON c.customer_id = co.customer_id
ORDER BY c.customer_id , co.order_id;

SELECT 
    c.customer_id, first_name, co.order_id
FROM
    customers c
        RIGHT JOIN
    customer_orders co ON c.customer_id = co.customer_id
ORDER BY c.customer_id , co.order_id;

SELECT 
    c.customer_id, c.first_name, c.last_name, ss.customer_id, ss.first_name, ss.last_name
FROM
    customers c
        JOIN
    customers ss ON c.customer_id = ss.customer_id+1;
    
SELECT 
    c.customer_id, c.first_name, co.customer_id, order_id
FROM
    customers c
        CROSS JOIN
    customer_orders co
ORDER BY c.customer_id;

SELECT 
    *
FROM
    products p
        NATURAL JOIN
    customer_orders co
ORDER BY p.product_id;

SELECT 
    c.customer_id, first_name, co.order_id
FROM
    customers c
        LEFT JOIN
    customer_orders co USING (customer_id)
ORDER BY c.customer_id , co.order_id;

SELECT 
    first_name, last_name
FROM
    customers 
UNION SELECT 
    product_id, product_name
FROM
    products;
    
SELECT 
    *
FROM
    customer_orders;

SELECT 
    first_name, last_name, 'Old' AS Label
FROM
    customers
WHERE
    YEAR(birth_date) < 1950 
UNION DISTINCT SELECT 
    first_name, last_name, 'Good Tipper'
FROM
    customers c
        JOIN
    customer_orders co ON c.customer_id = co.customer_id
WHERE
    tip > 3 
UNION DISTINCT SELECT 
    first_name, last_name, 'Big Spender'
FROM
    customers c
WHERE
    total_money_spent > 1000
ORDER BY first_name; 

SELECT 
    first_name, last_name, 'Old' AS Label
FROM
    customers
WHERE
    YEAR(birth_date) < 1950 
UNION ALL SELECT 
    first_name, last_name, 'Old' AS Label
FROM
    customers
WHERE
    YEAR(birth_date) < 1950;