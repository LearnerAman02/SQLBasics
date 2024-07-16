CREATE DATABASE temp;
USE temp;

CREATE TABLE students(
	id INT PRIMARY KEY,
    name VARCHAR(255)
);

INSERT INTO students VALUES(1,"Aniket");
SELECT * FROM students;

CREATE DATABASE org;
USE org;
CREATE TABLE IF NOT EXISTS worker(
	worker_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(50),
    lname VARCHAR(50),
    salary INT,
    joining_date DATETIME,
    department VARCHAR(255)
);

INSERT INTO worker
	(worker_id,fname,lname,salary,joining_date,department) VALUES
		(1,'Vishal','Mishra',200000,'14-02-20 09.00.00','surgery'),
        (2,'Sachin','Dubey',400000,'14-03-19 09.00.00','cardio'),
        (3,'Lucky','Paul',100000,'14-07-20 09.00.00','developer');

INSERT INTO worker
	(worker_id,fname,lname,salary,joining_date,department) VALUES
		(4,'Satyam','Mishra',250000,'14-09-21 09.00.00',NULL),
        (5,'Ankit','Dubey',300000,'14-03-19 09.00.00','cardio'),
        (6,'DJ','Paul',150000,'14-07-20 09.00.00',NULL);
        
SELECT fname, lname, salary FROM worker WHERE department IS NULL;

SELECT worker_id,fname,salary FROM worker WHERE lname LIKE '%r_';

-- SORTING
-- BY DEFAULT ASCENDING HOTA HAI
SELECT fname,lname,joining_date,salary FROM worker ORDER BY salary ASC;
-- FOR DESCENDING 
SELECT fname,lname,joining_date,salary FROM worker ORDER BY salary DESC;

-- BETWEEN KEYWORD
SELECT lname,fname FROM worker WHERE salary BETWEEN 150000 AND 250000;

-- GETTING DISTINCT DATA
SELECT DISTINCT department FROM worker;

-- GROUP BY ka use
SELECT department, COUNT(department) from worker group by department;
-- AVERAGE SALARY PER DEPARTMENT
SELECT department, AVG(salary) from worker GROUP BY department;

SELECT department, MIN(salary) from worker GROUP BY department;

-- GET MINIMUM SALARY OF EACH DEPARTMENT with their FULL NAME
SELECT fname,lname,department, MIN(salary) from worker GROUP BY fname,lname,department;
 
-- HAVING KEYWORD comes with GROUP BY
SELECT fname,lname,department,salary, COUNT(department) FROM worker GROUP BY fname,lname,department,salary HAVING MIN(salary)>150000;
 
-- PRIMARY KEY and FOREIGN KEY
CREATE TABLE customer(
   id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
   fname VARCHAR(255),
   lname VARCHAR(255),
   state VARCHAR(255),
   city VARCHAR(255)
);

INSERT INTO customer
     (id,fname,lname,state,city) VALUES
		(1,'Aman','Singh','Maharashtra','Mumbai'),
        (2,'Shubham','Singh','DELHI','Gurgaon'),
        (3,'Ankur','Singh','Uttar Pradesh','Allahabab');

-- Now creating a TABLE with a foreign key
CREATE TABLE ordertable(
    id INT NOT NULL PRIMARY KEY,
    cust_id INT,
    product VARCHAR(255),
    price INT,
    FOREIGN KEY(cust_id) REFERENCES customer(id)
);

CREATE TABLE account(
  id INT NOT NULL PRIMARY KEY,
  name VARCHAR(255) UNIQUE,
  balance INT,
  CONSTRAINT balance_check CHECK(balance>1000)
);

INSERT INTO account
	(id,name,balance) VALUES
        (1,'Aman Singh',200000),
        (2,'Sachin Singh',300000),
        (3,'Vishal Singh',1500),
        (4,'Harsheet Singh',200000);
        
-- ALTER OPERATIONS
-- ADDING NEW COLUMN IN EXISTING TABLE
ALTER TABLE account ADD city VARCHAR(20) NOT NULL DEFAULT "";

-- MODIFYING THE EXISTING COLUMN
ALTER TABLE account MODIFY city CHAR(255) NOT NULL;

-- RENAME COLUMN
ALTER TABLE account CHANGE COLUMN city address VARCHAR(145) NOT NULL default "Street";

-- RENAME TABLE 
ALTER TABLE account RENAME TO account_details;

-- DROP A COLUMN
ALTER TABLE account_details DROP COLUMN address;

-- DESCRIBE INFO REGARDING THE TABLE
DESC account;


SELECT * FROM worker;
SHOW TABLES;
