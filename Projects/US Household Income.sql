USE us_project;

SELECT * FROM us_project.us_household_income;

SELECT * FROM us_project.us_household_income_statistics;

ALTER TABLE us_household_income_statistics RENAME COLUMN `ï»¿id` TO `id`;

SELECT 
    id, COUNT(id) AS total
FROM
    us_project.us_household_income
GROUP BY id
HAVING COUNT(id) > 1;

SELECT *
FROM (
    SELECT row_id,
           id,
           ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) AS row_num
    FROM us_project.us_household_income
) duplicates
WHERE row_num > 1;

DELETE FROM us_household_income
WHERE row_id IN (
SELECT row_id
FROM (
    SELECT row_id,
           id,
           ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) AS row_num
    FROM us_project.us_household_income
) duplicates
WHERE row_num > 1);

SELECT DISTINCT
    State_Name
FROM
    us_project.us_household_income
ORDER BY State_Name;

UPDATE us_project.us_household_income 
SET 
    State_Name = 'Georgia'
WHERE
    State_Name = 'georia';
    
UPDATE us_household_income 
SET 
    State_Name = 'Alabama'
WHERE
    State_Name = 'alabama';
    
SELECT 
    *
FROM
    us_household_income
WHERE
    County = 'Autauga County'
ORDER BY 1;

UPDATE us_household_income 
SET 
    Place = 'Autaugaville'
WHERE
    County = 'Autauga County'
        AND City = 'Vinemont';
        
SELECT 
    Type, COUNT(Type) AS total
FROM
    us_project.us_household_income
GROUP BY Type;

UPDATE us_household_income 
SET 
    Type = 'Borough'
WHERE
    Type = 'Boroughs';
    
SELECT 
    ALand, AWater
FROM
    us_project.us_household_income
WHERE
    AWater = 0 OR AWater = ''
        OR AWater IS NULL;
        
SELECT 
    ALand, AWater
FROM
    us_project.us_household_income
WHERE
    ALand = 0 OR ALand = '' OR ALand IS NULL;
    
SELECT 
    State_Name, County, City, ALand, AWater
FROM
    us_household_income;

SELECT 
    State_Name,
    SUM(ALand) AS total_land,
    SUM(AWater) AS total_water
FROM
    us_project.us_household_income
GROUP BY State_Name
ORDER BY total_land DESC
LIMIT 10;

SELECT 
    *
FROM
    us_project.us_household_income u
        JOIN
    us_project.us_household_income_statistics us ON u.id = us.id;
    
SELECT 
    *
FROM
    us_project.us_household_income u
        RIGHT JOIN
    us_project.us_household_income_statistics us ON u.id = us.id
WHERE u.id IS NULL;

SELECT 
    *
FROM
    us_project.us_household_income u
        JOIN
    us_project.us_household_income_statistics us ON u.id = us.id
WHERE Mean <> 0;

SELECT u.State_Name, 
       u.County, 
       u.Type, 
       u.`Primary`, 
       us.Mean, 
       us.Median
FROM us_household_income u
INNER JOIN us_household_income_statistics us
    ON u.id = us.id
WHERE us.Mean <> 0;

SELECT 
    u.State_Name,
    ROUND(AVG(us.Mean), 1),
    ROUND(AVG(us.Median), 1)
FROM
    us_household_income u
        INNER JOIN
    us_household_income_statistics us ON u.id = us.id
WHERE
    us.Mean <> 0
GROUP BY u.State_Name
ORDER BY 2 DESC
LIMIT 10;

SELECT 
    u.Type,
    COUNT(u.Type),
    ROUND(AVG(us.Mean), 1),
    ROUND(AVG(us.Median), 1)
FROM
    us_household_income u
        INNER JOIN
    us_household_income_statistics us ON u.id = us.id
WHERE
    us.Mean <> 0
GROUP BY 1
HAVING COUNT(u.Type) > 100
ORDER BY 4 DESC;

SELECT 
    *
FROM
    us_household_income
WHERE
    Type = 'Community';
    
SELECT 
    u.State_Name,
    u.City,
    ROUND(AVG(us.Mean), 1) AS avg_mean_income,
    ROUND(AVG(us.Median), 1) AS avg_median_income
FROM
    us_household_income u
        JOIN
    us_household_income_statistics us ON u.id = us.id
GROUP BY u.State_Name , u.City
ORDER BY 3 DESC;