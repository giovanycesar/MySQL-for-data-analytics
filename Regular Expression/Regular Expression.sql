USE bakery;

SELECT 
    *
FROM
    customers
WHERE
    first_name LIKE '%k%';
    
SELECT 
    *
FROM
    customers
WHERE
    first_name REGEXP 'k';
    
SELECT 
    first_name, REGEXP_REPLACE(first_name, "a", "b")
FROM
    customers;
    
SELECT 
    first_name, REGEXP_LIKE(first_name, "a")
FROM
    customers;
    
SELECT 
    first_name, REGEXP_INSTR(first_name, "a")
FROM
    customers;
    
SELECT 
    first_name, REGEXP_SUBSTR(first_name, "char")
FROM
    customers;
    
SELECT 
    *
FROM
    customers
WHERE
    first_name REGEXP 'k';
    
SELECT 
    *
FROM
    customers
WHERE
    first_name REGEXP '[a-c]';
    
SELECT 
    *
FROM
    customers
WHERE
    total_money_spent REGEXP '[0-1]';
    
SELECT 
    *
FROM
    customers
WHERE
    phone REGEXP '.';
    
SELECT 
    *
FROM
    customers
WHERE
    phone REGEXP '6.';
    
SELECT 
    *
FROM
    customers
WHERE
    first_name REGEXP 'k...n';
    
SELECT 
    *
FROM
    customers
WHERE
    first_name REGEXP '^k';
    
SELECT 
    *
FROM
    customers
WHERE
    first_name REGEXP 'n$';
    
SELECT 
    *
FROM
    customers
WHERE
    first_name REGEXP 'Obi.*';
    
SELECT 
    *
FROM
    customers
WHERE
    first_name REGEXP 'Obi.+';
    
SELECT 
    *
FROM
    customers
WHERE
    first_name REGEXP 'Obi.?';

SELECT 
    *
FROM
    customers
WHERE
    first_name REGEXP 'k.?n';
    
SELECT 
    *
FROM
    customers
WHERE
    first_name REGEXP 'k.{3}n';
    
    
SELECT 
    *
FROM
    customers
WHERE
    first_name REGEXP 'kev|fro';
    
SELECT 
    *
FROM
    z_regular_expression;
    
SELECT 
    *
FROM
    z_regular_expression
WHERE
    email REGEXP '@gmail';
    
SELECT 
    email, REGEXP_SUBSTR(email, '@.+')
FROM
    z_regular_expression;
    
SELECT 
    email, REGEXP_SUBSTR(email, '@[a-z]+')
FROM
    z_regular_expression;
    
SELECT 
    phone
FROM
    z_regular_expression
WHERE phone REGEXP "[0-9]{3}.[0-9]{3}.[0-9]{4}";

SELECT 
    *
FROM
    z_regular_expression
Where phrase REGEXP ".+SQL.+";

SELECT 
    *
FROM
    z_regular_expression
Where phrase REGEXP "^SQL";

SELECT 
    *
FROM
    z_regular_expression
Where phrase REGEXP "SQL$";

