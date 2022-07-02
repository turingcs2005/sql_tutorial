-- Chapter 5: Metadata queries

-- 1. List all tables and views in a schema 
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'tutorial';

-- 2. List a table's columns 
SELECT COLUMN_NAME, DATA_TYPE, ORDINAL_POSITION FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'tutorial' AND TABLE_NAME ='emp';

-- 3. List indexed columns for a table 
-- Indexes are used to retrieve data from the database more quickly than otherwise. The users cannot see the indexes. They are used to speed up searches/queries.
SELECT A.TABLENAME, A.INDEXNAME, b.COLUMN_NAME FROM PG_CATALOG.PG_INDEXES AS A, INFORMATION_SCHEMA.COLUMNS AS B WHERE A.SCHEMANAME = 'tutorial' AND A.TABLENAME = B.TABLE_NAME;

-- 4. List constraints on a table 
-- constraints are a critical part of relational database
SELECT A.TABLE_NAME, A.CONSTRAINT_NAME, B.COLUMN_NAME, A.CONSTRAINT_TYPE FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS A, INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS B 
    WHERE A.TABLE_NAME = 'emp'
        AND A.TABLE_SCHEMA = 'tutorial'
        AND A.TABLE_NAME = B.TABLE_NAME
        AND A.TABLE_SCHEMA = B.TABLE_SCHEMA
        AND A.CONSTRAINT_NAME = B.CONSTRAINT_NAME

