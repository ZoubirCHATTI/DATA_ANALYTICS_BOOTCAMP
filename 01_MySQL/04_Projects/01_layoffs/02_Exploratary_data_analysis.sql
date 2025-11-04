-- Exploratory Data Analysis

SELECT *
FROM layoffs_staging2;

#Checking the maximum layoffs in the dataset
SELECT MAX(total_laid_off)
FROM layoffs_staging2;

#Checking the percentage of this max from all the company employees number
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

#Cheecking where all the employees in a company are laid off 
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off=1
ORDER BY total_laid_off DESC;

#Looking at the sum of laid off employees per company
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

#Looking at the era during it the dataser where collected
SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;

#Looking at the sum of laid off employees per industry
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

#Looking at the sum of laid off employees per country
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

#Looking at the sum of laid off employees per year
SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

#Looking at the sum of laid off employees per stage
SELECT stage, SUM(total_laid_off)
FROM layoffs_staging 
GROUP BY stage
ORDER BY 2 DESC;

#Looking at the average percentage laid_off per company
SELECT company, AVG(percentage_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

#Checking the sum of laid offf employees per month
SELECT LEFT(`date`, 7) AS `MONTH`, SUM(total_laid_off) AS tot_laid_off
FROM layoffs_staging2
WHERE LEFT(`date`, 7) IS NOT NULL
GROUP BY `MONTH`  
ORDER BY 1 ASC ;

#Rolling total laid off per year
WITH rolling_total AS 
(
SELECT LEFT(`date`, 7) AS `MONTH`, SUM(total_laid_off) AS tot_laid_off
FROM layoffs_staging2
WHERE LEFT(`date`, 7) IS NOT NULL
GROUP BY `MONTH`  
ORDER BY 1 ASC 
)
SELECT `MONTH`,tot_laid_off, SUM(tot_laid_off) OVER(ORDER BY `MONTH`) AS rol_tot, SUM(tot_laid_off) OVER (PARTITION BY LEFT(`MONTH`, 4) ORDER BY `MONTH`) AS rol_to_per_year
FROM rolling_total;

#Checking top 5 companies that had laid off employees per year
WITH CTE_company (company, years, tot_laid_off) AS 
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR (`date`)
ORDER BY 2 ASC
), company_year_rank AS
(SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY tot_laid_off DESC) AS ranking
FROM CTE_company
WHERE years IS NOT NULL
ORDER BY ranking)
SELECT *
FROM company_year_rank
WHERE ranking <=5
ORDER BY years
;
#Checking top 5 industries that had laid off employees per year
With CTE_industry (industry, years, tot_laid_off) AS
(
SELECT industry, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry, YEAR(`date`)
), industry_rank AS
(
SELECT *, DENSE_RANK() OVER(PARTITION BY years ORDER BY tot_laid_off DESC) AS ranking
FROM CTE_industry
WHERE years IS NOT NULL
AND industry IS NOT NULL)
SELECT *
FROM industry_rank
WHERE ranking <=5;
;