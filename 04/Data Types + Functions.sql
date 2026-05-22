USE bakery;

SELECT ROUND(123.45678, 2);

SELECT 
    sale_price, ROUND(sale_price, 1)
FROM
    products;
    
SELECT CEILING(5.7);

SELECT FLOOR(5.7);

SELECT 
    sale_price, CEILING(sale_price), FLOOR(sale_price)
FROM
    products;
    
SELECT ABS(- 4.5);

SELECT LENGTH('sky');

SELECT 
    first_name, LENGTH(first_name) AS Len_first
FROM
    customers
ORDER BY Len_first;

SELECT 
    first_name, UPPER(first_name), LOWER(first_name)
FROM
    customers;
    
SELECT "     sky      ", TRIM('     sky'), LTRIM("     sky      "), RTRIM("     sky      ");

SELECT 
    first_name, LEFT(first_name, 3), RIGHT(first_name, 3)
FROM
    customers;
    
SELECT 
    phone, SUBSTRING(phone, 1, 3), SUBSTRING(phone, 5, 3), SUBSTRING(phone, 9, 3)
FROM
    customers;
    
SELECT 
    REPLACE(phone,"-","")
FROM
    customers;
    
SELECT 
    first_name, LOCATE("Mic",first_name)
FROM
    customers;
    
SELECT 
    phone,
    SUBSTRING(phone, 1, 3),
    SUBSTRING(phone, 5, 3),
    SUBSTRING(phone, 9, 3),
    CONCAT(SUBSTRING(phone, 1, 3),
            SUBSTRING(phone, 5, 3),
            SUBSTRING(phone, 9, 3))
FROM
    customers;
    
SELECT NOW(), CURDATE(), CURTIME();

SELECT YEAR(NOW()), MONTH(NOW()), DAY(NOW());

SELECT 
    *
FROM
    customer_orders
WHERE
    YEAR(order_date) = YEAR(NOW()) - 4;
    
SELECT 
    order_date, DAYNAME(order_date), MONTHNAME(order_date)
FROM
    customer_orders;
    
SELECT 
    birth_date, DATE_FORMAT(birth_date, '%M %d, %Y')
FROM
    customers;
    
SELECT 
    birth_date, DATE_FORMAT(birth_date, '%m-%d-%Y')
FROM
    customers;
    
SELECT 
    tip, IF(tip > 1, 'Amazing', 'Cheap')
FROM
    customer_orders;
    
SELECT 
    tip, order_total,
    IF(tip >2,
        order_total * 0.75,
        order_total * 1.10) AS new_total
FROM
    customer_orders;
    