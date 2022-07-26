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

-- 6. list all the employees who are making less than the average salary

-- 7. display manager name of 'Neena'

-- 8. find the 3rd maximum salary from the employees table (do not include duplicates)

-- 12. find the 3rd minimum salary from the employees table (do not  include duplicates)

--Tasks

-- Display How many country we have in each region_ID


-- Display How many country we have in each region_name


-- Display How many country we have in Europe


-- Display region names where they have more than 5 country



