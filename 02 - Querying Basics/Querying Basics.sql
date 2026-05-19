USE bakery;

SELECT 
    customer_id, first_name
FROM
    customers;

SELECT 
    *
FROM
    customer_orders
Where product_id = 1001;

SELECT 
    last_name,
    first_name,
    birth_date,
    phone,
    city,
    state,
    total_money_spent,
    (total_money_spent + 100)*10 as calculation
FROM
    customers;
    
SELECT DISTINCT
    state
FROM
    customers;
    
SELECT DISTINCT
    city, state
FROM
    customers;
    
SELECT 
    *
FROM
    customers
WHERE
    total_money_spent > 3000;
    
    
SELECT 
    *
FROM
    customers
WHERE
    city = "Scranton";
    
SELECT 
    *
FROM
    customers
WHERE
    birth_date > "1985-01-01";
    
SELECT 
    *
FROM
    products
WHERE
    units_in_stock < 30;
    
SELECT 
    *
FROM
    customer_orders
WHERE
    tip = 1;
    
SELECT 
    *
FROM
    customer_orders
WHERE
    tip >= 5;
    
SELECT 
    *
FROM
    customer_orders
WHERE
    tip <= 5;
    
SELECT 
    *
FROM
    customers
WHERE
    state = 'PA'
        AND total_money_spent > 1000;
        
SELECT 
    *
FROM
    customers
WHERE
    state = 'PA'
        OR total_money_spent > 1000;
        
SELECT 
    *
FROM
    customers
WHERE
    (state = 'PA' OR city = 'New York')
        AND total_money_spent > 1000;
        
SELECT 
    *
FROM
    customers
WHERE
    (state = 'PA'
        AND total_money_spent > 1000)
        OR birth_date > '1998-01-01';
        
SELECT 
    *
FROM
    customers
WHERE
    NOT state = 'PA';
    
SELECT 
    *
FROM
    customers
WHERE
    NOT total_money_spent > 1000;
    
SELECT 
    *
FROM
    customers
WHERE
    NOT (total_money_spent > 1000
        AND state = 'TX');