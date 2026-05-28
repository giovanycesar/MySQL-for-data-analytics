USE bakery;

SELECT 
    *
FROM
    customers
WHERE
    customer_id IN (SELECT 
            customer_id
        FROM
            customer_orders);
            
SELECT 
    *
FROM
    customers
WHERE
    customer_id IN (SELECT 
            customer_id
        FROM
            customer_orders
        WHERE
            tip > 1);
            
SELECT 
    *
FROM
    customers
WHERE
    total_money_spent > (SELECT 
            AVG(total_money_spent)
        FROM
            customers);
            
SELECT 
    *
FROM
    ordered_items;
    
SELECT 
    MAX(quantity*unit_price) AS total_order_price
FROM
    ordered_items
WHERE shipper_id = 1;


SELECT 
    order_id,
    shipper_id,
    quantity,
    unit_price,
    quantity * unit_price AS total_order_price
FROM
    ordered_items
WHERE
    quantity * unit_price > (SELECT 
            MAX(quantity * unit_price) AS total_order_price
        FROM
            ordered_items
        WHERE
            shipper_id = 1);
            
SELECT 
    order_id,
    shipper_id,
    quantity,
    unit_price,
    quantity * unit_price AS total_order_price
FROM
    ordered_items
WHERE
    quantity * unit_price > ALL (SELECT 
            quantity * unit_price AS total_order_price
        FROM
            ordered_items
        WHERE
            shipper_id = 1);
            
SELECT 
    order_id,
    shipper_id,
    quantity,
    unit_price,
    quantity * unit_price AS total_order_price
FROM
    ordered_items
WHERE
    quantity * unit_price >= ANY (SELECT 
            quantity * unit_price AS total_order_price
        FROM
            ordered_items
        WHERE
            shipper_id = 1);
      
SELECT 
    *
FROM
    customers c
WHERE
    EXISTS( SELECT 
            customer_id
        FROM
            customer_orders);
      
SELECT 
    *
FROM
    customers c
WHERE
    EXISTS( SELECT 
            customer_id
        FROM
            customer_orders
        WHERE
            customer_id = c.customer_id);
            

SELECT 
    product_id,
    quantity,
    (SELECT 
            ROUND(AVG(quantity), 2)
        FROM
            ordered_items) AS avg_quantity
FROM
    ordered_items;
    
SELECT 
    product_id,
    quantity,
    (SELECT 
            SUM(quantity)
        FROM
            ordered_items) AS sum_quantity,
    ROUND(quantity / (SELECT 
                    SUM(quantity)
                FROM
                    ordered_items),
            2) * 100 AS "%"
FROM
    ordered_items;
    
SELECT 
    product_id, avg_quantity
FROM
    (SELECT 
        product_id,
            quantity,
            (SELECT 
                    ROUND(AVG(quantity), 2)
                FROM
                    ordered_items) AS avg_quantity
    FROM
        ordered_items) AS avg_quant;