-- TASK 2 USING JOINS

-- Q.1 enlist all the employees ID, names along with project allocated to them
SELECT e.id,e.fname,e.lname,p.name FROM employee AS e INNER JOIN project AS p ON e.id=p.empID;

-- Q.2 Fetch all the employee ID's and their contact detail 
-- who have been working from JAIPUR with the clients name working in HYDERABAD

-- ANS 1
SELECT e.id,e.emailID,e.phoneNo,c.first_name,c.last_name FROM employee AS e INNER JOIN client AS c ON e.city='Jaipur' AND c.city='Hyderabad';
-- ANS 2
SELECT e.id,e.emailID,e.phoneNo,c.first_name,c.last_name FROM employee AS e INNER JOIN client AS c ON e.id=c.empID WHERE e.city='Jaipur' AND c.city='Hyderabad';

-- Q.3 Fetch out Project allocated to each employee
SELECT * FROM employee AS e LEFT JOIN project AS p ON p.empID = e.id;

-- Q.4 LIST OUT ALL PROJECTS along with the employee's name and their respective allocated email ID
SELECT p.name,e.fname,e.emailID FROM employee AS e RIGHT JOIN project as p ON p.empID=e.id;

-- Q.5 List out all the combinations possible for the employee's name and projects that can exist
SELECT e.fname,e.lname,p.id,p.name FROM employee AS e 
CROSS JOIN project AS p;
