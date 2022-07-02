-- Chapter 7: Working with numbers 
-- Again, SQL is not a first choice for complex computations. Use Python or another language for that purpose; use SQL for easy computations. 

-- 1. average
SELECT AVG(SAL) AS AVERAGE_SALARY FROM tutorial.emp;

-- 2. min/max
SELECT MIN(SAL) AS MINIMUM_SALARY, MAX(SAL) AS MAXIMUM_SALARY FROM tutorial.emp;

-- 3. sum 
SELECT SUM(SAL) AS TOTAL_SALARY FROM tutorial.emp;

-- 4. count rows in a table
-- when counting row with COUNT(*), NULL is counted.
SELECT COUNT(*) FROM tutorial.emp;
SELECT DEPTNO, COUNT(*) AS EMP_COUNT FROM tutorial.emp GROUP BY DEPTNO;

-- COUNT (DISTINCT)
SELECT COUNT (DISTINCT DEPTNO) FROM tutorial.emp;


-- 5. count non NULL values in a column
-- when counting values in a column, NULL is ignored.
SELECT COUNT(COMM) FROM tutorial.emp;

-- 6. SUM() OVER: generate a running total 
-- while calculating running total, ORDER BY SAL, EMPNO avoids duplicates, as EMPNO is the primary key.
SELECT ENAME, SAL, SUM(SAL) OVER (ORDER BY SAL, EMPNO) AS RUNNING_TOTAL FROM tutorial.emp ORDER BY SAL;

-- 7. aggregating nullable columns
-- calculate average commission, where NULL is considered 0.
SELECT AVG(COALESCE(COMM, 0)) AS AVG_COMM FROM tutorial.emp WHERE DEPTNO = 30;

-- 8. CAST(): converts between data types
SELECT CAST (DEPTNO AS CHAR(2)) FROM tutorial.emp;

-- For more complex or statistical data manipulation, use Python or another programming language.
