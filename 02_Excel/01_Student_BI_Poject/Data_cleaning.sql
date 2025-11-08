-- ==============================================
-- Business Intelligence Project Data Cleaning
-- ==============================================
SELECT*
FROM bi;

-- For safety, create a working copy of the original table 
DROP TABLE IF EXISTS bi1;
CREATE TABLE bi1
SELECT *
FROM bi;

-- Checking the data 
SELECT *
FROM bi1;
-- ===================
-- 01_Standerdization
-- ===================

-- Standerdizing column names for readability
SET SQL_SAFE_UPDATES=0;
ALTER TABLE bi1
RENAME COLUMN fname TO first_name;

ALTER TABLE bi1
RENAME COLUMN lname TO last_name; 

ALTER TABLE bi1
RENAME COLUMN python TO python_score; 

ALTER TABLE bi1
RENAME COLUMN DB TO DB_score; 

-- Trim space in string columns
UPDATE bi1
SET first_name=TRIM(first_name)
WHERE first_name <> TRIM(first_name);

UPDATE bi1
SET last_name=TRIM(last_name)
WHERE last_name <> TRIM(last_name);

-- Standerdizing gender
SELECT DISTINCT gender
FROM bi1;

UPDATE bi1
SET gender= "Male"
WHERE gender =  "m";

--  Standerdizingg country
SELECT DISTINCT country
FROM bi1;

UPDATE bi1
SET country = "norway"
WHERE country ="norge";

UPDATE bi1
SET country = "United Kingdom"
WHERE country ="UK";

-- Standerdizing residence
SELECT DISTINCT residence
FROM bi1;

UPDATE bi1
SET residence="BI_residence"
WHERE residence LIKE "BI%";

SELECT *
FROM bi1;

-- Standerdizing previous education
SELECT DISTINCT prevEducation
FROM bi1;

UPDATE bi1
SET preveducation= "Bachelors"
WHERE preveducation LIKE "%chelors";

UPDATE bi1
SET preveducation= "Diploma"
WHERE preveducation LIKE "Diploma%";

UPDATE bi1
SET preveducation= "High_school"
WHERE preveducation LIKE "high%";
 
 -- Add and categorize age brackets
ALTER TABLE bi1
ADD COLUMN age_brackets varchar(50); 

SELECT AVG(age), MAX(age), MIN(age)
FROM bi1;

UPDATE bi1
SET age_brackets="YOUNG"
WHERE age BETWEEN 20 AND 30;

UPDATE bi1
SET age_brackets="MIDDLE"
WHERE age BETWEEN 30 AND 50;

UPDATE bi1
SET age_brackets="OLD"
WHERE age BETWEEN 50 AND 80;

-- Compute average score and assign grades
ALTER TABLE bi1
ADD COLUMN average DECIMAL;

UPDATE bi1
SET average=(python_score+DB_score)/2
WHERE average IS NULL;

SELECT *
FROM bi1;

ALTER TABLE bi1
ADD COLUMN grade varchar(50);

UPDATE bi1 
SET grade = 'A'
WHERE average >= 90;

UPDATE bi1
SET grade="B"
WHERE average >=80 AND average < 90;

UPDATE bi1
SET grade="C"
WHERE average >=70 AND average < 80;

UPDATE bi1
SET grade="D"
WHERE average >=60 AND average < 70;

UPDATE bi1
SET grade="F"
WHERE average < 60;

-- Assign entry exam grades
ALTER TABLE bi1
ADD COLUMN entry_grade varchar(50);

UPDATE bi1 
SET entry_grade = 'A'
WHERE entryexam >= 90;

UPDATE bi1
SET entry_grade="B"
WHERE entryexam >=80 AND entryexam < 90;

UPDATE bi1
SET entry_grade="C"
WHERE entryexam >=70 AND entryexam < 80;

UPDATE bi1
SET entry_grade="D"
WHERE entryexam >=60 AND entryexam < 70;

UPDATE bi1
SET entry_grade="F"
WHERE entryexam < 60;
-- Remove duplicates

-- ===========================================
-- 02_Remove duplicates 
-- ===========================================
-- Remove duplicates using ROW_NUMBER()
SELECT*,
ROW_NUMBER() OVER (PARTITION BY first_name, last_name, gender, country, residence, preveducation, studyhours, age_brackets, grade) AS row_num
FROM bi1
ORDER BY row_num;
DROP TABLE IF EXISTS bi2;
CREATE TABLE bi2
SELECT*,
ROW_NUMBER() OVER (PARTITION BY first_name, last_name, gender, country, residence, preveducation, studyhours, age_brackets, grade) AS row_num
FROM bi1
ORDER BY row_num;

-- Deleting duplicates
DELETE 
FROM bi2
WHERE row_num > 1;

SELECT *
FROM bi2;

-- ===================================================
-- 03_Removing columns 
-- ===================================================
ALTER TABLE bi2
DROP COLUMN row_num;

SELECT *
FROM bi2;

-- =============================
-- Final check table
-- =============================
SELECT AVG(age) AS avg_age, MAX(age) AS max_age, MIN(age) AS min_age FROM bi2;
SELECT DISTINCT gender FROM bi2;
SELECT DISTINCT country FROM bi2;
SELECT DISTINCT preveducation FROM bi2;
SELECT DISTINCT age_brackets FROM bi2;
SELECT DISTINCT grade FROM bi2;
SELECT DISTINCT entry_grade FROM bi2;
