-- Chapter 1: retrieving records

-- 1. select
SELECT * FROM tutorial.emp;
SELECT ENAME, JOB, HIREDATE FROM tutorial.emp;

-- 2. filter
SELECT * FROM tutorial.emp WHERE 
    DEPTNO = 10 
    OR COMM IS NOT NULL 
    OR (SAL <= 2000 AND DEPTNO = 20);

-- 3. alias 
SELECT SAL AS SALARY, COMM AS COMMISSION FROM tutorial.emp;

-- 4. column concatenation 
SELECT ENAME || ' WORKS AS A ' || JOB AS MSG FROM tutorial.emp WHERE DEPTNO=10;

-- 5. conditional logic with CASE WHEN/ELSE ... END    
SELECT ENAME AS EMPLOYEE_NAME, SAL AS SALARY, 
    CASE
        WHEN SAL <= 2E3 THEN 'OVERPAID'
        WHEN SAL >= 4E3 THEN 'UNDERPAID'
        ELSE 'FAIR'
    END AS STATUS 
FROM tutorial.emp;

-- 6. limit rows 
SELECT ENAME, SAL FROM tutorial.emp LIMIT 5;

-- 7. random rows
SELECT ENAME, JOB FROM tutorial.emp ORDER BY RANDOM() LIMIT 5;

-- 8. null values
SELECT ENAME, JOB FROM tutorial.emp WHERE COMM IS NULL;
SELECT ENAME, JOB, COMM FROM tutorial.emp WHERE COMM IS NOT NULL;

-- COALESCE(): returns 1st non-NULL value, or NULL if all values are NULL
SELECT COALESCE(COMM, 0) AS COMMISSION from tutorial.emp;

-- 9. IN(): filter by a list of values 
SELECT ENAME, JOB FROM tutorial.emp WHERE DEPTNO IN (10, 20);

SELECT ENAME, JOB, DEPTNO FROM tutorial.emp WHERE DEPTNO IN 
    (SELECT DEPTNO FROM tutorial.emp2 WHERE JOB = 'MANAGER');

-- 10. LIKE: search for patterns
-- % wild card, matching any string 
-- _ wild card, matching a single character
SELECT ENAME, JOB FROM tutorial.emp WHERE DEPTNO IN (10, 20) AND (JOB LIKE '_R%' OR JOB LIKE '%ER');

-- 11. DISTINCT
SELECT DISTINCT E.DEPTNO, D.LOC FROM tutorial.emp AS E INNER JOIN tutorial.dept AS D ON (E.DEPTNO = D.DEPTNO);

-- 12. COUNT(), SUM(), AVG()
SELECT COUNT (*) FROM tutorial.emp WHERE COMM IS NOT NULL;
SELECT COUNT (DISTINCT DEPTNO) FROM tutorial.emp WHERE COMM IS NOT NULL;
SELECT SUM (COMM) FROM tutorial.emp WHERE COMM IS NOT NULL AND DEPTNO = 30;
SELECT AVG (SAL) FROM tutorial.emp WHERE DEPTNO = 30;

-- 13. generate series: start, end, step. when missing step, default value is 1.
-- we need x(ID), otherwise we receive 'ID does not exist' error.
SELECT ID FROM GENERATE_SERIES (1, 10) x(ID);
