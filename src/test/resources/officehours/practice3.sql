
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

    select city,COUNTRY_NAME from COUNTRIES c inner join LOCATIONS l
        on c.COUNTRY_ID = l.COUNTRY_ID;


-- 5. FIND OUT FIRST_NAME, LAST NAME, DEPARTMENT ID , DEPARTMENT NAME  FOR
--    DEPARTMENT ID 80 OR 40

        select FIRST_NAME,LAST_NAME,d.DEPARTMENT_ID,DEPARTMENT_NAME
        from EMPLOYEES e inner join DEPARTMENTS d
            on e.DEPARTMENT_ID = d.DEPARTMENT_ID
        where d.DEPARTMENT_ID IN (80,40);


        -- how many employes we have for that departments
            select DEPARTMENT_NAME,count(*)
            from EMPLOYEES e inner join DEPARTMENTS d
                              on e.DEPARTMENT_ID = d.DEPARTMENT_ID
            where d.DEPARTMENT_ID IN (80,40)
            group by DEPARTMENT_NAME;


-- 6. FIND OUT CITY , COUNTRY_NAME OF THAT CITY , REGION_NAME OF THAT CITY
    select city,COUNTRY_NAME,REGION_NAME from LOCATIONS l
        inner join COUNTRIES c on l.COUNTRY_ID = c.COUNTRY_ID
         inner join  REGIONS r on c.REGION_ID = r.REGION_ID;

--  7. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME , CITY
    select FIRST_NAME,JOB_TITLE,DEPARTMENT_NAME,CITY from JOBS j
            inner join EMPLOYEES E on j.JOB_ID = E.JOB_ID
            inner join Departments d on E.DEPARTMENT_ID = d.DEPARTMENT_ID
            inner join LOCATIONS l on d.LOCATION_ID = l.LOCATION_ID;

-- 8. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME , CITY , COUNTRY_NAME , REGION_NAME
    select FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME , CITY , COUNTRY_NAME , REGION_NAME from EMPLOYEES e
         inner join JOBS J on J.JOB_ID = e.JOB_ID
         inner join DEPARTMENTS d  on e.DEPARTMENT_ID = d.DEPARTMENT_ID
         inner join LOCATIONS l on d.LOCATION_ID = l.LOCATION_ID
         inner join COUNTRIES c on l.COUNTRY_ID = c.COUNTRY_ID
         inner join REGIONS r on c.REGION_ID = r.REGION_ID;


--9. FIND OUT  EMPLOYEES FIRST_NAME, LAST NAME, DEPARTMENT ID AND ALL DEPARTMENTS
--  INCLUDING  WHERE DO NOT HAVE ANY EMPLOYEE.
 select FIRST_NAME, LAST_NAME, d.DEPARTMENT_ID
 from EMPLOYEES e right outer join DEPARTMENTS d
    on e.DEPARTMENT_ID = d.DEPARTMENT_ID;


select FIRST_NAME, LAST_NAME, d.DEPARTMENT_ID
from DEPARTMENTS d left  join EMPLOYEES e
                                  on d.DEPARTMENT_ID = e.DEPARTMENT_ID;


--10. FIND OUT ALL DEPARTMENT_NAME  , LOCATION_ID , AND COUNTRY_ID
-- INCLUDING THOSE LOCATIONS  WITH NO DEPARTMENT
select DEPARTMENT_NAME  , l.LOCATION_ID ,COUNTRY_ID from DEPARTMENTS d
        right outer join locations l on d.LOCATION_ID = l.LOCATION_ID;



--11.FIND OUT DEPARTMENT_NAME , LOCATION_ID , AND COUNTRY_NAME
-- INCLUDING THOSE COUNTRIES WITH NO DEPARTMENT
    select DEPARTMENT_NAME , l.LOCATION_ID ,COUNTRY_NAME from DEPARTMENTS d
        -- returns all matching location for departmens + any location that does not have any department
        right outer join LOCATIONS l on d.LOCATION_ID = l.LOCATION_ID
        -- returns all matching countries for lcoations  + any countries that does not have any locations
        right outer  join COUNTRIES c on l.COUNTRY_ID = c.COUNTRY_ID;



--12. FIND OUT EMPLOYEES FIRST_NAME, DEPARTMENT ID AND DEPARTMENT NAME
-- INCLUDING THOSE DOES NOT HAVE DEPARTMENT
-- INCLUDING THOSE DEPARTMENTS  DOES NOT HAVE ANY MATCHING EMPLOYEES

    select FIRST_NAME, d.DEPARTMENT_ID,DEPARTMENT_NAME from EMPLOYEES e
        full join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID;

select count(*) from employees;
