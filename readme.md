1. What is postgreSQL?

Ans: PostgreSQL is an advanced and open source relational database management system. It supports both relational and non relational queries. Using PostgreSQL, anyone can store, search , short, and change data easily.

2. What is the purpose of a database management schema in PostgreSQl?

Ans: A schema is like a folder inside the database. It helps anyone organize tables. If database is a big cabinet, then a schema is one drawer, and the tables are files inside it. Schemas help keep things neat and separate.

3. Explain the primary key and foreign key concepts in PostgreSQL

Ans:
Primary Key: A Primary key is a special column in a table. It makes sure that each row is different. For example, every student has a unique ID - that ID can be a primary key.

    Foreign Key:  A Foreign Key connects two tables. It is a column that points to the primary key of another table. It shows how the tables are related. For example, a "sighitngs" table might use a ranger's id from the "rangers" table - that's is a foreign key.

4. What is the difference between the VARCHAR and CHAR data types?

Ans: Varchar is used to store text, and it can be any lenght up to the limit. For example VARCHAR(50) indicates the text lenght can be 1 to 50 characters long.

CHAR aslo store text, but it always takes the full space. For example, CHAR(50) indicates thatthe text length can be 1 to 50 characters long but if the lenght is less than 50, it will always use the space for 50 characters.

So, it is preferred to use VARCHAR, when text length can change.

5. Explain the purpose of the WHERE clause in a SELECT statement.

Ans: The WHERE is used to filter the data. It helps choose only the row based on the condition.

SELECT \* FROM studentS WHERE age > 20;

This means: show me only the students who are older than 20.
