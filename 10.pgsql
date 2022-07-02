-- Chapter 13: hierarchical queries 

-- 1. parent-child relationship
-- display each employee with their manager 
SELECT A.ENAME || ' works for ' || B.ENAME AS EMP_AND_MGR 
    FROM tutorial.emp AS A, tutorial.emp AS B 
    WHERE A.MGR = b.EMPNO;

-- 2. WITH clause for subquery
-- WITH + table_name (often use name X, as it is a temporary table) + (column1, column2, ...)
-- return all employess whose salary is above average
WITH X (AVG_SAL) AS (SELECT AVG(SAL) FROM tutorial.emp)
SELECT E.ENAME, E.SAL FROM tutorial.emp AS E, X WHERE E.SAL > X.AVG_SAL;

-- 3. find all children of a parent 
-- return all employees working for JONES 
WITH X (ENAME, EMPNO) AS (
    SELECT ENAME, EMPNO FROM tutorial.emp WHERE ENAME = 'JONES')
SELECT E.ENAME FROM tutorial.emp AS E, X WHERE E.MGR = X.EMPNO;