-- Create a new table
CREATE TABLE students(
std_id INT (3)  PRIMARY KEY,
std_name VARCHAR (20),
std_dob DATE
);
INSERT INTO students values (101, 'Ali Can' , '2002-05-16');
SELECT * FROM students;





 -- 2. way Create table using reference of other tables
CREATE TABLE referenceOfStudent AS SELECT std_name, std_dob FROM students;

SELECT * FROM referenceOfStudent;




-- How to create a new table with primary key using a new naming convention
 -- How to create a primary key with different name
 
CREATE TABLE students02(
std_id INT (3),
std_name VARCHAR (20),
std_dob DATE,
CONSTRAINT student_id_pk  PRIMARY KEY(std_id)
);
INSERT INTO students02 VALUES(101, 'Ali Can' , '2005-03-25');
INSERT INTO students02 VALUES(102, 'Veli Han' , '2005-02-24');
SELECT  * FROM students;


 -- Create a new table with UNIQUE constraint 
 -- it means value for this column can be null, but cannot be duplicate.
CREATE TABLE students03(
std_id INT (3)  UNIQUE,
std_name VARCHAR (20),
std_dob DATE
);
INSERT INTO students03 VALUES(101, 'Ali Can' , '2005-03-25');
INSERT INTO students03 VALUES(NULL, 'Veli Han' , '2005-02-24');
SELECT  * FROM students03;