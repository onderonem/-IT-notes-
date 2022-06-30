
-- ================ UNION AND UNION ALL OPERATORS =======================================

-- UNION : collects the result of 2 queries, it will collect just the Unique values
-- UNION ALL : collects the result of 2 queries, it will collect all values including duplicates
   
   
   
    CREATE TABLE workers3(
    id INT(9),
    name VARCHAR(50),
    state VARCHAR(50),
    salary INT(20),
    company VARCHAR(20)
    );
    
    INSERT INTO workers3 VALUES (123456789, 'John Walker', 'Florida', 2500, 'IBM');
    INSERT INTO workers3 VALUES (234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
    INSERT INTO workers3 VALUES (345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
    INSERT INTO workers3 VALUES (456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
    INSERT INTO workers3 VALUES (567890123, 'Eddie Murphy', 'Texas', 7200, 'MICROSOFT');
    INSERT INTO workers3 VALUES (678901234, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
    INSERT INTO workers3 VALUES (278634823, 'Mark Stone', 'Pennysylvania', 2500, 'IBM');
    
    SELECT * FROM workers3;
    
    
    
   
	-- Find the state whose salary is greater than 3000, 
	-- employee names whose salaries are less than 2000
    
   -- SELECT state FROM  workers3 WHERE salary>3000 OR I  -- it does not work.
   -- SELECT name FROM  workers3 WHERE salary<2000;
    
    
                                                                       -- State or Name
   SELECT state AS "State or Name" FROM workers3 WHERE salary >3000    --   'Texas'
   UNION															   --   Brad Pitt
   SELECT name  AS "State or Name" FROM workers3 WHERE salary < 2000;  -- 'Eddie Murphy'                                                   
                                                            

  
   
    -- Please get the same records with duplicate values
    SELECT state AS "State or Name" FROM workers3 WHERE salary > 3000
    UNION ALL                       -- this will get all records including duplicate ones
    SELECT name AS "State or Name" FROM workers3 WHERE salary < 2000;
    
    
    
 
 -- ************************ JOIN KEY ====================================   
    
-- INNER JOIN: All common records from both tables will be selected
-- LEFT JOIN: ALL records from LEFT table will be selected and
             --   all matching records from the RIGHT Table
-- LEFT JOIN: ALL records from RIGHT table will be selected and 
             --   all matching records from the LEFT Table

    
    
	CREATE TABLE my_companies(
    company_id INT(9),
    company_name VARCHAR(20)
    );
    
    INSERT INTO my_companies VALUES (100, 'IBM');
    INSERT INTO my_companies VALUES (101, 'GOOGLE');
    INSERT INTO my_companies VALUES (102, 'MICROSOFT');
    INSERT INTO my_companies VALUES (103, 'APPLE');
    
    CREATE TABLE orders(
    order_id INT(9),
    company_id INT(9),
    order_date DATE
    );
    
    INSERT INTO orders VALUES (11, 101, '2020-04-18');
    INSERT INTO orders VALUES (22, 102, '2020-04-19');
    INSERT INTO orders VALUES (33, 103, '2020-04-20');
    INSERT INTO orders VALUES (44, 104, '2020-04-21');
    INSERT INTO orders VALUES (55, 105, '2020-04-22');
    
	SELECT * FROM my_companies;
    SELECT * FROM orders;
    
    
    
    
    -- Select company name, order id, order date for common companies

    SELECT mc.company_name, o.order_id, o.order_date
    FROM my_companies mc INNER JOIN orders o
    ON mc.company_id = o.company_id;
    
    
    
    
    -- Select company name, order id, order date for LEFT table and 
    -- matching records from the Right Table
    
    SELECT mc.company_name, o.order_id, o.order_date
    FROM my_companies mc LEFT JOIN orders o
    ON mc.company_id=o.company_id; 
    
    
	SELECT * FROM my_companies;
    SELECT * FROM orders;
    
    
     -- Select company name, order id, order date for RIGHT table and
     -- matching records from the LEFT Table
    
    SELECT mc.company_name, o.order_id, o.order_date
    FROM my_companies mc RIGHT JOIN orders o
    ON mc.company_id = o.company_id;
    
    
    
    
   -- SELF JOIN
-- If we make an inner join with just one table => SELF JOIN
    
    
  CREATE TABLE workers4 (  
  id INT(2), 
  name varchar(20),
  title varchar(60),
  manager_id INT(2) 
);
    
INSERT INTO workers4 VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers4 VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers4 VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers4 VALUES(4, 'Amy Sky', 'CEO', 5);

    SELECT * FROM workers4;
    
    
    
    -- Create a table which displays the manager of employees
    SELECT employee.name, manager.name
    FROM workers4 employee RIGHT JOIN workers4 manager
    ON employee.manager_id = manager.id;
    
    
    
    
    
    -- Create a table which displays the employees and manager of employees.
-- Without using Aliases
SELECT workers4.name AS employee_name, workers4.name AS manager_name
FROM workers4  INNER JOIN workers4 
ON workers4.manager_id = workers4.id;


-- With using Aliases
SELECT employee.name AS employee_name, manager.name AS manager_name
FROM workers4 employee INNER JOIN workers4 manager
ON employee.manager_id = manager.id;
    
    
    
-- ***************** INTERVIEW QUESTIONS ****************************    
                       
     CREATE TABLE workers3(
    id INT(9),
    name VARCHAR(50),
    state VARCHAR(50),
    salary INT(20),
    company VARCHAR(20)
    );
    
    INSERT INTO workers3 VALUES (123456789, 'John Walker', 'Florida', 2500, 'IBM');
    INSERT INTO workers3 VALUES (234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
    INSERT INTO workers3 VALUES (345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
    INSERT INTO workers3 VALUES (456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
    INSERT INTO workers3 VALUES (567890123, 'Eddie Murphy', 'Texas', 7200, 'MICROSOFT');
    INSERT INTO workers3 VALUES (678901234, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
    INSERT INTO workers3 VALUES (278634823, 'Mark Stone', 'Pennysylvania', 2500, 'IBM');
    
    
    
    -- INTERVIEW QUESTION: Select all data about the worker
    -- Whose salary is the highest from workers table

--  First way: 
SELECT * FROM workers3
WHERE salary = (SELECT MAX(salary) FROM workers3);
-- Second way:
SELECT * FROM workers3
ORDER BY salary DESC
LIMIT 1; 



-- Second highest:
SELECT * FROM workers3
ORDER BY salary DESC
LIMIT 2; -- We can see highest and we can see second highest salary
    
   -- ========================================= 
    
-- INTERVIEW QUESTION
-- Select all data about the worker whose salary is the second highest

-- First way: 
SELECT * FROM workers3 
ORDER BY salary DESC
LIMIT 1
OFFSET 1;  -- OFFSET 1, eleminates the first element    
    
SELECT * FROM workers3 
ORDER BY salary DESC
LIMIT 1
OFFSET 2; -- OFFSET 2, eleminates first  two elements, so     
          -- it gives us the third highest salary records
          
          
 -- Second way:   
SELECT * FROM workers3
WHERE salary = ( SELECT MAX(salary) AS SECOND_MAX_SALARY FROM workers3
						WHERE salary < (SELECT MAX(salary) FROM workers3));
 
 
 
 
 
 
 
 
 
 
 
 
 
          
          