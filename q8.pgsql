-- Chapter 8: date arithmetic

-- 1. INTERVAL() to specify unit of time 
SELECT HIREDATE, 
    HIREDATE - INTERVAL '5 day' AS HD_MINUS_5D,
    HIREDATE + INTERVAL '5 day' AS HD_PLUS_5D,
    HIREDATE - INTERVAL '5 month' AS HD_MINUS_5M,
    HIREDATE + INTERVAL '5 month' AS HD_PLUS_5M,
    HIREDATE - INTERVAL '5 year' AS HD_MINUS_5Y,
    HIREDATE + INTERVAL '5 year' AS HD_PLUS_5Y
FROM tutorial.emp WHERE DEPTNO = 10;

-- 2. determine number of days between 2 dates
SELECT WARD_HD - ALLEN_HD AS HD_DIFF FROM 
    (SELECT HIREDATE AS WARD_HD FROM tutorial.emp WHERE ENAME = 'WARD') AS X,
    (SELECT HIREDATE AS ALLEN_HD FROM tutorial.emp WHERE ENAME = 'ALLEN') AS Y;

-- 3. TO_CHAR(): return day of week (string) or month (string)
SELECT 
    TO_CHAR(HIREDATE, 'DAY') AS HIRE_DAY ,
    TO_CHAR(HIREDATE, 'MONTH') AS HIRE_MONTH 
FROM tutorial.emp;

-- 4. EXTRACT(): return day of month, 4 digit year, 2 digit month 
SELECT 
    EXTRACT(DOW FROM HIREDATE) AS DAY_OF_WEEK,
    EXTRACT(DAY FROM HIREDATE) AS HIRE_DATE, 
    EXTRACT(MONTH FROM HIREDATE) AS HIRE_MONTH, 
    EXTRACT(YEAR FROM HIREDATE) AS HIRE_YEAR 
FROM tutorial.emp;