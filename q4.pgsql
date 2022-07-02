-- Chapter 4: inserting, updating and deleting

-- 1. INSERT new record(s)
INSERT INTO tutorial.dept VALUES (50, 'PROGRAMMING', 'BALTIMORE');

INSERT INTO tutorial.dept VALUES 
    (60, 'LEGAL', 'WORCESTER'),
    (70, 'HUMAN RESOURCES', 'SPRINGFIELD');

-- 2. column with DEFAULT values 
CREATE TABLE tutorial.student (
    STID INT NOT NULL PRIMARY KEY,
    STNAME VARCHAR(20) NOT NULL,
    SCHOOL VARCHAR(20) DEFAULT 'LUCE ELEMENTARY'
);

INSERT INTO tutorial.student VALUES
(101, 'CLAIRE', DEFAULT),
(102, 'JOSH', 'MILTON ACADEMY'),
(103, 'PANELOPE', 'KENNEDY');

-- 3. insert data from another table
INSERT INTO tutorial.emp SELECT * FROM tutorial.emp2;

-- 5. UPDATE() & SET(): modify records
UPDATE tutorial.emp2 AS E2 SET SAL = SAL * 1.2 WHERE E2.DEPTNO = 20;

-- 6. delete records
-- delete all records
DELETE FROM tutorial.emp2;

-- delete specific records 
DELETE FROM tutorial.student WHERE SCHOOL = 'KENNEDY';

-- 7. delete records where column value doesn't exist in another table 
DELETE FROM tutorial.dept WHERE DEPTNO NOT IN (SELECT DEPTNO FROM tutorial.emp);