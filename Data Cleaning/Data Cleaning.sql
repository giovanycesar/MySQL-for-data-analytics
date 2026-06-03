USE bakery;


Select * from customer_sweepstakes;

ALTER TABLE customer_sweepstakes RENAME COLUMN `ï»¿sweepstake_id` TO `sweepstake_id`;

SELECT 
    customer_id, COUNT(customer_id)
FROM
    customer_sweepstakes
GROUP BY customer_id
HAVING COUNT(customer_id) > 1;

SELECT * FROM (SELECT 
    customer_id, ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY customer_id) AS row_num
FROM
    customer_sweepstakes) AS table_row WHERE row_num>1;
    
DELETE FROM customer_sweepstakes
WHERE sweepstake_id IN (
	SELECT sweepstake_id 
	FROM (
		SELECT 
			sweepstake_id, ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY customer_id) AS row_num
		FROM
			bakery.customer_sweepstakes) AS table_row WHERE row_num>1);
            
SELECT 
    phone, REGEXP_REPLACE(phone, '[()-/+]', '')
FROM
    customer_sweepstakes;
    
UPDATE customer_sweepstakes 
SET 
    phone = REGEXP_REPLACE(phone, '[()-/+]', '');
    
SELECT 
    phone,
    CONCAT(SUBSTRING(phone, 1, 3),
            '-',
            SUBSTRING(phone, 4, 3),
            '-',
            SUBSTRING(phone, 7, 4))
FROM
    customer_sweepstakes
WHERE
    phone <> '';
    
UPDATE customer_sweepstakes 
SET 
    phone = CONCAT(SUBSTRING(phone, 1, 3),
            '-',
            SUBSTRING(phone, 4, 3),
            '-',
            SUBSTRING(phone, 7, 4))
WHERE
    phone <> '';
    
SELECT 
    phone
FROM
    customer_sweepstakes;
    
SELECT birth_date,
       STR_TO_DATE(birth_date, '%m/%d/%Y'),
       STR_TO_DATE(birth_date, '%Y/%d/%m')
FROM customer_sweepstakes;

SELECT 
    birth_date,
    IF(STR_TO_DATE(birth_date, '%m/%d/%Y') IS NOT NULL,
        STR_TO_DATE(birth_date, '%m/%d/%Y'),
        STR_TO_DATE(birth_date, '%Y/%d/%m'))
FROM
    customer_sweepstakes;
    
# Error

UPDATE customer_sweepstakes 
SET 
    birth_date = IF(STR_TO_DATE(birth_date, '%m/%d/%Y') IS NOT NULL,
        STR_TO_DATE(birth_date, '%m/%d/%Y'),
        STR_TO_DATE(birth_date, '%Y/%d/%m'));
        
# Error 2

UPDATE customer_sweepstakes 
SET 
    birth_date = CASE
        WHEN STR_TO_DATE(birth_date, '%m/%d/%Y') IS NOT NULL THEN STR_TO_DATE(birth_date, '%m/%d/%Y')
        WHEN STR_TO_DATE(birth_date, '%m/%d/%Y') IS NULL THEN STR_TO_DATE(birth_date, '%Y/%d/%m')
    END;
    
SELECT 
    birth_date,
    CONCAT(SUBSTRING(birth_date, 9, 2),
            '/',
            SUBSTRING(birth_date, 6, 2),
            '/',
            SUBSTRING(birth_date, 1, 4))
FROM
    customer_sweepstakes;
    
    
UPDATE customer_sweepstakes 
SET 
    birth_date = CONCAT(SUBSTRING(birth_date, 9, 2),
            '/',
            SUBSTRING(birth_date, 6, 2),
            '/',
            SUBSTRING(birth_date, 1, 4))
WHERE
    sweepstake_id IN (9 , 11);
    
SELECT 
    *
FROM
    customer_sweepstakes;

UPDATE customer_sweepstakes 
SET 
    birth_date = STR_TO_DATE(birth_date, '%m/%d/%Y');

SELECT 
    `Are you over 18?`
FROM
    customer_sweepstakes;

SELECT `Are you over 18?`,
       CASE
           WHEN `Are you over 18?` = 'Yes' THEN 'Y'
           WHEN `Are you over 18?` = 'No' THEN 'N'
           ELSE `Are you over 18?`
       END
FROM customer_sweepstakes;

UPDATE customer_sweepstakes 
SET 
    `Are you over 18?` = CASE
        WHEN `Are you over 18?` = 'Yes' THEN 'Y'
        WHEN `Are you over 18?` = 'No' THEN 'N'
        ELSE `Are you over 18?`
    END;
    
SELECT 
    *
FROM
    customer_sweepstakes;
    
SELECT 
    address,
    SUBSTRING_INDEX(address, ',', 1),
    SUBSTRING_INDEX(address, ',', 2),
    SUBSTRING_INDEX(address, ',', - 1)
FROM
    customer_sweepstakes;
    
SELECT 
    address,
    SUBSTRING_INDEX(address, ',', 1) AS street,
    SUBSTRING_INDEX(SUBSTRING_INDEX(address, ',', 2),
            ',',
            - 1) AS city,
    SUBSTRING_INDEX(address, ',', - 1) AS state
FROM
    customer_sweepstakes;
    
SELECT 
    *
FROM
    customer_sweepstakes;
    
ALTER TABLE customer_sweepstakes
ADD COLUMN street VARCHAR(50) AFTER address;

ALTER TABLE customer_sweepstakes
ADD COLUMN city VARCHAR(50) AFTER street,
ADD COLUMN state VARCHAR(50) AFTER city;

UPDATE customer_sweepstakes
SET street = SUBSTRING_INDEX(address, ',', 1);

UPDATE customer_sweepstakes 
SET 
    city = SUBSTRING_INDEX(SUBSTRING_INDEX(address, ',', 2),
            ',',
            - 1);
            
UPDATE customer_sweepstakes
SET state = SUBSTRING_INDEX(address, ',', -1);

SELECT 
    state
FROM
    customer_sweepstakes;
    
UPDATE customer_sweepstakes 
SET 
    state = UPPER(state);
    
SELECT 
    *
FROM
    customer_sweepstakes;
    
UPDATE customer_sweepstakes 
SET 
    city = TRIM(city);
    
UPDATE customer_sweepstakes 
SET 
    state = TRIM(state);