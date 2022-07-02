-- Chapter 3: working with multiple tables

-- 1. row stacking: UNION(); UNION ALL()
SELECT ENAME, DEPTNO FROM tutorial.emp WHERE DEPTNO = 10 UNION ALL SELECT ENAME, DEPTNO FROM tutorial.emp2;
-- UNION() will eliminate duplicate records

-- 2. inner join 
-- the 2 statements below are equivalent
SELECT E.ENAME, D.LOC FROM tutorial.emp AS E, tutorial.dept AS D WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = 10;
SELECT E.ENAME, D.LOC FROM tutorial.emp AS E INNER JOIN tutorial.dept AS D ON (E.DEPTNO = D.DEPTNO) WHERE E.DEPTNO = 10;

-- 3. join on multiple columns
CREATE VIEW tutorial.view_emp2 AS SELECT ENAME, JOB, SAL FROM tutorial.emp WHERE JOB = 'CLERK';

SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, E.DEPTNO FROM tutorial.emp AS E INNER JOIN tutorial.view_emp2 AS V2 ON (
    E.ENAME = V2.ENAME AND
    E.JOB = V2.JOB AND
    E.SAL = V2.SAL
);

-- 4. retrieve values from one table that do not exist in another
-- EXCEPT() returns values in left table that do not exist in right table
-- department 40 exists in dept table, but not in emp table 
-- the two statements below are equivalent
SELECT DEPTNO FROM tutorial.dept EXCEPT (SELECT DEPTNO FROM tutorial.emp);
SELECT DEPTNO FROM tutorial.dept AS D WHERE D.DEPTNO NOT IN (SELECT DEPTNO FROM tutorial.emp);

-- LEFT OUTER JOIN WITH NULL check
-- when LEFT OUTER JOIN, every row in left table will be returned
SELECT D.* FROM tutorial.dept AS D LEFT OUTER JOIN tutorial.emp AS E ON (D.DEPTNO = E.DEPTNO) WHERE E.DEPTNO IS NULL;

-- 5. SUM(), GROUP BY: join with aggregate
SELECT E.DEPTNO, D.LOC, SUM(SAL) AS TOTAL_SALARY FROM tutorial.emp AS E, tutorial.dept AS D WHERE E.DEPTNO = D.DEPTNO 
    GROUP BY E.DEPTNO, D.LOC;

-- 6. NULL in operations and comparisons
-- the two statements below are equivalent
SELECT ENAME, COMM FROM tutorial.emp WHERE COALESCE(COMM, 0) < (SELECT COMM FROM tutorial.emp WHERE ENAME = 'WARD');
SELECT ENAME, COMM FROM tutorial.emp WHERE COMM < (SELECT COMM FROM tutorial.emp WHERE ENAME = 'WARD') OR COMM IS NULL;
-- returns employees whose commision is either NULL or less than the commission of WARD. 