#Global visualization of the data
SELECT *
FROM human_resources_dataset.hr
LIMIT 10;

#Counting the number of individuals
SELECT count(*)  as total_individual
FROM hr;

#Counting the number of individuals by marriage status
SELECT count(marriedid)
FROM hr;

#Dinstintion of present genders(sex)
SELECT DISTINCT sex
FROM hr;

#Displaying only the female gender
SELECT *
FROM human_resources_dataset.hr
WHERE genderid = 0;

#Counting the number of female individuals
SELECT count(*) as total_females
FROM human_resources_dataset.hr
WHERE genderid = 0;

#Counting the number of male individuals
SELECT count(*) as total_males
FROM human_resources_dataset.hr
WHERE genderid = 1;

#Counting the number of individuals who have salaries more than 70000 euros  
SELECT count(*) as total_high_salary_employes
FROM hr
WHERE salary > 70000;

#Filtering by position
SELECT *
FROM hr
WHERE position=trim(lower('sr. DBA')); 

#Salary per gender
SELECT genderid, avg(salary) as avg_salary
FROM hr
GROUP BY genderid;

#Counting absences by gender
SELECT genderid, count(absences) as absences_by_gendere
FROM hr
GROUP BY genderid;

# Counting employees by position
SELECT position, count(position)
FROM hr
GROUP BY position;

#Salary statistics by gender
SELECT genderid, avg(salary) as avg_salary, max(salary) as max_salary, min(salary) as min_salary
FROM hr
GROUP BY genderid;

#Grouping position with salaries
SELECT position, salary
FROM hr
GROUP BY position, salary;

#Grouping position with salaries using distinct
SELECT DISTINCT position, salary
FROM hr;

#Grouping position with average salary and the total number of postions
SELECT position, count(position) as tot_num_of_pos,  avg(salary) as avg_sal_per_position
FROM hr
GROUP BY position;

#Ordering individuals by their IDs
SELECT *
FROM hr
ORDER BY EmpID;

#Ordering positions by average salaries
SELECT position,  avg(salary) as avg_sal_per_position
FROM hr
GROUP BY position
ORDER BY avg_sal_per_position;

#Ordering individuals by positions andd salaries (fine grained sorting)
SELECT *
FROM hr
ORDER BY position, salary;

#Filtering positions by average salaries
SELECT position, avg(salary) as avg_sal_per_position
FROM hr
GROUP BY position
HAVING avg_sal_per_position > 70000;
