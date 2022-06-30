USE techproed;
CREATE TABLE students05(
std_id INT PRIMARY KEY,
std_name VARCHAR(20),
std_dob DATE
);


SELECT * FROM students05;    -- It shows current form of the table

DROP TABLE students05;       -- Another way to dropping table


-- How to add values into the table?
-- First Way:
INSERT INTO students05 VALUES(101, 'Ali Can' , '2005-03-25');
INSERT INTO students05 VALUES(102, 'Veli Han' , '2005-02-24');
INSERT INTO students05 VALUES(103, 'John Case' , '1999-03-25');
INSERT INTO students05 VALUES(104, 'Merry Johnson' , '2007-04-25');
-- Second Way:
INSERT INTO students05(std_id, std_name) VALUES( 108, 'Dido' ); -- std_dob is NULL


-- How to update a specific records in the table?
-- for exm: Ali Can => Leo Ocean
UPDATE students05 SET std_name = 'Leo Ocean' WHERE std_id =101;
SELECT * FROM students05; 
UPDATE students05 SET std_name = 'Lili' WHERE std_id =108;  -- we can also use std_name 
-- instead of std_id (Primary Key). In this case, all values have same name will be changed.	


-- How can we update all birth dates for people who have an id more than 101
UPDATE students05 SET std_dob = '2001-05-21' WHERE std_id > 101;		
UPDATE students05 SET std_dob= '1972-01-01' WHERE std_dob>'1972-01-01';

-- Create workers table whose fields are worker_id, worker_name, worker_salary.
-- worker_id will have primary key with the name worker_id_pk
-- Insert 4 records into the workers table
-- See the table on the console

CREATE TABLE workers(
worker_id INT,
worker_name VARCHAR(20),
worker_salary INT,
CONSTRAINT worker_id_pk PRIMARY KEY (worker_id)
);
INSERT INTO workers VALUES('101','Ali Can', 12000);
INSERT INTO workers VALUES('102','Veli Han', 2000);
INSERT INTO workers VALUES('103','Ayse Kan', 7000);
INSERT INTO workers VALUES('104','Angie Ocean', 8500);


-- To get all records from the table:
SELECT * FROM workers;  -- * means: all


-- To get specific field (column) from the table
SELECT worker_name FROM workers; 


-- to get a specific data from the column
-- for exm: what is the name of worker has id 101?
SELECT worker_name FROM workers WHERE worker_id=101;


-- How to get MAX salary from the table?
SELECT max(worker_salary ) FROM workers;  -- 12000

-- How to get MIN salary from the table?
SELECT min(worker_salary ) FROM workers;  -- 2000

-- To get all records whose names length are grater than 8
SELECT * FROM workers WHERE length(worker_name)>8 ; -- '104', 'Angie Ocean', '8500'

-- To get worker names length are grater than 6
SELECT worker_name FROM workers WHERE length(worker_name)>7 ;	-- 'Veli Han'
																-- 'Ayse Kan'
																-- 'Angie Ocean'




-- Interview Q: How to get the records of the person who has the minimum salary?
SELECT * FROM workers WHERE worker_salary = (SELECT min(worker_salary ) FROM workers);
-- '102', 'Veli Han', '2000'











