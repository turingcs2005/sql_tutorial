-- Chapter 2: sorting query results

-- 1. order by
SELECT ENAME, JOB, SAL FROM tutorial.emp WHERE DEPTNO = 10 ORDER BY SAL ASC;
SELECT ENAME, JOB, SAL FROM tutorial.emp ORDER BY SAL DESC;

-- 2. order by multiple columns
SELECT EMPNO, DEPTNO, SAL, ENAME, JOB FROM tutorial.emp ORDER BY DEPTNO ASC, SAL DESC;

-- 3. order by substring
-- order by the first 2 characters of JOB. starting at position 1; extract 2 characters
SELECT ENAME, JOB FROM tutorial.emp ORDER BY SUBSTR(JOB, 1, 2);

-- order by the last 2 characters of JOB. starting at second to last character; extract 2 characters.
SELECT ENAME, JOB FROM tutorial.emp ORDER BY SUBSTR(JOB, LENGTH(JOB) -1, 2);

-- 5.REPLACE() and TRANSLATE()
-- REPLACE(): full-string substitution
SELECT ENAME, JOB, REPLACE(JOB, 'MANAGER', 'DIRECTOR') AS NEW_JOB FROM tutorial.emp ORDER BY NEW_JOB ASC;

-- TRANSLATE(): character-by-character substitution.
-- substitue E for O; A for U
SELECT ENAME JOB, TRANSLATE(JOB, 'EA', 'OU') AS NEW_JOB FROM tutorial.emp ORDER BY NEW_JOB ASC;

-- 6. sort with a column in subquery.
SELECT ENAME, SAL, COMM FROM
    (SELECT ENAME, SAL, COMM, 
        CASE 
            WHEN COMM IS NULL THEN 0
            ELSE 1 
        END AS IS_NULL
    FROM tutorial.emp) AS X                 -- subquery needs to have an alias
ORDER BY IS_NULL DESC, COMM; 