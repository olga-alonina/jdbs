select *
from EMPLOYEES;
--1. Display all first_name and department_name
select FIRST_NAME, DEPARTMENT_NAME
from EMPLOYEES E  inner join  DEPARTMENTS D on
        E.DEPARTMENT_ID= D.DEPARTMENT_ID;

--2.Display all first_name and department_name including the  department without employee
select FIRST_NAME, DEPARTMENT_NAME
from EMPLOYEES E  right join   DEPARTMENTS D on
        E.DEPARTMENT_ID= D.DEPARTMENT_ID;;
--3.Display all first_name and department_name including the  employee without department
select FIRST_NAME, DEPARTMENT_NAME
from EMPLOYEES E  left join   DEPARTMENTS D on
        E.DEPARTMENT_ID= D.DEPARTMENT_ID ;
--4.Display all first_name and department_name , including the  department without employee  and
-- employees  without departments
select FIRST_NAME, DEPARTMENT_NAME
from EMPLOYEES E  full join   DEPARTMENTS D on
        E.DEPARTMENT_ID= D.DEPARTMENT_ID;

--5.Display All cities and related country names
select city, COUNTRY_NAME
from LOCATIONS L left join COUNTRIES C on
        L.COUNTRY_ID = C.COUNTRY_ID;
--6.Display All cities and related country names  including with countries without city
select city, COUNTRY_NAME
from LOCATIONS L inner join COUNTRIES C on
        L.COUNTRY_ID = C.COUNTRY_ID;

--7.Display all department name and  street adresss
select DEPARTMENT_NAME, STREET_ADDRESS
from DEPARTMENTS D left join LOCATIONS L on
        D.LOCATION_ID=L.LOCATION_ID;
--8.Display first_name,last_name and department_name,city for all employees
select FIRST_NAME, LAST_NAME, DEPARTMENT_NAME, CITY
from EMPLOYEES E
         left join DEPARTMENTS D  on
        E.DEPARTMENT_ID = D.DEPARTMENT_ID
         left join LOCATIONS L on
        D.LOCATION_ID=L.LOCATION_ID;

--9.Display first_name,last_name and department_name,city,country_name for all employees
select FIRST_NAME, LAST_NAME, DEPARTMENT_NAME, CITY,COUNTRY_NAME
from EMPLOYEES E
         left join DEPARTMENTS D  on
        E.DEPARTMENT_ID = D.DEPARTMENT_ID
         left join LOCATIONS L on
        D.LOCATION_ID=L.LOCATION_ID
         left join COUNTRIES C on
        L.COUNTRY_ID=C.COUNTRY_ID;
--10.Display first_name,last_name and department_name,city who is living in United Kingdom todo rewatch 24 jul 10.30 till noon
select FIRST_NAME,LAST_NAME,DEPARTMENT_NAME,city,COUNTRY_NAME from EMPLOYEES e
                                                                       inner join DEPARTMENTS d
                                                                                  on e.DEPARTMENT_ID = d.DEPARTMENT_ID
                                                                       inner join LOCATIONS l
                                                                                  on d.LOCATION_ID = l.LOCATION_ID
                                                                       inner join COUNTRIES c
                                                                                  on l.COUNTRY_ID = c.COUNTRY_ID
Where COUNTRY_NAME='United Kingdom';

select * from LOCATIONS;
select * from COUNTRIES;

--without country name
select FIRST_NAME,LAST_NAME,DEPARTMENT_NAME,city from EMPLOYEES e
                                                          inner join DEPARTMENTS d
                                                                     on e.DEPARTMENT_ID = d.DEPARTMENT_ID
                                                          inner join LOCATIONS l
                                                                     on d.LOCATION_ID = l.LOCATION_ID

Where COUNTRY_ID='UK';


--11.Display how many employee we have for each country name
select COUNTRY_NAME,count(*)  from EMPLOYEES e
                                       inner join DEPARTMENTS d
                                                  on e.DEPARTMENT_ID = d.DEPARTMENT_ID
                                       inner join LOCATIONS l
                                                  on d.LOCATION_ID = l.LOCATION_ID
                                       inner join COUNTRIES c
                                                  on l.COUNTRY_ID = c.COUNTRY_ID
GROUP BY COUNTRY_NAME
order by count(*);