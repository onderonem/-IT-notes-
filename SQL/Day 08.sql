
-- 2 tablo arasinda baglantinin saglanmasi


	-- How to use Primary key and foreign key


	CREATE TABLE parents (
    student_id CHAR(3),    
    parent_name VARCHAR(50),
    phone_number CHAR(10),
    CONSTRAINT student_id_pk PRIMARY KEY (student_id)
    );
    
    INSERT INTO parents VALUES ('101', 'VELI CAN', '2024993748'); 
    -- 2. way of creating the records
    INSERT INTO parents (student_id, parent_name) VALUES ('102','Ayse Kan'); 
    -- We can create new records using less fileds
    INSERT INTO parents VALUES ('103', 'Osman Can', null); 
    
    SELECT * FROM parents;
    
    
	CREATE TABLE students01 (
    student_id CHAR(3),
    student_name VARCHAR(50),
    student_grade INT(2),
    student_age INT (2),
    CONSTRAINT student_id_fk FOREIGN KEY (student_id) REFERENCES parents(student_id)
    );
    
    INSERT INTO students01 VALUES ('101', 'Ahmet CAN', 10, 15); 
    INSERT INTO students01 VALUES ('102', 'Mehmet Kan', 10, 15); 
    INSERT INTO students01 VALUES ('103', 'Nesli CAN', 10, 15); 
    
    SELECT * FROM students01;
    
    
    -- Print on the console student name, age and related parent name, phone number
	SELECT s.student_name , s.student_age, p.parent_name, p.phone_number
    FROM students01 s, parents p
    WHERE s.student_id = p.student_id;
    
    
    
    -- When we want to drop parent table,
    -- we have to drop child table first then we can drop the parent table.
    
    --                   ON DELETE CASCADE KEYWORD
    -- It comes after REFERENCES() keyword. Help of ON DELETE CASCADE KEYWORD,
    -- we can easily delete any record in parent table without delete child table first.
    -- ON DELETE CASCADE KEYWORD already delete records on parent table and related all
    -- child tables.
    CREATE TABLE students01 (
    student_id CHAR(3),
    student_name VARCHAR(50),
    student_grade INT(2),
    student_age INT (2),
    CONSTRAINT student_id_fk FOREIGN KEY (student_id) REFERENCES parents(student_id)
    ON DELETE CASCADE);
    
    DELETE FROM parents WHERE student_id =101; 
    
    SELECT * FROM  parents;
	SELECT * FROM  students01;
    -- We delete the records from parent table. By helping  ON DELETE CASCADE
    -- keyword, the records at parent and child tables were deleted.  
-- ************************************************************************************
  
  -- ALTER keyword can updates everthing;
  -- UPDATE keyword updates just records(Rows).
  
  
  
   CREATE TABLE my_companies(
    company_id INT(9),
    company_name VARCHAR(20)
    );
    
    
    INSERT INTO my_companies VALUES (100, 'IBM');
    INSERT INTO my_companies VALUES (101, 'GOOGLE');
    INSERT INTO my_companies VALUES (102, 'MICROSOFT');
    INSERT INTO my_companies VALUES (103, 'APPLE');
    
    SELECT * FROM my_companies;
    
    
	-- ADD a new field to my companies
	-- How to add a new field to a table using Alter Table
	ALTER TABLE my_companies
	ADD company_address VARCHAR(80);
  
  
  
  -- Update just company address for company with id 101
  UPDATE my_companies
  SET company_address = 'Virginia'
  WHERE company_id = 101;
  
  
  
     -- How to add a new column and with default value
     ALTER TABLE my_companies
     ADD company_profession VARCHAR(80) DEFAULT 'IT';
   
   
    
    -- How to add multiple fields to a table?
    ALTER TABLE my_companies
    ADD (company_ceo VARCHAR(50), number_of_workers INT (5) DEFAULT 0);
    
    
    
    -- How to drop fields from a table
    ALTER TABLE my_companies
    DROP COLUMN company_ceo ;
    
    
    
    -- How to rename a field / column?
    ALTER TABLE my_companies
    RENAME COLUMN company_profession TO company_industry;
    
    
    
    SELECT * FROM my_companies;
    
    
    
     -- How to rename a table?
     ALTER TABLE my_companies
     RENAME TO  our_companies;
     
     
     SELECT * FROM our_companies;
     
     
     
    
	-- How to mofiy a field? (add constraints, change data type, change the size)
	-- How to add constraints?
    ALTER TABLE our_companies
    MODIFY number_of_workers INT(5) NOT NULL;
    
    
    UPDATE our_companies
    SET company_industry = null;
    
    
    
    
    -- How to change data types of columns?
    ALTER TABLE our_companies
    MODIFY company_industry CHAR(3);
    
    
    -- When we make these changes our fields values should be NULL
    -- Otherwise, some value size may be longer than expected 
    -- and it will not allow executions
    
    
   -- How to change the size of a field
   ALTER TABLE our_companies
   MODIFY company_industry CHAR(25);           -- it was CHAR(3)
   
-- *********************************************************************   
   
			-- JOIN KEYWORD
                            

   -- INNER JOIN  : Common records between tables
   -- LEFT JOIN
   -- RIGHT JOIN
   -- SELF JOIN
   
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