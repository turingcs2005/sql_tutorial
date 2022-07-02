-- Data preparation

-- 1. Drop schema, tables and views
-- A schema is a list of logical structures of data. It defines how data are organized within a relational database.
-- When you drop a schema, order matters. Views depend on tables; tables depend on schemas. 
-- With option CASCADE, you drop the whole schema tree, i.e. schema, tables, views.
DROP SCHEMA IF EXISTS tutorial CASCADE;

DROP SCHEMA IF EXISTS tutorial 
DROP VIEW IF EXISTS view_emp;
DROP TABLE IF EXISTS emp;

-- 2. Create schema, tables and views
-- Create a schema
CREATE SCHEMA IF NOT EXISTS tutorial AUTHORIZATION rui;

-- Create employee table for schema under the schema
CREATE TABLE IF NOT EXISTS tutorial.emp (
    EMPNO INT NOT NULL PRIMARY KEY,
    ENAME VARCHAR(20),
    JOB VARCHAR(20),
    MGR INT,
    HIREDATE DATE,
    SAL INT,
    COMM INT,
    DEPTNO INT
);

INSERT INTO tutorial.emp VALUES 
(7369, 'SMITH', 'CLERK', 7902, '2005-12-17', 800, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '2006-02-20', 1600, 300, 30),
(7521, 'WARD', 'SALESMAN', 7698, '2006-02-22', 1250, 500, 30),
(7566, 'JONES', 'MANAGER', 7839, '2006-04-02', 2975, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '2006-09-28', 1250, 1440, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '2006-05-01', 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '2006-06-09', 2450, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '2007-12-09', 3000, NULL, 20),
(7839, 'KING', 'PRESIDENT', NULL, '2006-11-17', 5000, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '2006-09-08', 1500, 0, 30),
(7876, 'ADAMS', 'CLERK', 7788, '2008-01-12', 1100, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '2006-12-03', 950, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '2006-12-03', 3000, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '2007-01-23', 1300, NULL, 10);

-- Create a view under schema. A view stores only logics for producing the view, not real data. This saves storage.
CREATE VIEW tutorial.view_emp AS SELECT ENAME || ' ' || DEPTNO AS NAME_DEPT FROM tutorial.emp
    ORDER BY NAME_DEPT DESC;

SELECT * FROM tutorial.view_emp;

-- create more tables 
-- department table
CREATE TABLE IF NOT EXISTS tutorial.dept (
    DEPTNO INT NOT NULL PRIMARY KEY,
    DNAME VARCHAR(20),
    LOC VARCHAR(20)
);

INSERT INTO tutorial.dept VALUES 
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

-- Create a table by copying the table structure of another 
CREATE TABLE tutorial.emp2 AS SELECT * FROM tutorial.emp WHERE 1 = 0;
-- 1 = 0 is never true so the new table will be empty.

-- populate emp2
INSERT INTO tutorial.emp2 VALUES 
(8250, 'SUE', 'CLERK', 7902, '2007-11-12', 800, NULL, 20),
(8251, 'CLAIRE', 'SALESMAN', 7698, '2011-10-11', 1600, 300, 30),
(8253, 'LIAM', 'SALESMAN', 7698, '2011-12-22', 1250, 500, 30),
(8254, 'MAGGIE', 'MANAGER', 7839, '2006-04-02', 2975, NULL, 20),
(8255, 'QUINCY', 'SALESMAN', 7698, '2012-09-28', 1250, 1440, 30),
(8256, 'PANELOPE', 'MANAGER', 7839, '2012-05-01', 2850, NULL, 30);
