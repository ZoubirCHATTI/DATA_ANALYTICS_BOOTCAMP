-- ======================================
-- ======================================
-- Data Professional Survey Breakdown
-- ======================================
-- ======================================

SELECT *
FROM survey;

-- Creation of a copy table
DROP TABLE IF EXISTS survey1;
CREATE TABLE survey1
SELECT *
FROM survey;

-- Displaying the content
SELECT*
FROM survey1;
-- ====================================
-- 01_Standerdization
-- ====================================
-- Making column names proper
ALTER TABLE survey1
CHANGE COLUMN `Date Taken (America/New_York)` `date` TEXT;

ALTER TABLE survey1
CHANGE COLUMN `resisdence` `residence` TEXT;

ALTER TABLE survey1
CHANGE COLUMN `imdustry` `industry` TEXT;

SET SQL_SAFE_UPDATES = 0;

ALTER TABLE survey1
CHANGE COLUMN `Time Taken (America/New_York)` `time` TIME;

ALTER TABLE survey1
CHANGE COLUMN `Q1 - Which Title Best Fits your Current Role?` `position` TEXT;
 
 ALTER TABLE survey1
CHANGE COLUMN `Q2 - Did you switch careers into Data?` `switch_to_data` TEXT;
  
UPDATE survey1
SET position = "Other" 
WHERE position LIKE "Other%";

SELECT DISTINCT position
FROM survey1;

UPDATE survey1
SET salary = REPLACE(salary, "k", "");

UPDATE survey1
SET salary= REPLACE(salary, "+", '');

ALTER TABLE survey1
ADD COLUMN min_sal FLOAT,
ADD COLUMN max_sal FLOAT;

ALTER TABLE survey1
ADD COLUMN avg_sal FLOAT;
 

UPDATE survey1
SET min_sal=CAST(SUBSTRING_INDEX(salary, "-", 1) AS UNSIGNED);

UPDATE survey1
SET max_sal=CAST(SUBSTRING_INDEX(salary, "-", -1) AS UNSIGNED);

UPDATE survey1
SET avg_sal=(min_sal+max_sal)/2.0;

UPDATE survey1
SET industry = "Other"
WHERE industry LIKE 'other%';

SELECT DISTINCT industry
FROM survey1;

UPDATE survey1
SET programming_language="Other"
WHERE programming_language LIKE "other%"; 

UPDATE survey1
SET residence = "Other"
WHERE residence LIKE "other%";

SELECT DISTINCT residence
FROM survey1;

SELECT DISTINCT programming_language
FROM survey1;


-- =====================================
-- 02_Duplicates verification
-- =====================================
WITH duplicates AS 
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY `Unique ID`) AS ROW_NUM
FROM survey1)

SELECT *
FROM duplicates
WHERE ROW_NUM>1 
; #NO DUPLICATES FOUND

-- =================================
-- 03_Dropping useless columns
-- =================================

--  Dropping empty columns
ALTER TABLE survey1
DROP COLUMN email;


ALTER TABLE survey1
DROP COLUMN browser;

ALTER TABLE survey1
DROP COLUMN os;

ALTER TABLE survey1
DROP COLUMN city;

ALTER TABLE survey1
DROP COLUMN country;

ALTER TABLE survey1
DROP COLUMN referrer;

ALTER TABLE survey1
DROP COLUMN education;

-- Dropping useless information cuolumn
ALTER TABLE survey1
DROP COLUMN ethnicity;

SELECT*
FROM survey1;


