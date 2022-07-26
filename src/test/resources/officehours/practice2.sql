-- 1. display full addresses from locations table in a single column
select * from locations;
select STREET_ADDRESS||'-'||POSTAL_CODE||'-'||CITY||'-'||COUNTRY_ID as Full_Address from LOCATIONS;

--CONCAT(param1,param2) -- return String

select concat(STREET_ADDRESS,concat(POSTAL_CODE,concat(CITY,COUNTRY_ID))) as Full_Address_Concat from LOCATIONS;

-- 2. display all informations of the employee who has the minimum salary  in employees table
    --find min salary
     select min(SALARY) from EMPLOYEES; --2100

    -- information about that employee
    select * from EMPLOYEES
    where SALARY=2100;

    --make it dynamic --> SOLUTION
    select * from EMPLOYEES
    where SALARY=(select min(SALARY) from EMPLOYEES);


-- 3. display the second minimum salary from the employees

    --min salary--> 2100

    --second in salary
    select min(salary) from EMPLOYEES
    where salary >2100;

    --get me second min dynamicly
    select min(salary) from EMPLOYEES
    where salary >(select min(SALARY) from EMPLOYEES);

-- 4. display all informations of the employee who has the second minimum  salary

    --second min salary is 2200

    --get me information about that guy
    select * from EMPLOYEES
    where salary=2200;

    --make it dynamic --> SOLUTION
    select * from EMPLOYEES
    where salary=(select min(salary) from EMPLOYEES
                    where salary >(select min(SALARY) from EMPLOYEES));


-- 5. list all the employees who are making above the average salary;
     -- find avg
    select round(avg(SALARY)) from EMPLOYEES;   --6462

     -- find info about these employees
    select * from EMPLOYEES
    where SALARY>6462;

    --make it dynamic
    select * from EMPLOYEES
    where SALARY>(select round(avg(SALARY)) from EMPLOYEES);


    -- how many employee getting more than avg
    select count(*) from EMPLOYEES
    where SALARY>(select round(avg(SALARY)) from EMPLOYEES);

    -- how many employee getting more than avg for each job ID
    select JOB_ID,count(*) from EMPLOYEES
    where SALARY>(select round(avg(SALARY)) from EMPLOYEES)
    group by JOB_ID;

-- 6. list all the employees who are making less than the average salary
    select * from EMPLOYEES
    where SALARY<(select round(avg(SALARY)) from EMPLOYEES);

-- 7. display manager name of 'Neena'

--manager Id for Neena
select MANAGER_ID from EMPLOYEES
where FIRST_NAME='Neena';

--manager name of Neena
select FIRST_NAME from EMPLOYEES
    where EMPLOYEE_ID=100;

select * from EMPLOYEES;

-- make it dynamic
select FIRST_NAME from EMPLOYEES
where EMPLOYEE_ID=(select MANAGER_ID from EMPLOYEES
                   where FIRST_NAME='Neena' );



-- 8. find the 3rd maximum salary from the employees table (do not include duplicates)

-- first order salaries in desc
select distinct salary from EMPLOYEES
order by salary desc;

--make it dynamic
select min(salary) from (select distinct salary from EMPLOYEES
               order by salary desc)
where ROWNUM<4;




-- 12. find the 3rd minimum salary from the employees table (do not  include duplicates)
--sort salary in asc order
select distinct salary from EMPLOYEES
order by salary asc;


select max(SALARY) from (select distinct salary from EMPLOYEES
               order by salary asc)
where ROWNUM<4;

-- get me info about that guys
select * from EMPLOYEES
where SALARY=(select max(SALARY) from (select distinct salary from EMPLOYEES
                                       order by salary asc)
              where ROWNUM<4);



--Tasks

-- Display How many country we have in each region_ID
select REGION_ID,count(*) from COUNTRIES
group by REGION_ID;

-- Display How many country we have in each region_name
select REGION_NAME,count(*) from COUNTRIES c inner join REGIONS r
                    on c.REGION_ID = r.REGION_ID
group by REGION_NAME;

-- Display How many country we have in Europe

--with where
select REGION_NAME,count(*) from COUNTRIES c inner join REGIONS r
                                                        on c.REGION_ID = r.REGION_ID
where REGION_NAME='Europe'
group by REGION_NAME;


--having
select REGION_NAME,count(*) from COUNTRIES c inner join REGIONS r
                                                        on c.REGION_ID = r.REGION_ID
group by REGION_NAME
HAVING REGION_NAME='Europe';



-- Display region names where they have more than 5 country
select REGION_NAME,count(*) from COUNTRIES c inner join REGIONS r
                                                        on c.REGION_ID = r.REGION_ID

group by REGION_NAME
having count(*)>5
order by 2;


