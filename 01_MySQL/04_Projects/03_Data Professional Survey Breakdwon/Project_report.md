# 📊 Project: Data Professional Survey Data Cleaning (MySQL)

## 📝 Project Description

This MySQL project aims to clean, standardize, and prepare a raw dataset originating from a survey of data professionals. 

The SQL script contained in this repository (`Alex_Survey_Data_cleaning.sql`) performs essential **Data Cleaning** operations to make the data ready for analysis. The primary goal is to improve the quality and consistency of the data for future analytical queries.

## 🛠️ Script Contents (`Alex_Survey_Data_cleaning.sql`)

The SQL script is structured into three main stages.

### 1. Data Standardization (`01_Standerdization`)

This section focuses on data formatting and consistency:

* **Table Creation:** A copy of the source table (`survey`) is created and named `survey1`.
* **Column Renaming:** Column names are simplified/corrected for better readability (e.g., `resisdence` becomes `residence`, `imdustry` becomes `industry`).
* **Salary Cleaning:** The `salary` column is cleaned (removing 'k' and '+' characters).
* **Analysis Column Creation:** New columns are added for minimum salary (`min_sal`), maximum salary (`max_sal`), and estimated average salary (`avg_sal`).
* **Value Grouping:** Less frequent values in columns like `position`, `industry`, `residence`, and `programming_language` are grouped under the single category **"Other"**.

### 2. Duplicates Verification (`02_Duplicates verification`)

* The script uses a Common Table Expression (`WITH duplicates`) and the `ROW_NUMBER()` window function to identify and check for duplicate rows based on the `Unique ID`.
* *Result:* The script confirms that **no duplicates** were found.

### 3. Dropping Useless Columns (`03_Dropping useless columns`)

Columns containing empty, useless, or non-relevant information for the analysis are dropped from the `survey1` table.

**Columns dropped:**
* `email`
* `browser`
* `os`
* `city`
* `country`
* `referrer`
* `education`
* `ethnicity`

## ⚙️ How to Use

1.  Ensure you have a **MySQL** installation.
2.  Import your raw survey dataset into a table named `survey`.
3.  Execute the `Alex_Survey_Data_cleaning.sql` script in your MySQL environment.
4.  The `survey1` table will contain the cleaned and analysis-ready dataset.
