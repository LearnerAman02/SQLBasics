CREATE TABLE IF NOT EXISTS dept(
	empid INT PRIMARY KEY,
    ename VARCHAR(255),
    role VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS dept2(
	empid INT PRIMARY KEY,
    ename VARCHAR(255),
    role VARCHAR(255)
);

INSERT INTO dept VALUES
	(1,"A","Engineer"),
    (2,"B","Salesman"),
    (3,"C","Manager"),
    (4,"D","Salesman"),
    (5,"E","Engineer");
INSERT INTO dept2 VALUES
    (3,"C","Manager"),
    (6,"F","Marketing"),
    (7,"G","Salesman");
    
    -- UNION
    SELECT * FROM dept
    UNION
    SELECT * FROM dept2;
    
    -- INTERSECTION
    SELECT d.ename,d.role FROM dept AS d
    INNER JOIN dept2 AS d2 USING (empid);
    
    -- MINUS
     SELECT d.ename,d.role FROM dept AS d
    LEFT JOIN dept2 AS d2 USING (empid)
    WHERE d2.empid IS NULL;
