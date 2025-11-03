-- DATA CLEANING

SELECT*
FROM layoffs;
DROP TABLE IF EXISTS layoffs_staging;

#To keep our row data table, we will create a duplicate table 

DROP TABLE IF EXISTS layoffs_staging;
CREATE TABLE layoffs_staging
LIKE layoffs; 
SELECT*
FROM layoffs_staging;

#inserting all data from the original to the duplicate table
INSERT INTO layoffs_staging
SELECT *
FROM layoffs;

#Checking the results of new table creation
SELECT*
FROM layoffs_staging;

-- 01_ Remove Duplicates

#Detecting duplicates in data using row_number  
SELECT *,
ROW_NUMBER() OVER (PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num
FROM  layoffs_staging;

#Displaying duplicates using CTE 
WITH duplicate_cte AS 
(
SELECT *,
ROW_NUMBER() OVER (PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num
FROM  layoffs_staging
)
SELECT * 
FROM duplicate_cte
WHERE row_num>1 ;

SELECT *
FROM layoffs_staging
WHERE company = 'casper';

DROP TABLE IF EXISTS layoffs_staging2;
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER (PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;

SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

#Removing duplicates
SET SQL_SAFE_updates=0;
DELETE
FROM layoffs_staging2
WHERE row_num > 1;

#Checking the results 
SELECT *
FROM layoffs_staging2;

-- 02_Standerdizing data

#Start by the column company
-- Removing TABs from comapny names
SELECT DISTINCT company, (TRIM(company))
FROM layoffs_staging2;

UPDATE layoffs_staging2 
SET company = TRIM(company);

#Checking industry column: Crypto and crypto currency are the same thing
SELECT DISTINCT *
FROM layoffs_staging2
WHERE industry like 'Crypto%';

-- We change columns like Crypto to Crypto
UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- Checking the results
SELECT DISTINCT industry
FROM layoffs_staging2;

#Checking the location column
SELECT DISTINCT location
FROM layoffs_staging2
ORDER BY 1;

##Checking the country column
SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;

-- Some country names contain a dot at the end
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

#Checking the date column

-- Converting the date column to the right format '%m/%d/%y'
SELECT `Date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

-- Modify the type of the  date column
ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE; 

--  Checking the results
SELECT *
FROM layoffs_staging2;

-- 03_Managing NULL and BLANKS

#We will convert blanks to NULL
UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

#Checking the industry column
SELECT *
FROM layoffs_staging2
WHERE industry IS NULL;

#Approach of Population
SELECT t1.company, t1.industry, t2.company, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
WHERE t1.industry IS NULL 
AND t2.industry IS NOT NULL; 

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

SELECT *
FROM layoffs_staging2
WHERE (industry = '' OR industry IS NULL);

#Checking the stage comlumn
SELECT t1.company, t1.stage, t2.company, t2.stage
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
WHERE t1.stage IS NULL 
AND t2.stage IS NOT NULL;

-- 04_Deleting unecessary rows / columns

# There are missing values in the columns total_laid_off and percentage_laid_off
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


#From the column row_num, we used it for removing duplicates, we do not need it anymore
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

SELECT *
FROM layoffs_staging2;