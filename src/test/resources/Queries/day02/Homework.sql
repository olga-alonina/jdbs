-- Select - Distinct - Where - Order By - Like - Group By - Having

-- 1. List all the employees first and last name with their salary in employees table
select FIRST_NAME, LAST_NAME, SALARY
from EMPLOYEES;
-- 2. How many employees have salary less than 5000?
select count(SALARY)
from EMPLOYEES
where SALARY < 5000;
-- 3. How many employees have salary between 6000 and 7000?
select count(SALARY)
from EMPLOYEES
where SALARY between 6000 and 7000;
-- 4. List all the different region_ids in countries table
select distinct REGION_ID
from COUNTRIES;
-- 5. display the salary of the employee Grant Douglas (lastName: Grant,  firstName: Douglas)
select SALARY, FIRST_NAME, LAST_NAME
from EMPLOYEES
where FIRST_NAME = 'Douglas'
  and LAST_NAME = 'Grant';
-- 6. display all department information from departments table
-- if the department name values are as below
-- IT , Public Relations , Sales , Executive
select *
from DEPARTMENTS
where DEPARTMENT_NAME in ('IT', 'Public Relations', 'Sales', 'Executive');
-- 7. display the maximum salary in employees table
select max(SALARY)
from EMPLOYEES;
-- 8. display the the minimum salary in employees table
select min(SALARY)
from EMPLOYEES;
-- 9. display the average salary of the employees;
select round(avg(SALARY), 2)
from EMPLOYEES;
-- 10. count the total numbers of the departments in departs table
select count(DEPARTMENT_ID)
from DEPARTMENTS;
-- 11. sort the start_date in ascending order in job_history's table
select START_DATE
from JOB_HISTORY
order by (START_DATE);
-- 12. sort the start_date in descending order in job_history's table
select START_DATE
from JOB_HISTORY
order by (START_DATE) desc;
-- 13. display all records whose last name contains 2 lowercase 'a's
select LAST_NAME
from EMPLOYEES
where LAST_NAME like ('%a%a%');
-- 14. display all the employees whose first name starts with 'A'
select FIRST_NAME
from EMPLOYEES
where FIRST_NAME like ('A%');
-- 15. display all the employees whose job_ID contains 'IT'
select *
from EMPLOYEES
where JOB_ID like ('%IT%');
-- 16. display all  unique job_id that end with CLERK in employee table
select distinct JOB_ID
from EMPLOYEES
where JOB_ID like ('%CLERK');
-- 17.display all  employees first name starts with A and have exactly 4 characters Total
select FIRST_NAME
from EMPLOYEES
where FIRST_NAME like ('A___');
-- 18. display all the employees whose department id in 50, 80, 100
select *
from EMPLOYEES
where DEPARTMENT_ID in ('50', '80', '100');
-- 19. display all employees who does not work in any one of these department id  90, 60,  100, 130, 120
select*
from EMPLOYEES
where DEPARTMENT_ID not in ('90', '60', '100', '130', '120');
-- 20. divide employees into groups by using their job id
select FIRST_NAME, LAST_NAME, JOB_ID
from EMPLOYEES
group by JOB_ID, FIRST_NAME, LAST_NAME;
-- 1 display the maximum salaries in each groups
select max(SALARY), JOB_ID
from EMPLOYEES
group by JOB_ID;
-- 2 display the minimum salaries in each groups
select min(SALARY), JOB_ID
from EMPLOYEES
group by JOB_ID;
-- 3 display the average salary of each group
select avg(SALARY), JOB_ID
from EMPLOYEES
group by JOB_ID;
-- 4 how many employees are there in each group that have minimum  salary of 5000 ?
select count(SALARY)
from EMPLOYEES
where SALARY < 5000
group by JOB_ID;
-- 5 display the total budgets of each groups
select sum(SALARY)
from EMPLOYEES
group by JOB_ID;
-- 21. display all job_id and average salary who work as any of these jobs IT_PROG, SA_REP, FI_ACCOUNT, AD_VP
select JOB_ID, avg(SALARY)
from EMPLOYEES
where JOB_ID in ('IT_PROG', 'SA_REP', 'FI_ACCOUNT', 'AD_VP')
group by JOB_ID;
-- 22.display max salary  for each department
select max(SALARY), JOB_ID
from EMPLOYEES
group by JOB_ID;
-- 23. display total salary for each department except department_id 50, and where total salary >30000
select sum(SALARY)
from EMPLOYEES
where DEPARTMENT_ID != '50'
having sum(SALARY) > 30000
group by JOB_ID;