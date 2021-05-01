-- modify the type of a column 
CREATE PROCEDURE modifyC
AS
ALTER TABLE Book_Order 
AlTER COLUMN ct_id VARCHAR(10);   
GO 

-- add a column 

CREATE PROCEDURE addColumn
AS
ALTER TABLE Book_Order 
ADD Email varchar(100); 
GO

-- default constraint 

CREATE PROCEDURE addDefault 
AS
ALTER TABLE Genre 
ADD CONSTRAINT name 
DEFAULT 'Fiction' FOR name; 
GO

-- add a primary key 

CREATE PROCEDURE addPK 
AS
ALTER TABLE Genre 
ADD PRIMARY KEY (type); 
GO

-- add a candidate key 

CREATE PROCEDURE addUK
AS
ALTER TABLE Customer 
ADD UNIQUE(EMAIL); 
GO

-- foreign key 

CREATE PROCEDURE addFK
AS
ALTER TABLE Book_Order 
ADD FOREIGN KEY (order_id) REFERENCES Author(author_id); 
GO

-- create a table 

CREATE PROCEDURE createTable
AS
CREATE TABLE Store_Employee ( 
emp_id SMALLINT PRIMARY KEY, 
wage INT
) ;
GO 