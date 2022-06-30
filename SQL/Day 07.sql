
USE techproed;
  
    CREATE TABLE employeees(
    employee_id INT(9),
    employee_first_name VARCHAR(20),
    employee_last_name VARCHAR(20)
    );
    
    INSERT INTO employeees VALUES (14,'Chris', 'Tae');
    INSERT INTO employeees VALUES (11,'John', 'Walker');
    INSERT INTO employeees VALUES (12,'Amy', 'Star');
    INSERT INTO employeees VALUES (13,'Brad', 'Pitt');
    INSERT INTO employeees VALUES (15,'Chris', 'Way');
    
    
	CREATE TABLE addresses(
    employee_id INT(9),
    street VARCHAR(20),
    city VARCHAR(20),
    state CHAR(2),
    zipcode CHAR(5)
    );
    
    
    INSERT INTO addresses VALUES (11, '32nd Star 1234','Miami', 'FL', '33018');
    INSERT INTO addresses VALUES (12, '23rd Rain 567','Jacksonville', 'FL', '32256');
    INSERT INTO addresses VALUES (13, '5th Snow 765','Hialeah', 'VA', '20121');
    INSERT INTO addresses VALUES (14, '3rd Man 12','Weston', 'MI', '12345');
    INSERT INTO addresses VALUES (11, '11th Chris 12','St. Johns', 'FL', '32259');
    
    
    SELECT * FROM addresses;
    SELECT * FROM employeees;
    
    
--                        ALIASES (TAKMA AD)
--                     ************************
--                 How to use aliase for multiple names?



-- SELECT employee first name and state, 
-- for employee first name use "firstname' as field name 
-- and for state use employee state as field name
Select name AS firstname, state AS Employee_State FROM employees;
    
    
    
    
    -- When we use new name for the tables in SQL,            
    -- we can use them to describe the field names
    
    -- 1. WAY:
    Select employeees.employee_first_name, addresses.state, addresses.city
    FROM employeees , addresses
    WHERE employeees.employee_id = addresses.employee_id;
   
    -- 2. WAY:
    Select e.employee_first_name, a.state , a.city
    FROM employeees e, addresses a       -- ----> we gave temporarily names(aliases)
    WHERE e.employee_id = a.employee_id;
    
    
    
    
    
    --                      Concat Method 
    --                    *****************
     -- Get the employee id, use id as field name,
     -- get firstname and lastname and put them together into the same field as full name
     
	SELECT employee_id AS id, 
    concat (employee_first_name, " ", employee_last_name) AS Full_name
    FROM employeees;

    
    
    
    
    -- create a new table called workers
    
	CREATE TABLE workers2(
    id INT(9),
    name VARCHAR(50),
    state VARCHAR(50),
    salary INT(20),
    company VARCHAR(20)
    );
    INSERT INTO workers2 VALUES (123456789, 'John Walker', 'Florida', 2500, 'IBM');
    INSERT INTO workers2 VALUES (234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
    INSERT INTO workers2 VALUES (345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
    INSERT INTO workers2 VALUES (456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
    INSERT INTO workers2 VALUES (567890123, 'Eddie Murphy', 'Texas', 7200, 'MICROSOFT');
    INSERT INTO workers2 VALUES (678901234, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
    INSERT INTO workers2 VALUES (278634823, 'Mark Stone', 'Pennysylvania', 2500, 'IBM');
    
      Select * FROM workers;
      
      
    
	--                        GROUP BY 
    --                     **************
    -- When we use group by we can specify a specific field to get the the records around
    
    
    -- Find the total salary for every worker
    SELECT name, SUM(salary) AS total_salary -- ==> (AS total_salary) part is optional
    FROM workers2
    GROUP BY name;
    
    
    
	-- Find the number of employees per state in descending order by number of employees
    SELECT state, COUNT(name) AS NUMBER_OF_STATES
    FROM workers2
    GROUP BY state
    ORDER BY NUMBER_OF_STATES DESC;
    
    

-- Find the number of employees whose salary is more than $ 2000 per company
	SELECT company, COUNT(name) AS NUMBER_OF_EMPLOYEES
	FROM workers2
    WHERE salary > 2000
    GROUP by company;
    
    
    
    
    
    --                        HAVING
    --                     ************
    
    -- HAVING clause is also used to filter records after GROUP BY
    SELECT company, COUNT(name) AS NUMBER_OF_EMPLOYEES
    FROM workers2
    GROUP by company
    HAVING SUM(salary) > 2000;
    
    
    
-- Find the number of employees if it is more than 1 per state
   SELECT state, COUNT(state) AS NUMBER_OF_EMPLOYEES
   FROM workers2
   GROUP BY state
   HAVING COUNT(state) > 1;
   
   
   SELECT * FROM workers2;
   
   
   
-- Find the minimum salary if the salary is more than 2000 for every state
   SELECT state, MIN(salary) AS MINIMUM_SALARY
   FROM workers2
   GROUP BY state
   HAVING MIN(salary) > 2000;










