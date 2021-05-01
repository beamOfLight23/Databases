-- modify a column type 

CREATE PROCEDURE modifyColumn 
AS 
ALTER TABLE Book_Order 
AlTER COLUMN ct_id SMALLINT ;
GO 

-- drop a column 

CREATE PROCEDURE dropColumn 
AS 
ALTER TABLE Book_Order 
DROP COLUMN Email; 
GO

-- remove default constraint 

CREATE PROCEDURE removeDefault 
AS 
ALTER TABLE Genre 
ALTER COLUMN name DROP DEFAULT; 
GO

-- drop a primary key 

CREATE PROCEDURE dropPK
AS 
ALTER TABLE Genre 
DROP CONSTRAINT type; 
GO

-- drop a candidate key 

CREATE PROCEDURE dropUK 
AS 
ALTER TABLE Customer 
DROP CONSTRAINT email;
GO 


-- drop a table 
CREATE PROCEDURE dropTable 
AS 
DROP TABLE Store_Employee; 
GO 

