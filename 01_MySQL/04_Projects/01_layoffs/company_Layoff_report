
# 📊 MySQL Project — Layoffs Data Cleaning & Exploratory Analysis

## 📘 Overview
This project demonstrates a complete **data cleaning** and **exploratory data analysis (EDA)** process using MySQL.  
The dataset contains global company layoff information (company, location, industry, total laid off, percentage, date, stage, and country).

The project is divided into two main parts:
1. **Data Cleaning** — preparing and standardizing the dataset.
2. **Exploratory Data Analysis** — discovering insights and patterns about layoffs across time, industries, and countries.

---

## 🧹 Part 1 — Data Cleaning (`01_Data_cleaning.sql`)

### 🧾 Objectives
- Remove duplicates and irrelevant rows.
- Standardize text fields.
- Convert columns to proper data types.
- Handle NULL and blank values.
- Prepare a clean, analysis-ready table.

### 🪜 Steps Performed

1. **Duplicate Removal**
   - Detected duplicate rows using `ROW_NUMBER()` and `CTE`.
   - Created a staging table (`layoffs_staging2`) to safely clean data.
   - Deleted rows with duplicate entries.

2. **Data Standardization**
   - Trimmed extra spaces and corrected inconsistent names (e.g., `Crypto`, `United States.`).
   - Fixed date formats using `STR_TO_DATE()` and converted to proper `DATE` type.

3. **Handling Missing and Blank Values**
   - Converted blank cells to `NULL`.
   - Filled missing `industry` or `stage` values using information from other rows of the same company.

4. **Data Reduction**
   - Removed rows where both `total_laid_off` and `percentage_laid_off` were NULL.
   - Dropped helper columns used during cleaning (e.g., `row_num`).

✅ **Result:** A clean and standardized dataset stored in the table `layoffs_staging2`, ready for analysis.

---

## 📈 Part 2 — Exploratory Data Analysis (`02_Exploratary_data_analysis.sql`)

### 🧾 Objectives
- Understand layoff trends across companies, industries, and countries.
- Identify time periods and sectors most affected.
- Compute rolling and ranked summaries.

### 🔍 Key Analyses Performed

1. **Basic Checks**
   - Identified maximum layoffs and companies with 100% layoffs.
   - Measured time span of the dataset.

2. **Aggregate Insights**
   - Total layoffs per company, industry, country, and year.
   - Average percentage of layoffs by company.
   - Layoff evolution per month.

3. **Time-Series & Ranking**
   - Monthly rolling totals using `WINDOW FUNCTIONS`.
   - Yearly top 5 companies and industries with the most layoffs using `CTE` + `DENSE_RANK()`.

4. **Findings (Examples)**
   - Certain industries (like tech/crypto) were disproportionately affected.
   - Layoffs peaked in specific years/months.
   - Rolling totals reveal cumulative job loss impact.

✅ **Result:** A set of SQL queries capable of generating descriptive analytics and insights for data visualization or reporting.

---

## 🧠 Key SQL Concepts Practiced
- Common Table Expressions (CTE)
- Window Functions (`ROW_NUMBER`, `DENSE_RANK`, `SUM OVER`)
- Data Standardization & Cleaning Techniques
- Date Formatting & Type Conversion
- Aggregation and Ranking
- Joins and Conditional Updates

---

## 🚀 How to Use
1. Import the original dataset into a MySQL database (table: `layoffs`).
2. Run `01_Data_cleaning.sql` to create and clean the staging tables.
3. Run `02_Exploratary_data_analysis.sql` to explore the cleaned data.
4. Review outputs and adjust filters/aggregations as needed.

---

## 🧑‍💻 Author
**👋 Zoubir Chatti**  
🎓 GEOPHYSICIST/ DATA ANALYST  
📍 Marseille, France 🇫🇷  

---

