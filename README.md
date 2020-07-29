# SQL-Commands
Basic SQL Commands for MSSQLSERVER

## SQL Applications:
-DDL (create database)-DML: maintaining an already existing database-DCL: protects your database

## Basic Concepts
* A table is a database object which is comprised of rows and columns in SQL

* fields are basically columns

* Records-individual entry

* CRUD= create,read,update,delete operations

* where clause:  satisfies the condition

-Like operator is used to extract records where a particular pattern is present

-Like operator: two wildcards: %(one or more characters) and _ (one character)

-LTRIM()= removes blanks on the left side of the character

-Lower(),upper(),reverse(),substring(original string,starting index, length)

-Order by sorts in ascending order by default

-having clause is used in combo with group by to impose conditions on groups

-update statement modifies the existing records in a table

-Truncate statement deletes all the data inside the table. table is still there

-Inner join: return records that have matching value in both the tables.

-union operator is used to combine the results set of two or more select statements,no duplicates in final table, order should be same

-union all operator gives alll the rows from both the table including duplicates

-except operator combines two select statements and returns unique records from the left opeartor which are not part of right query

-Intersect operator helps to combine two select statements and returns the record which are common to both the select statements

-views is a virtual table based on the results of an sql statement

-alter table statement is used to add,delete or modify columns in a table

-Merge is the combination of insert,delete,update statements. here source table joins the target table

-scalar value function always returns a scalar value

-temp tables are created in tempDB and deleted as soon as the session is terminated.before entering the name add #

-case statement helps in multi way decision making

-IFF() function is an alternative for case statement

-stored procedure is a prepared sql code which can be saved and reused.

-exception handling through try catch

-Transaction is a group of commands that change data change data stored in a database/ if one of the command fails all the chunk fails

-Master database records all the system level info for SQL server system. This includes instance-wide metadata such as logon,endpoints,linked servers, and system config settings

-Model database-used as template whenevr a new user database is created. 

-msdb-created by MSSQLSERVER for scheduling alerts abd jobs..

-tempDB-temperory objects

-recovery model is a database property that controls how transactions are logged, whether the transactions log requires backing up and what kinds of restore operatons are available: simple,full,bulked logged

-point in time recovery: allows to restore a database into a state it was in any point of time. 

-activity monitor displays info about sql server processes 

-data integrity is used to maintain accuracy and consistency of data in a table 

-indexing: An index is an on-disk structure associated with a table or view that speeds retrieval of rows from the table or view. An index contains keys built from one or more columns in the table or view. reduces i/o operations on the disks, consume fewer resources through improved query performance, helpful in select/update/delete statements

-clustered index: sorts and store data rows in the table or view based on their key values

-non-clustered: seperate structure from the data rows. contains the non-clusteres index key values and each key value entry has a pointer to the data row that contains the key value

-normalisation is to avoid redundancy and dependency
