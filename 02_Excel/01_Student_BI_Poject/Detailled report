# Student Dashboard Project

This project contains an **Excel dashboard** for student grades in BI competition and a **SQL script** for cleaning and processing student data. It demonstrates data cleaning, standardization, and basic analytics workflows that can be used for educational data management.

---

## **Project Contents**

| File | Description |
|------|-------------|
| `dashboard.xlsx` | Excel dashboard showing student performance, grades, age brackets, and visual summaries of the dataset. |
| `data_cleaning.sql` | SQL script to clean, standardize, and process student data (`bi` table) for use in the dashboard. |
| `Detailled report.md` | Project documentation and explanation. |

---

## **Data Cleaning Workflow (SQL)**

The SQL script performs the following steps:

1. **Create a working copy**
   - Creates a new table `bi1` from the original `bi` table to preserve raw data.

2. **Standardize column names**
   - Renames ambiguous or inconsistent column names (e.g., `fname` → `first_name`).

3. **Trim text fields**
   - Removes leading and trailing spaces from string columns like `first_name`, `last_name`.

4. **Standardize categorical variables**
   - Gender: Maps `m` → `Male`.  
   - Countries: Standardizes `norge` → `Norway`, `UK` → `United Kingdom`.  
   - Previous education: Standardizes entries like `bachelors`, `diploma`, `high_school`.

5. **Create age brackets**
   - Categorizes students into `Young`, `Middle`, and `Old` based on age.

6. **Compute averages and grades**
   - Calculates the average score from `python_score` and `DB_score`.  
   - Assigns grades (`A`, `B`, `C`, `D`, `F`) based on averages and entry exam scores.

7. **Remove duplicates**
   - Uses `ROW_NUMBER()` with `PARTITION BY` to detect and remove duplicate entries.

8. **Final cleaned table**
   - Outputs `bi2`, a cleaned and standardized table ready for analysis or reporting.

---

## **Excel Dashboard**

The `dashboard.xlsx` file contains multiple sheets to organize and analyze student data:

- **Raw Data**: Original dataset imported from CSV. No transformations applied.
- **Working Data**: Cleaned and standardized dataset, including standardized names, countries, genders, age brackets, grades, and averages. This sheet is the source for pivot tables and dashboard charts.
- **Pivot Tables**: Summarizes key metrics such as average scores by country, gender, and education level. Provides flexible insights for deeper analysis.
- **Dashboard**: Visual summary of student performance with charts and interactive filters

> **Note:** The dashboard relies on the cleaned dataset (`bi2`) for accurate results.

---

## **Getting Started**

To replicate or extend this project:

1. Load your student dataset into a database (e.g., MySQL).  
2. Run the `data_cleaning.sql` script to produce a cleaned table (`bi2`).  
3. Open `dashboard.xlsx` and connect it to your cleaned dataset.  
4. Explore dashboards and charts. You can modify Excel charts as needed.

---

## **Requirements**

- MySQL (or compatible SQL database)  
- Microsoft Excel (for dashboard viewing/editing)  

---

## **Project Insights**

- Demonstrates **data cleaning best practices**.  
- Shows how to **standardize categorical data**, handle duplicates, and compute derived metrics.  
- Produces **visual insights** through Excel dashboards.  

---

## **Author**

Zoubir Chatti – Data Cleaning & Dashboard Project

