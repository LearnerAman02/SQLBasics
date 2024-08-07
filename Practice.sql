CREATE DATABASE IF NOT EXISTS practice;
USE practice;
CREATE TABLE worker(
	worker_id INT not null PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(255),
    lname VARCHAR(255),
    salary INT,
    join_date DATETIME,
    department CHAR(25)
);
SHOW TABLES;
INSERT INTO worker
         (worker_id,fname,lname,salary,join_date,department) VALUES
         (001,'Monika','Arora',100000,'14-02-20 09.00.00','HR'),
         (002,'Niharika','Verma',80000,'14-06-11 09.00.00','Admin'),
         (003,'Vishal','Singhal',300000,'14-02-20 09.00.00','HR'),
         (004,'Amitabh','Singh',500000,'14-02-20 09.00.00','Admin'),
         (005,'Vivek','Bhati',500000,'14-06-11 09.00.00','Admin'),
         (006,'Vipul','Diwan',200000,'14-06-11 09.00.00','Account'),
         (007,'Satish','Kumar',75000,'14-01-20 09.00.00','Account'),
         (008,'Geetika','Chauhan',90000,'14-04-11 09.00.00','Admin');


CREATE TABLE bonus(
	worker_ref_id INT,
    bonus_amt INT,
    bonus_date DATETIME,
    FOREIGN KEY (worker_ref_id) references worker(worker_id) ON DELETE CASCADE
);

INSERT INTO bonus VALUES
	(1,5000,'2016-02-20 00:00:00'),
    (2,3000,'2016-06-11 00:00:00'),
    (3,4000,'2016-02-20 00:00:00'),
    (1,4500,'2016-02-20 00:00:00'),
    (2,3500,'2016-06-11 00:00:00');
    
CREATE TABLE title(
	worker_ref_id INT,
    worker_title VARCHAR(255),
    affected_from DATETIME,
    FOREIGN KEY (worker_ref_id) REFERENCES worker(worker_id) ON DELETE CASCADE
);

INSERT INTO title VALUES
	(1,'Manager','2016-02-20 00:00:00'),
    (2,'Executive','2016-06-11 00:00:00'),
    (8,'Executive','2016-06-11 00:00:00'),
    (5,'Manager','2016-06-11 00:00:00'),
    (4,'Asst. Manager','2016-06-11 00:00:00'),
    (7,'Executive','2016-06-11 00:00:00');
    
SELECT * FROM title;
SELECT * FROM bonus;

-- QUESTION SOLVING

SELECT * FROM worker;

SELECT fname FROM worker AS worker_name;
SELECT ucase(fname) FROM worker;
-- select distinct department name
SELECT DISTINCT department FROM worker;
-- isko using groupby bhi kr sakte hai hum
SELECT department FROM worker GROUP BY department;

-- print first three characters of fname from worker table
SELECT substr(fname,1,3) FROM worker;

-- at which position 'b' appears in 'Amitabh'
SELECT INSTR(fname,'b') FROM worker WHERE fname='Amitabh';

-- trim whitespaces in right side
SELECT RTRIM(fname) FROM worker;

-- trim whitespaces in left side
SELECT LTRIM(fname) FROM worker;

SELECT department,LENGTH(department) FROM worker GROUP BY department;
SELECT DISTINCT department,LENGTH(department) FROM worker;

-- in all first name replace 'a' with 'A'
SELECT replace(fname,'a','A') FROM worker;

-- write a sql query to print fname and lname in a single column 
-- A space char should separate them
SELECT CONCAT(fname,' ',lname) as full_name FROM worker;

-- print workers ka detail which will be sorted on basis of fname
SELECT * FROM worker ORDER BY fname;

-- print workers ka detail which will be sorted on basis of fname ASC and department desc
SELECT * FROM worker ORDER BY fname ASC,department DESC;

-- print details for worker with fname 'Vipul' and 'Satish' from worker table
SELECT * FROM worker WHERE fname = 'Vipul' OR fname = 'Satish';
SELECT * FROM worker WHERE fname IN ('Vipul','Satish');

-- print details of workers except them
SELECT * FROM worker WHERE fname NOT IN ('Vipul','Satish');

-- print details of workers who all work in Admin dept
SELECT * FROM worker WHERE department = 'Admin';

-- print details of workers whose first name contains 'a'
SELECT * FROM worker WHERE fname LIKE '%a%';

-- whose first name ends with 'a'
SELECT * FROM worker WHERE fname LIKE '%a';

-- whose fname ends with 'h' and contains 6 letters
SELECT * FROM worker WHERE fname LIKE '%h' AND length(fname)=6;
SELECT * FROM worker WHERE fname LIKE '_____h';

-- details of customer whose salary lies in between 100000 AND 500000
SELECT * FROM worker WHERE salary BETWEEN 100000 AND 500000;

-- Details of workers who have joined in Feb'2014
SELECT * FROM worker WHERE YEAR(join_date)=2014 AND month(join_date) = 02;

-- count of employees working in 'Admin' dept
SELECT department,COUNT(department) FROM worker WHERE department='Admin';

-- full name of workers having salary >=50000 AND <=100000
SELECT concat(fname,' ',lname) AS full_name,salary FROM worker WHERE salary BETWEEN 50000 AND 100000;

-- fetch no. of workers for each department in descending order
SELECT department,COUNT(department) FROM worker GROUP BY department;
SELECT department,COUNT(department) FROM worker GROUP BY department ORDER BY COUNT(department) DESC;

-- print details of workers who are also managers
SELECT w.*,t.worker_title FROM worker as w INNER JOIN 
title as t ON w.worker_id = t.worker_ref_id WHERE t.worker_title = 'Manager';

-- fetch number of different titles > 1 in organization
SELECT worker_title,COUNT(worker_title) as titleCount FROM title GROUP BY worker_title HAVING titleCount>1;

-- show only odd rows detail ****(IMP)****
SELECT * FROM worker WHERE MOD(worker_id,2) != 0;
SELECT * FROM worker WHERE MOD(worker_id,2) <> 0;

-- show only even rows detail ****(IMP)****
SELECT * FROM worker WHERE MOD(worker_id,2) = 0;

-- clone a new table from existing table


