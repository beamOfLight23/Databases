USE BookShop

CREATE TABLE VersiuniBD ( 
id INT IDENTITY(1,1) NOT NULL,
versiune INT
 ) 

INSERT INTO VersiuniBD VALUES (0);
INSERT INTO VersiuniBD VALUES (1);
INSERT INTO VersiuniBD VALUES (2);
INSERT INTO VersiuniBD VALUES (3);
INSERT INTO VersiuniBD VALUES (4);


CREATE TABLE Istoric_Versiuni ( 
id_versiune INT 
) 
INSERT INTO Istoric_Versiuni VALUES (1); 

CREATE OR ALTER PROCEDURE uspObtineVersiuneCurenta (@versiune INT OUTPUT)
AS
BEGIN
SET @versiune=(SELECT versiune FROM VersiuniBD WHERE id = (SELECT MAX(id) FROM VersiuniBD)) 
END



CREATE OR ALTER PROCEDURE uspSeteazaVersiuneCurenta(@versiune INT)
AS
BEGIN
DECLARE @id INT;
SET @id = (SELECT id FROM VersiuniBD WHERE versiune=@versiune);
INSERT INTO Istoric_Versiuni VALUES (@id);
END

CREATE OR ALTER PROCEDURE addTable 
AS 
BEGIN 
	execute uspSeteazaVersiuneCurenta @versiune=1;

	CREATE TABLE Employee ( 
	id INT not null, 
	CONSTRAINT PK_Employee PRIMARY KEY(id),  
	name VARCHAR(50), 
	phoneNr INT
	)  

	CREATE TABLE Section ( 
	id_section INT not null,
	CONSTRAINT PK_Section PRIMARY KEY(id_section),
	) 

	INSERT INTO Employee VALUES (12345, 'Maria Smith', 888777); 
	INSERT INTO Employee VALUES (54321, 'John Smith', 242726); 
	INSERT INTO Employee VALUES (99999, 'Andrew John', 999333);

	INSERT INTO Section VALUES (1); 
	INSERT INTO Section VALUES (2); 
	INSERT INTO Section VALUES (3); 
	
END;
EXEC addTable



CREATE OR ALTER PROCEDURE undo_addTable AS 
BEGIN	
	execute uspSeteazaVersiuneCurenta @versiune=0;
	DROP TABLE Employee; 
END; 
EXEC undo_addTable


CREATE OR ALTER PROCEDURE addColumn AS 
BEGIN	
	execute uspSeteazaVersiuneCurenta @versiune=2;
	ALTER TABLE Employee
	ADD wage INT
END; 
EXEC addColumn

CREATE OR ALTER PROCEDURE undo_addColumn AS 
BEGIN 
	execute uspSeteazaVersiuneCurenta @versiune=1;
	ALTER TABLE Employee 
	DROP COLUMN wage;
END; 
EXEC undo_addColumn

CREATE OR ALTER PROCEDURE addPrimaryKey AS 
BEGIN 
	execute uspSeteazaVersiuneCurenta @versiune=3;
	ALTER TABLE Employee 
	ADD CONSTRAINT PK_Employee PRIMARY KEY(id) 
END; 
EXEC addPrimaryKey 

CREATE OR ALTER PROCEDURE undo_addPrimaryKey AS 
BEGIN	
	execute uspSeteazaVersiuneCurenta @versiune=2;
	ALTER TABLE Employee 
	DROP CONSTRAINT PK_Employee 
END; 
EXEC undo_addPrimaryKey 

CREATE OR ALTER PROCEDURE addForeignKey AS 
BEGIN 
	execute uspSeteazaVersiuneCurenta @versiune=4;
	ALTER TABLE Employee WITH NOCHECK 
	ADD CONSTRAINT FKey_Employee FOREIGN KEY (id) REFERENCES Section(id_section);
END; 
EXEC addForeignKey

CREATE OR ALTER PROCEDURE undo_addForeignKey AS 
BEGIN 
	execute uspSeteazaVersiuneCurenta @versiune=3;
	ALTER TABLE Employee 
	DROP CONSTRAINT FKey_Employee 
END; 
EXEC undo_addForeignKey

CREATE PROCEDURE uspAvanseazaVersiune(@ver_curenta INT)
AS
BEGIN
DECLARE @limit INT;
SET @limit = (SELECT MAX(versiune) FROM VersiuniBD);
IF @ver_curenta = @limit
BEGIN
print'Nu se mai poate avansa!';
END
IF @ver_curenta = 0
execute addTable
IF @ver_curenta = 1
execute addColumn;
IF @ver_curenta = 2
execute addPrimaryKey;
IF @ver_curenta = 3
execute addForeignKey;
END;

CREATE OR ALTER PROCEDURE uspDevanseazaVersiune
(@ver_curenta INT)
AS
BEGIN
DECLARE @limit INT;
SET @limit = (SELECT MIN(versiune) FROM VersiuniBD);
IF @ver_curenta = @limit
BEGIN
print'Nu se mai poate devansa!';
END
IF @ver_curenta = 1
execute undo_addTable;
IF @ver_curenta = 2
execute undo_addColumn;
IF @ver_curenta = 3
execute undo_addPrimaryKey;
IF @ver_curenta = 4
execute undo_addForeignKey;
END;

/*Modificare versiune*/
CREATE OR ALTER PROCEDURE ModificaVersiune (@ver_ceruta INT)
AS
BEGIN
DECLARE @ver_curenta INT;
execute uspObtineVersiuneCurenta @versiune=@ver_curenta OUTPUT;
WHILE @ver_curenta < @ver_ceruta
BEGIN
execute uspAvanseazaVersiune
@ver_curenta;
SET @ver_curenta = @ver_curenta+1;
END
WHILE @ver_curenta > @ver_ceruta
BEGIN
execute uspDevanseazaVersiune
@ver_curenta;
SET @ver_curenta = @ver_curenta-1;
END
END;

/*Test*/

execute addTable;
execute addColumn;
execute addPrimaryKey;
execute addForeignKey;
execute undo_addForeignKey;


SELECT versiune FROM Istoric_Versiuni INNER JOIN VersiuniBD ON Istoric_Versiuni.id_versiune=VersiuniBD.id;



DECLARE @test INT;
execute uspObtineVersiuneCurenta @versiune=@test OUTPUT
SELECT @test AS [Versiune curenta]


execute uspAvanseazaVersiune @ver_curenta = @test;
execute uspDevanseazaVersiune @ver_curenta = @test;
execute addTable;
execute undo_addTable;
execute addColumn;
execute undo_addColumn;
execute addPrimaryKey;
execute undo_addPrimaryKey;
execute addForeignKey;
execute undo_addForeignKey;
execute uspSeteazaVersiuneCurenta @versiune=4;

execute ModificaVersiune @ver_ceruta = 3;


SELECT versiune FROM Istoric_Versiuni INNER JOIN VersiuniBD ON Istoric_Versiuni.id_versiune=VersiuniBD.id;
DELETE FROM Istoric_Versiuni;


DROP TABLE VersiuniBD
DROP TABLE Istoric_Versiuni
DROP PROCEDURE addTable
DROP PROCEDURE addColumn
DROP PROCEDURE addPrimaryKey
DROP PROCEDURE addForeignKey
DROP TABLE Employee
DROP TABLE Section 
DROP PROCEDURE uspObtineVersiuneCurenta
DROP PROCEDURE uspAvanseazaVersiune
DROP PROCEDURE uspDevanseazaVersiune
DROP PROCEDURE ModificaVersiune

