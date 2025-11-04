-- MINI PROJECT
SELECT *
FROM info;

SELECT *
FROM job;

-- Creating a table that contains new high salry employees
DROP TABLE IF EXISTS promotion_log;
CREATE TABLE promotion_log
(
EmpID INT,
first_name varchar(50),
last_name varchar(50),
absences INT,
citizendesc varchar(50),
salary DECIMAL
);

#This table contains important informations from both info and job tables
DROP TABLE IF EXISTS employees_informations;
CREATE TABLE employees_informations
SELECT info.EmpID, first_name, last_name, absences, citizendesc, salary
FROM info
JOIN job
	ON info.EmpID = job.EmpID;
 
#Create a trigger that will add new high salary employyes to promotion_log table 
DELIMITER $$
DROP TRIGGER IF EXISTS promotion_insert$$
CREATE TRIGGER promotion_insert
AFTER INSERT ON employees_informations
FOR EACH ROW
BEGIN
  IF NEW.salary > 70000 THEN
	INSERT INTO promotion_log
	VALUES (NEW.EmpID, NEW.first_name, NEW.last_name, NEW.absences, NEW.citizendesc, NEW.salary);
  END IF;
END$$

DELIMITER ;  

#Adding new high salary employee
INSERT INTO employees_informations
VALUES (10001, 'FOUAD', 'LATRACHE', 0, 'NON US CITIZEN', 74000);

#Checking the results   
SELECT*
FROM promotion_log;

#Creating a procedure that gives some informations about the employees
-- Number of emploees per citizenship
-- Average salary of all employees
-- Top absences employees
DELIMITER $$
DROP PROCEDURE IF EXISTS analyze_employee$$
CREATE PROCEDURE analyze_employee()
BEGIN 
	SELECT citizendesc, COUNT(citizendesc)
    FROM employees_informations
    GROUP BY citizendesc;
    SELECT AVG (salary)
    FROM employees_informations;
    SELECT *
    FROM employees_informations
    ORDER BY absences DESC
    LIMIT 3;
END$$ 

DELIMITER ; 

CALL analyze_employee();  