-- CREATE THE BELOW TABLE by using SQL COMMANDS 
https://drive.google.com/file/d/1_CKkuHQElUP0cgtzq4wXbAAtztcRpUro/view?usp=drivesdk

CREATE DATABASE IF NOT EXISTS company;
USE company;

CREATE TABLE employee(	
	id INT NOT NULL PRIMARY KEY,
    fname VARCHAR(255),
    lname VARCHAR(255),
    age INT,
    emailID VARCHAR(255),
    phoneNo INT,
    city VARCHAR(20)
);


-- INSERTING VALUES IN employee table now
INSERT INTO employee VALUES
	(1,'Aman','Proto',32,'aman@gmail.com',898,'Delhi'),
    (2,'Yagya','Narayan',44,'yagya@gmail.com',222,'Polam'),
    (3,'Rahul','BD',22,'rahul@gmail.com',444,'Kolkata'),
    (4,'Jatin','Hermit',31,'jatin@gmail.com',666,'Raipur'),
    (5,'PK','Pandey',21,'pk@gmail.com',555,'Jaipur');
    
SELECT * FROM employee;

-- CREATING CLIENT TABLE NOW because Project table ke liye Client ka id is reference
-- ISME EMPLOYEE ki ID is a FOREINGN KEY
DROP TABLE client;
CREATE TABLE client(
	id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT,
    emailID VARCHAR(60),
    phoneNo INT,
    city VARCHAR(40),
    empID INT,
    FOREIGN KEY(empID) REFERENCES employee(id) ON DELETE CASCADE
);

INSERT INTO client VALUES
     (1,'Mac','Rogers',47,'mac@hotmail.com',333,'Kolkata',3),
     (2,'Max','Poirier',27,'max@hotmail.com',222,'Kolkata',3),
     (3,'Peter','Jain',24,'peter@abc.com',111,'Delhi',1),
     (4,'Sushant','Agarwal',23,'sushant@yahoo.com',45454,'Hyderabad',5),
     (5,'Pratap','Singh',36,'p@xyz.com',77767,'Mumbai',2);
    
    
-- CREATING PROJECT TABLE
CREATE TABLE project(
	id INT NOT NULL PRIMARY KEY,
    empID INT,
    name VARCHAR(50),
    startdate datetime,
    clientID INT,
    FOREIGN KEY(empID) REFERENCES employee(id) ON DELETE CASCADE,
    FOREIGN KEY(clientID) REFERENCES client(id) ON DELETE CASCADE
    );

-- MISTAKE (maine starting mei type DATETIME rakh diya tha but it should be of type DATE so I used ALTER COMMAND below)
    ALTER TABLE project MODIFY startdate date;
    
    INSERT INTO project VALUES
      (1,1,'A','2021-04-21',3),
      (2,2,'B','2021-03-12',1),
      (3,3,'C','2021-01-16',5),
      (4,3,'D','2021-04-27',2),
      (5,5,'E','2021-05-01',4);
      
	SELECT * FROM project;
    
