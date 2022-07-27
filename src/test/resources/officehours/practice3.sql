
-- 1. FIND OUT COUNTRY NAME AND REGION NAME FROM COUNTRIES AND REGION TABLE
select * from employees;

select COUNTRY_NAME,REGION_NAME from COUNTRIES c inner join REGIONS r
        on c.REGION_ID = r.REGION_ID;

    --how many countries we have for each region
     select REGION_NAME,count(*) from COUNTRIES c inner join REGIONS r
                                                            on c.REGION_ID = r.REGION_ID
    group by REGION_NAME;

-- 2. FIND OUT FIRST_NAME AND JOB_TITLE FROM JOBS AND EMPLOYEES TABLE
    select FIRST_NAME,JOB_TITLE from EMPLOYEES e inner join JOBS j
        on e.JOB_ID = j.JOB_ID;

    -- How many emmployee we have for each job title
    select JOB_TITLE,count(*) from EMPLOYEES e inner join JOBS j
                                                        on e.JOB_ID = j.JOB_ID
    group by JOB_TITLE;

    -- Display jobtitle that has more than 5 employee
    select JOB_TITLE,count(*) from EMPLOYEES e inner join JOBS j
                                                          on e.JOB_ID = j.JOB_ID
    group by JOB_TITLE
    having count(*)>5;


-- 3. FIND OUT DEPARTMENT_NAME AND CITY
     select * from DEPARTMENTS d inner join LOCATIONS l
        on d.LOCATION_ID = l.LOCATION_ID;

    -- give same result without manager id null
    select * from DEPARTMENTS d inner join LOCATIONS l
                                       on d.LOCATION_ID = l.LOCATION_ID
    where MANAGER_ID is not null;


    -- how many department we have in each location
    select d.LOCATION_ID,count(*) from DEPARTMENTS d inner join LOCATIONS l
                                           on d.LOCATION_ID = l.LOCATION_ID
    where MANAGER_ID is not null
    group by d.LOCATION_ID;


-- 4. FIND OUT ALL CITIES  AND COUNTRY NAMES




-- 5. FIND OUT FIRST_NAME, LAST NAME, DEPARTMENT ID , DEPARTMENT NAME  FOR      DEPARTMENT ID 80 OR 40

-- 6. FIND OUT CITY , COUNTRY_NAME OF THAT CITY , REGION_NAME OF THAT CITY

--  7. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME , CITY

-- 8. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME , CITY , COUNTRY_NAME , REGION_NAME

--9. FIND OUT  EMPLOYEES FIRST_NAME, LAST NAME, DEPARTMENT ID AND ALL DEPARTMENTS
--  INCLUDING  WHERE DO NOT HAVE ANY EMPLOYEE.

--10. FIND OUT ALL DEPARTMENT_NAME  , LOCATION_ID , AND COUNTRY_ID
-- INCLUDING THOSE LOCATIONS  WITH NO DEPARTMENT

--11.FIND OUT DEPARTMENT_NAME , LOCATION_ID , AND COUNTRY_NAME
-- INCLUDING THOSE COUNTRIES WITH NO DEPARTMENT

--12. FIND OUT EMPLOYEES FIRST_NAME, DEPARTMENT ID AND DEPARTMENT NAME
-- INCLUDING THOSE DOES NOT HAVE DEPARTMENT
-- INCLUDING THOSE DEPARTMENTS  DOES NOT HAVE ANY MATCHING EMPLOYEES
