-- creating the table

CREATE OR ALTER PROCEDURE addTable 
AS 
	
	CREATE TABLE Employee ( 
	id INT not null, 
	CONSTRAINT PK_Employee PRIMARY KEY(id), 
	version INT, 
	name VARCHAR(50), 
	phoneNr INT
	) 

	INSERT INTO Employee VALUES (12345, 1, 'Maria Smith', 888777); 
	INSERT INTO Employee VALUES (54321, 1, 'John Smith', 242726); 
	INSERT INTO Employee VALUES (99999, 1, 'Andrew John', 999333);

	CREATE TABLE versioning_table ( 
	version_nr INT, 
	procedureName VARCHAR(100), 
	inverse_procedure VARCHAR(100),
	id_inverse_procedure INT);
 GO 
EXEC addTable;

-- drop table

CREATE OR ALTER PROCEDURE dropTable 
AS 
	DROP TABLE Employee; 
	DROP TABLE versioning_table; 	
GO
EXEC dropTable; 


-- add column 

CREATE OR ALTER PROCEDURE addColumn_operation
AS
	ALTER TABLE Employee
	ADD wage INT
	DECLARE @version INT 
	SELECT @version = version_nr FROM versioning_table;
	DECLARE @inverse_procedure VARCHAR(100) 
	SET @inverse_procedure = 'RemoveColumn' 
	
	DECLARE @procedureName VARCHAR(100) 
	SET @procedureName = 'AddColumn' 
	INSERT INTO versioning_table VALUES (@version + 1, @procedureName,@inverse_procedure,1) 
	UPDATE Employee SET version = version + 1 
GO 
EXEC addColumn_VersionTables



-- drop column 

CREATE OR ALTER PROCEDURE dropColumn_operation
AS 
	ALTER TABLE Employee
	DROP COLUMN wage 
	DECLARE @version INT 
	SELECT @version = version_nr FROM versioning_table;
	DECLARE @inverse_procedure VARCHAR(100) 
	SET @inverse_procedure = 'AddColumn' 
	
	DECLARE @procedureName VARCHAR(100) 
	SET @procedureName = 'RemoveColumn' 
	INSERT INTO versioning_table VALUES (@version + 1, @procedureName,@inverse_procedure,2) 
	UPDATE Employee SET version = version + 1 
GO 



CREATE OR ALTER PROCEDURE dropColumn
AS
	ALTER TABLE Employee
	DROP COLUMN wage
GO
EXEC dropColumn



CREATE OR ALTER PROCEDURE Version_required @version INT 
AS 
	BEGIN 
		DECLARE @current_table_version INT 
		SELECT @current_table_version = version FROM Employee; -- current version, max value 
		DECLARE @id_operation INT 
		SELECT @id_operation = id_inverse_procedure FROM versioning_table; 
		IF @current_table_version > @version 
			BEGIN 
			WHILE (@current_table_version <> @version) 
				BEGIN
					SET @current_table_version = @current_table_version - 1;
					IF @id_operation = 1 
						begin 
							
		
	END
GO
EXEC Versioning @version = 2;
		



	



	
