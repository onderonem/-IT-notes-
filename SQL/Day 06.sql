USE techproed;

CREATE TABLE customers_likes(
    product_id INT(10),
    customer_name VARCHAR(50),
    liked_product VARCHAR(50)
);

	INSERT INTO customers_likes VALUES (10, 'Ali Can', 'Orange');
    INSERT INTO customers_likes VALUES (50, 'Mark', 'Pineapple');
    INSERT INTO customers_likes VALUES (60, 'Lary', 'Avocado');
    INSERT INTO customers_likes VALUES (30, 'Hulya Guler', 'Strawberry');
    INSERT INTO customers_likes VALUES (20, 'Yesim Yilmaz', 'Apple');
    INSERT INTO customers_likes VALUES (10, 'Ali Can', 'Orange');
    INSERT INTO customers_likes VALUES (40, 'John', 'Apricot');
    INSERT INTO customers_likes VALUES (20, 'Yesim Yilmaz', 'Apple');
    
    
    CREATE TABLE customer_products(
    product_id CHAR(3),
    customer_name VARCHAR(50),
    product_name VARCHAR(50),
    CONSTRAINT product_id_pk PRIMARY KEY (product_id)
    );
    
    INSERT INTO customer_products VALUES ('10' , 'Ali Can' , 'Orange');
    INSERT INTO customer_products VALUES ('11' , 'Veli Han' , 'Cherry');
    INSERT INTO customer_products VALUES ('20' , 'Yesim Yilmaz' , 'Apple');
    INSERT INTO customer_products VALUES ('25' , 'Tugba Ilhan' , 'Pink');
    INSERT INTO customer_products VALUES ('30' , 'Hulya Guler' , 'Strawberry');
    INSERT INTO customer_products VALUES ('35' , 'Busranur Kodas' , 'Banana');
    
    
    SELECT * FROM customers_likes; 
    
	SELECT * FROM customer_products; 
    
    
    -- EXISTS condition: We use this condition with a sub query of other
    --                   tables to check if any related info shows up
    
    
	SELECT product_id, customer_name
    FROM customer_products
    WHERE EXISTS (SELECT product_id FROM customers_likes   
    WHERE  customer_products.product_id = customers_likes.product_id);
    -- bu ternary query gibi. bu yuzden parantez icinden basliyoruz. parantez ici, bana 
    -- customers_likes tablosundan product_id'yi getir diyor. Hangi kosulda? iki tabloda 
    -- product_id ayni ise getir diyor. bu kosula uyan 10,20 ve 30 var. parantez ici bize 
    -- bu 3 sayiyi verdi. simdi de customer_products tablosundan bu elemanlara uyan 
    -- product_id ve customer_name 'i vermesini istiyoruz.
    -- '10', 'Ali Can'
	-- '20', 'Yesim Yilmaz'
	-- '30', 'Hulya Guler'

    -- viceversa; Yukaridaki sorgunun tersini yapalim:
	SELECT product_id, customer_name
    FROM customers_likes
    WHERE EXISTS (SELECT product_id FROM customer_products   
    WHERE  customer_products.product_id = customers_likes.product_id);
    -- Burada da parantez ici bize 10,20 ve 30 degerlerini verecek.
    -- customers_likes tablosunda bu id'lere uyan id ve customer_name'ler:
    -- '10', 'Ali Can'
	-- '30', 'Hulya Guler'
	-- '20', 'Yesim Yilmaz'
	-- '10', 'Ali Can'
	-- '20', 'Yesim Yilmaz'

    
    
     
    -- The negative scenario
    SELECT product_id, customer_name
    FROM customers_likes
    WHERE EXISTS (SELECT product_id FROM customer_products   
    WHERE  customer_products.product_id = 37);
    -- no maching any value. so, there is nothing on the console
    
    -- **********************************************************************
    
    CREATE TABLE employees(
    id INT (10),
    name VARCHAR(50),
    state VARCHAR(50),
    salary INT(20),
    company VARCHAR(50)
    );
    
    INSERT INTO employees VALUES (123456789, 'John Walker', 'Florida', 2500, 'IBM');
    INSERT INTO employees VALUES (234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
    INSERT INTO employees VALUES (345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
    INSERT INTO employees VALUES (456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
    INSERT INTO employees VALUES (567890123, 'Eddie Murphy', 'Texas', 7200, 'MICROSOFT');
    INSERT INTO employees VALUES (678901234, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
    INSERT INTO employees VALUES (278634823, 'Mark Stone', 'Pennysylvania', 2500, 'IBM');
    SELECT * FROM employees; 
    
     -- create a second table called companies
    
	CREATE TABLE companies(
    company_id INT(10),
    company VARCHAR(50),
    number_of_employees INT(20)
    );
    INSERT INTO companies VALUES (100, 'IBM', 12000);
    INSERT INTO companies VALUES (101, 'GOOGLE', 18000);
    INSERT INTO companies VALUES (102, 'MICROSOFT', 10000);
    INSERT INTO companies VALUES (103, 'APPLE', 21000);
    SELECT *FROM companies;
    
    -- Find the employee and company names whose company has
    -- more than 15000 employees
    
    SELECT name, company FROM employees WHERE company
    IN(SELECT company FROM companies WHERE number_of_employees>15000); 
    
    
    -- SELECT  name, company FROM employees
    -- WHERE EXISTS(SELECT company FROM companies 
    -- WHERE number_of_employees>15000);  
    -- NEDEN CALISMIYOR?
    
    
    
    
    -- Find the company ids and company names that are in Florida
    SELECT company_id, company FROM companies WHERE company
    IN(SELECT company FROM employees WHERE state='Florida');
    
    
    
    
	 -- Find the employee name and state which has companies
     -- whose company ids are greater than 100
     SELECT name, state FROM employees WHERE company
     IN(SELECT company FROM companies WHERE company_id>100);
     
 -- *******************************************************************    

-- How to give temporary names to columns?

-- Normal Way: SELECT MAX(salary) FROM employees; -- ==> Max(salary)
-- Temporarily way for non technical people:      -- ==> '7200'

 SELECT MAX(salary)  AS MAX_SALARY FROM employees; -- ==> MAX_SALARY
												   -- ==> '7200'
                                                   
                                                   
-- Find the name of comapnies, company ids,
-- maximum and minimum salaries per company                                              
SELECT company, company_id, 
(SELECT MAX(salary) FROM employees WHERE employees.company = companies.company) 
AS max_salary,
(SELECT MIN(salary) FROM employees WHERE employees.company = companies.company) 
AS min_salary FROM companies;                                                
-- where part, her sirketin kendi icinde max-min ucretleri bulmamizi sagliyor.                                                   
                                                   
-- ********************************************************************************                                                  
                      -- LIKE CONDITION in SQL:  
                      
     -- 1) wildcard % :
     -- it represents zero or multiple                                              
                                                   
SELECT * FROM employees;
                
                
-- Select employee names which starts with E                                             
SELECT name FROM employees WHERE name LIKE 'E%'; -- ==> Starting point is E   

    
-- Select names ending with 'e'
SELECT name FROM employees WHERE name LIKE '%e'; -- ==> Ending point is e


-- Lets find the name that contains alk
SELECT name FROM employees WHERE name LIKE '%a%l%k%';


 -- select names that contain ad
SELECT name FROM employees WHERE name LIKE '%ad%';


 -- select names that have 'e' and 'r' in any position
SELECT name FROM employees WHERE name LIKE '%e%r%'
                              OR name LIKE '%r%e%';



         -- 2) wildcard: _  (Under scare)
		 -- it represents a single character
         

 -- Select a state whose second character is 'e' and forth char is 'n'
SELECT state FROM employees WHERE state LIKE '_e_n%';


-- Select a state whose second character from last is i
SELECT state FROM employees WHERE state LIKE '%i_';


-- Select a state whose second char is 'e' but it has at least 6 chars
SELECT state FROM employees WHERE state LIKE '_e____%';
                 
                 
-- Select a state that has 'i' in any position after the second char  
SELECT state FROM employees WHERE state LIKE '__%i%';    
    
-- *****************************************************************************    
				-- REGEXP_LIKE CONDITION in SQL:  
    -- Regular expressions are used with REGEXP_LIKE
    
-- 1.   [] ==> It represents only single character
--      [a] ==> It should be 'a'
--      [abc] ==> It can be 'a' or 'b' or 'c'
-- 2.   ^ ==> heat: it shows starting character
--      ^a ==> the word who starts a
-- 3.   $ ==> it shows finishing character
--      a$ ==> the word who finishes a
-- 4.  (.*) ==> it means: there are multiple character between two characters   
--      *  ==> there are more character after previous character 
-- 5.  . ==> only one character between two characters 


CREATE TABLE words(
word_id INT(10) UNIQUE,
word VARCHAR(50)NOT NULL,
number_of_letters INT (6)
);
    INSERT INTO words VALUES (1001,'hot', 3);
    INSERT INTO words VALUES (1002,'hat', 3);
    INSERT INTO words VALUES (1003,'hit', 3);
    INSERT INTO words VALUES (1004,'hbt', 3);
    INSERT INTO words VALUES (1005,'hct', 4);
    INSERT INTO words VALUES (1006,'adem',4);
    INSERT INTO words VALUES (1007,'selena', 6);
    INSERT INTO words VALUES (1008,'yusuf', 5);
   
    SELECT * FROM words;    
    
	-- Select words whose length is 3, 
    -- first character is 'h' and 
    -- the last char is 't' and 
    -- in the middle we should have 'o', 'a' or 'i'
    
	-- 1. Way:
    SELECT word
    FROM words
    WHERE word LIKE 'hot' OR word LIKE 'hat' OR word LIKE 'hit';
    
    
    -- 2. Way:
    SELECT word
    FROM words
    WHERE REGEXP_LIKE (word,'h[oai]t');
    
    
    -- Select words whose length is 3, first character is 'h' and 
    -- the last char is 't' and in the middle we should have from a to v
    SELECT word FROM words WHERE REGEXP_LIKE (word, 'h[a-v]t');
    
    
    -- Select words whose first char is 'a', 's' or 'y' 
    SELECT word
    FROM words
    WHERE REGEXP_LIKE (word, '^[asy] *'); 
	-- * :  this means after it, it may take zero or more letters
    -- % does not work in REGEXP_LIKE condition
    
    
    -- Select words whose last char is  'f'
	SELECT word
    FROM words
    WHERE REGEXP_LIKE (word, '[f]$');
    
    
    -- Select words whose first char is 's' and last char is 'a'      
    SELECT word
    FROM words
    WHERE REGEXP_LIKE (word, '^[s](.*)[a]$');
    
    
    
    -- Select words which have chars from 'd' to l at the beginning
    -- and followed by any chars then 't' as last char
    SELECT word
    FROM words
    WHERE REGEXP_LIKE (word, '^[d-l].[t]$');
    
    
    -- Select words which have chars from d to t at the beginning 
    -- followed by any 2 chars then e
	SELECT word
    FROM words
    WHERE REGEXP_LIKE (word, '^[d-t]..[e]');   -- .* zero or all multiple chars  .. __
    
    -- *************************************************************************************
    --                             NOT LIKE CONDITION: 
    
    -- Select words that does not have h 
    SELECT word
    FROM words 
    WHERE word NOT LIKE '%h%';
    
    
    -- Select words that does not start with h 
	SELECT word
    FROM words 
    WHERE word NOT LIKE 'h%';
    
    
    
    -- Select words that does not have h as a second char
    SELECT word
    FROM words 
    WHERE word NOT LIKE '_h%';
    
    
    
    -- Select the words which do not end with t and f
	SELECT word
    FROM words 
    WHERE word NOT LIKE '%t' AND word NOT LIKE '%f';
    
    
    
    -- Select words which start with any character, not followed by 'a', 
    -- not followed by 'e' (Second char shoul not be...)
    SELECT word
    FROM words 
    WHERE word NOT LIKE '_a%' AND word NOT LIKE '_e%'; -- NOT LIKE  !=
    
    -- ******************************************************************
   
   --                          ORDER BY ==> it give us natural order
    
    
    
    CREATE TABLE points(
    name VARCHAR(50),
    point INT(3)
	);
    
    INSERT INTO points VALUES('Ali', 25);
    INSERT INTO points VALUES('Veli', 37);
    INSERT INTO points VALUES('Kemal', 43);
    INSERT INTO points VALUES('Ali', 36);
    INSERT INTO points VALUES('Veli', 29);
    INSERT INTO points VALUES('Ali', 45);
    INSERT INTO points VALUES('Veli', 11);
    INSERT INTO points VALUES('Ali', 125);
    
    
    SELECT * FROM points;
    
    
    -- Put the names in ascending order and points in descending order, 
    SELECT *                -- select all values
    FROM points             -- from points table
    ORDER BY name,          -- give us names as an ascending order 
    point DESC;             -- give us points as an descending order 
    
    
    
    
    -- Put the names in descending order and points in ascending order, 
    SELECT *
    FROM points
    ORDER BY name DESC,
    point ;  
    -- When we are using ORDER BY in SQL, BY default it will order the fields in Ascending order, 
    -- but when you want to use descending order we need to explicitly type DESC order
	
    
    
    --
    SELECT point AS new_point, name AS new_name
    FROM points
    ORDER BY name ASC,
    point DESC;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    