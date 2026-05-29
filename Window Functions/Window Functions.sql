USE bakery;

SELECT 
    c.customer_id, first_name, SUM(order_total)
FROM
    customers c
        JOIN
    customer_orders co ON c.customer_id = co.customer_id
GROUP BY c.customer_id, first_name;

SELECT 
    c.customer_id, first_name, order_total, MAX(order_total) OVER() AS max_order_total
FROM
    customers c
        JOIN
    customer_orders co ON c.customer_id = co.customer_id;
    
SELECT 
    c.customer_id, first_name, order_total, MAX(order_total) OVER(PARTITION BY c.customer_id) AS max_order_total
FROM
    customers c
        JOIN
    customer_orders co ON c.customer_id = co.customer_id;
    
SELECT 
    ROW_NUMBER() OVER(PARTITION BY c.customer_id ORDER BY order_total DESC) AS row_num, c.customer_id, first_name, order_total
FROM
    customers c
        JOIN
    customer_orders co ON c.customer_id = co.customer_id
WHERE row_num < 3;

SELECT * FROM (
SELECT 
    ROW_NUMBER() OVER(PARTITION BY c.customer_id ORDER BY order_total DESC) AS row_num, c.customer_id, first_name, order_total
FROM
    customers c
        JOIN
    customer_orders co ON c.customer_id = co.customer_id) AS row_table WHERE row_num < 3;
    
SELECT 
    *, RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank_row
FROM
    employees;
    
SELECT * FROM (SELECT 
    *, RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank_row
FROM
    employees) AS ranked WHERE rank_row<3;
    
SELECT 
    *, DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank_row
FROM
    employees;
    
SELECT 
    *, RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank_row, DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dense_row
FROM
    employees;
    
SELECT *, LAG(salary) OVER(), LEAD(salary) OVER() FROM employees;

SELECT *, lag_col - salary AS pay_discrepancy FROM (SELECT *, LAG(salary) OVER(PARTITION BY department ORDER BY employee_id) AS lag_col FROM employees) lag_table;

SELECT *, lead_col - salary AS pay_discrepancy FROM (SELECT *, LEAD(salary) OVER(PARTITION BY department ORDER BY employee_id) AS lead_col FROM employees) lead_table;

SELECT *, IF(salary > lag_col, "More", IF(salary = lag_col, "Equal", "Less")) AS pay_discrepancy FROM (SELECT *, LAG(salary) OVER(PARTITION BY department ORDER BY employee_id) AS lag_col FROM employees) lag_table;
