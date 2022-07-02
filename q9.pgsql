-- Chapter 9: date manipulation 

-- 1. determine number of days in a year 
-- DATE_TRUNC(): return beginning of the year 
SELECT 
    CAST( (CURR_YEAR + INTERVAL '1 YEAR') AS DATE) - CURR_YEAR
    FROM ( SELECT CAST(DATE_TRUNC('YEAR', HIREDATE) AS DATE) AS CURR_YEAR FROM tutorial.emp ) AS X;
-- if value is 366 then it is a leap year.

-- 2. TO_NUMBER() return unit of time from a date. this is similar to EXTRACT() when it comes to day of month, month and year 
SELECT 
    TO_NUMBER(TO_CHAR(HIREDATE, 'hh24'), '99') AS hr,
    TO_NUMBER(TO_CHAR(HIREDATE, 'mi'), '99') AS min,
    TO_NUMBER(TO_CHAR(HIREDATE, 'ss'), '99') AS sec,
    TO_NUMBER(TO_CHAR(HIREDATE, 'dd'), '99') AS dy,
    TO_NUMBER(TO_CHAR(HIREDATE, 'mm'), '99') AS mth,
    TO_NUMBER(TO_CHAR(HIREDATE, 'yyyy'), '99') AS yr
FROM tutorial.emp;

-- Use Python or another language for more sophisticated date manipulation