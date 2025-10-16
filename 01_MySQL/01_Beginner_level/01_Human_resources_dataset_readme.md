# Human Resources (HR) Data Analysis with MySQL

This project is a small demonstration of HR data analysis using SQL queries. It utilizes a hypothetical dataset named `human_resources_dataset` to perform various statistical and exploratory analyses on employees.

## Project Goal

The main objective is to provide a set of fundamental queries for exploring, aggregating, and analyzing HR data, covering aspects such as employee demographics, compensation, absences, and position distribution.

## Database Schema

All queries are executed on the `hr` table, which is assumed to be part of the `human_resources_dataset` database.

| Column | Description | Data Type|
| :--- | :--- | :--- |
| `EmpID` | Unique Employee ID | `INT` |
| `marriedid` | Marital Status (ID) | `INT` |
| `genderid` | Employee Gender (0 for Female, 1 for Male) | `INT` |
| `sex` | Gender (Text Value) | `VARCHAR` |
| `salary` | Employee Annual Salary | `DECIMAL` |
| `position` | Employee Position | `VARCHAR` |
| `absences` | Number of Absences | `INT` |

## Analytical SQL Queries

The following queries are organized by analysis category.

### 1. Basic Exploration and Counting

| Query | Description |
| :--- | :--- |
| `SELECT * FROM human_resources_dataset.hr LIMIT 10;` | Displays the first 10 rows of the `hr` table for a **global data visualization**. |
| `SELECT count(*) as total_individual FROM hr;` | Counts the ** total number** of individuals (employees) in the table. |
| `SELECT count(marriedid) FROM hr;` | Counts the number of records with a value for marital status. |
| `SELECT DISTINCT sex FROM hr;` | Lists the **distinct genders** present in the dataset. |
| `SELECT * FROM human_resources_dataset.hr WHERE genderid = 0;` | Displays all records for the **female gender**. |
| `SELECT count(*) as total_females FROM human_resources_dataset.hr WHERE genderid = 0;` | Counts the **total number of female** employees. |
| `SELECT count(*) as total_males FROM human_resources_dataset.hr WHERE genderid = 1;` | Counts the **total number of male** employees. |
| `SELECT count(*) as total_high_salary_employes FROM hr WHERE salary > 70000;` | Counts employees whose salary is **greater than 70,000 euros**. |
| `SELECT position, count(position) FROM hr GROUP BY position;` | Counts the **number of employees per position**. |
| `SELECT position, count(position) as tot_num_of_pos, avg(salary) as avg_sal_per_position FROM hr GROUP BY position;` | Calculates the **total number of positions** and the **average salary per position**. |

### 2. Filtering and Specific Search

| Query | Description |
| :--- | :--- |
| `SELECT * FROM hr WHERE position=trim(lower('sr. DBA'));` | Filters employees holding the 'sr. DBA' position, ensuring a case-insensitive match and no superfluous spaces. |
| `SELECT position, avg(salary) as avg_sal_per_position FROM hr GROUP BY position HAVING avg_sal_per_position > 70000;` | Displays positions where the **average salary is greater than 70,000 euros**. |

### 3. Compensation and Absence Analysis

| Query | Description |
| :--- | :--- |
| `SELECT genderid, avg(salary) as avg_salary FROM hr GROUP BY genderid;` | Calculates the **average salary by gender**. |
| `SELECT genderid, avg(salary) as avg_salary, max(salary) as max_salary, min(salary) as min_salary FROM hr GROUP BY genderid;` | Provides **detailed salary statistics** (average, maximum, minimum) by gender. |
| `SELECT genderid, count(absences) as absences_by_gendere FROM hr GROUP BY genderid;` | Counts the **total number of absences by gender**. |
| `SELECT position, salary FROM hr GROUP BY position, salary;` | Lists all **unique combinations of position and salary**. |
| `SELECT DISTINCT position, salary FROM hr;` | Equivalent to the previous query, lists **unique combinations of position and salary**. |

### 4. Data Sorting

| Query | Description |
| :--- | :--- |
| `SELECT * FROM hr ORDER BY EmpID;` | Sorts all records by **Employee ID (`EmpID`)** (default sort). |
| `SELECT position, avg(salary) as avg_sal_per_position FROM hr GROUP BY position ORDER BY avg_sal_per_position;` | Sorts positions based on their **ascending average salary**. |
| `SELECT * FROM hr ORDER BY position, salary;` | Sorts records first by **position**, then by **salary** (fine-grained sorting). |

## How to Use This Project

1.  **Database Setup**: Ensure you have a running MySQL server.
2.  **Schema Creation**: Create the `human_resources_dataset` database.
    ```sql
    CREATE DATABASE human_resources_dataset;
    USE human_resources_dataset;
    ```
3.  **Table Creation**: Create the `hr` table with the necessary columns (based on the queries).
4.  **Data Import**: Import your HR data into this table.
5.  **Query Execution**: Execute the queries above in your MySQL client to perform the analysis.

## Conclusion

This project is a starting point. More sophisticated and complex queries are to be presented in the next projects in this repository.
