-- ===============================
-- VIEWING DATA IN EACH TABLE
-- ===============================
SELECT * 
FROM info;

SELECT * 
FROM job;


-- ===============================
-- INNER JOIN
-- ===============================
-- Shows all records that have matching EmpID in both tables
SELECT * 
FROM info
INNER JOIN job
  ON info.EmpID = job.EmpID;

-- Display employee details with their position
SELECT info.EmpID, first_name, last_name, position
FROM info
INNER JOIN job
  ON info.EmpID = job.EmpID;

-- Display employee details with their salary
SELECT info.EmpID, first_name, last_name, salary
FROM info
INNER JOIN job
  ON info.EmpID = job.EmpID;

-- Show average salary and number of employees per gender
SELECT sex, AVG(salary) AS avg_salary, COUNT(sex) AS counts
FROM info
INNER JOIN job
  ON info.EmpID = job.EmpID
GROUP BY sex;

-- Show employees earning more than 60,000
SELECT info.EmpID, first_name, last_name, salary
FROM info
INNER JOIN job
  ON info.EmpID = job.EmpID
WHERE salary > 60000;


-- ===============================
-- OUTER JOINS
-- ===============================
-- LEFT JOIN: shows all employees, even if they have no job record
SELECT *
FROM info
LEFT JOIN job
  ON info.EmpID = job.EmpID;

-- RIGHT JOIN: shows all jobs, even if there is no matching employee info
SELECT *
FROM info
RIGHT JOIN job
  ON info.EmpID = job.EmpID;


-- ===============================
-- SELF JOIN
-- ===============================
-- Join the same table to itself (example: comparing employees)
SELECT *
FROM info AS info1
JOIN info AS info2
  ON info1.EmpID = info2.EmpID;

-- Example of offset join (EmpID + 1)
SELECT info1.EmpID AS EmpID_santa,
       info1.first_name AS first_name_santa,
       info1.last_name AS last_name_santa,
       info2.EmpID AS Employee,
       info2.first_name AS emp_first_name,
       info2.last_name AS emp_last_name
FROM info AS info1
JOIN info AS info2
  ON info1.EmpID + 1 = info2.EmpID;


-- ===============================
-- UNION (combining results)
-- ===============================
-- Combine employee IDs from both tables, removing duplicates
SELECT EmpID FROM info
UNION
SELECT EmpID FROM job;

-- Combine employee IDs from both tables, keeping duplicates
SELECT EmpID FROM info
UNION ALL
SELECT EmpID FROM job;

-- Combine all EmpIDs and high-salary employees
SELECT EmpID AS HIGH_SALARY_employee_ID
FROM info
UNION
SELECT EmpID
FROM job
WHERE salary > 70000;

-- Combine male employees and employees with more than 10 absences
SELECT EmpID
FROM info
WHERE TRIM(sex) = 'M'
UNION
SELECT EmpID
FROM job
WHERE absences > 10;

-- Combine unmarried men and unmarried women
SELECT first_name, last_name, 'Unmarried_man' AS Label
FROM info
WHERE TRIM(sex) = 'M' AND MarriedID = 0
UNION
SELECT first_name, last_name, 'Unmarried_woman' AS Label
FROM info
WHERE TRIM(sex) = 'F' AND MarriedID = 0
ORDER BY last_name;

-- Display employees with high salaries using a subquery
SELECT first_name, last_name, 'High_salary' AS Work_Status
FROM info
WHERE EmpID IN (
  SELECT EmpID
  FROM job
  WHERE salary > 70000
);


-- ===============================
-- STRING FUNCTIONS
-- ===============================

-- LENGTH(): counts number of characters in a string
SELECT sex, LENGTH(sex)
FROM info;

-- UPPER(): converts string to uppercase
SELECT first_name, UPPER(last_name)
FROM info;

-- LOWER(): converts string to lowercase
SELECT LOWER(first_name) AS first_name, UPPER(last_name) AS last_name
FROM info;

-- TRIM(): removes leading and trailing spaces
SELECT sex, LENGTH(sex), TRIM(sex), LENGTH(TRIM(sex))
FROM info;

-- LTRIM(): removes spaces on the left side
SELECT sex, LTRIM(sex), LENGTH(LTRIM(sex))
FROM info;

-- RTRIM(): removes spaces on the right side
SELECT sex, RTRIM(sex), LENGTH(RTRIM(sex))
FROM info;

-- RIGHT(): extract last characters (e.g., year from date)
SELECT EmpID, RIGHT(dateofhire, 4)
FROM job;

-- LEFT(): extract first characters (e.g., month from date)
SELECT EmpID, LEFT(dateofhire, 2)
FROM job;

-- SUBSTRING(): extract part of a string
SELECT EmpID, SUBSTRING(dateofhire, 3, 3)
FROM job;

-- LEFT(TRIM()): first letter of the first name
SELECT LEFT(TRIM(first_name), 1)
FROM info;

-- REPLACE(): replace first letter with lowercase
SELECT first_name,
       REPLACE(first_name,
               LEFT(TRIM(first_name), 1),
               LOWER(LEFT(TRIM(first_name), 1))) AS new_name
FROM info;

-- LOCATE(): find the position of a substring (e.g., 'da' inside first_name)
SELECT first_name, LOCATE('da', first_name)
FROM info;

-- CONCAT(): combine first and last name into one field
SELECT EmpID,
       CONCAT(first_name, ' ', last_name) AS full_name
FROM info;
