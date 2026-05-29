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
        
SELECT 
    *
FROM
    customers
WHERE
    state = 'TX' OR state = 'PA'
        OR state = 'IL';

# IN e NOT IN
        
SELECT 
    *
FROM
    customers
WHERE
    state IN ('TX' , 'PA', 'IL');
    
SELECT 
    *
FROM
    customers
WHERE
    first_name IN ('Kevin' , 'Kelly', 'Frodo');
    
SELECT 
    *
FROM
    customers
WHERE
    first_name NOT IN ('Kevin' , 'Kelly', 'Frodo');
    
# BETWEEN

SELECT 
    *
FROM
    customers
WHERE
    total_money_spent BETWEEN 500 AND 1000;
    
SELECT 
    *
FROM
    customers
WHERE
    total_money_spent >= 500 AND total_money_spent <= 1000;
    
SELECT 
    *
FROM
    customers
WHERE
    birth_date BETWEEN "1990-01-01" AND "2020-01-01";
    
SELECT 
    *
FROM
    customers
WHERE
    city BETWEEN "Dallas" AND "Scranton";
    
SELECT 
    *
FROM
    customers
WHERE
    city BETWEEN "D" AND "S";
    
# LIKE
    
SELECT 
    *
FROM
    customers
WHERE
    first_name Like "K%";
    
SELECT 
    *
FROM
    customers
WHERE
    first_name Like "%n";
    
SELECT 
    *
FROM
    customers
WHERE
    first_name Like "%n%";
    
SELECT 
    *
FROM
    customers
WHERE
    first_name Like "%n%";

SELECT 
    *
FROM
    customers
WHERE
    first_name Like "__n";
    
SELECT 
    *
FROM
    customers
WHERE
    first_name Like "_o_";
    
SELECT 
    *
FROM
    customers
WHERE
    first_name Like "___kin";
    
SELECT 
    *
FROM
    customers
WHERE
    last_name Like "S______%";
    
SELECT 
    *
FROM
    customers
WHERE
    phone Like "975%";

# ORDER BY
    
SELECT 
    *
FROM
    customers
ORDER BY first_name DESC;

SELECT 
    *
FROM
    customers
ORDER BY state DESC, total_money_spent DESC;

SELECT 
    *
FROM
    customers
ORDER BY 8 DESC, 9 ASC;

# LIMIT

SELECT 
    *
FROM
    customers
ORDER BY total_money_spent DESC
LIMIT 5;

SELECT 
    *
FROM
    customers
ORDER BY total_money_spent DESC
LIMIT 5 , 3;

# Aliasing

SELECT 
    units_in_stock * sale_price AS potential_revenue
FROM
    products;
    
SELECT 
    p.units_in_stock * p.sale_price AS potential_revenue
FROM
    products AS p;