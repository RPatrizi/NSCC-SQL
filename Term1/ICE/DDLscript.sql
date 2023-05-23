CREATE DATABASE testDb;

USE testDb
go

DROP DATABASE testDb;

USE Master
go

DROP DATABASE testDb;

CREATE DATABASE testDb;

--CREATE TABLE
CREATE TABLE TestDb.dbo.Persons (
PersonID int,    
FirstName nvarchar(50),
LastName nvarchar(100),
[Address] varchar(255),
City varchar(255) 
);

USE testDb
go
ALTER TABLE Persons
ADD Email varchar(255);

USE testDb
go
ALTER TABLE Persons
ALTER COLUMN Email nvarchar(50);

ALTER TABLE Persons
ALTER COLUMN PersonID int NOT NULL;

ALTER TABLE Persons
ADD CONSTRAINT UC_FNameLName UNIQUE (Firstname,LastName);




INSERT INTO Persons(
PersonID,FirstName,LastName,Email,Address,City
)VALUES
(
2, 'Bob', 'Marley', 'b@r.com', '123 My Street','Trench Town'
)


DELETE from Persons Where PersonID=2;

ALTER TABLE PERSONS
DROP CONSTRAINT UC_FNameLName;

ALTER TABLE Persons
ADD CONSTRAINT UC_FNameLName UNIQUE (Firstname,LastName);

ALTER TABLE Persons
ADD CONSTRAINT PK_PersonID PRIMARY KEY (PersonID);



CREATE TABLE Orders (    
OrderID int PRIMARY KEY IDENTITY (1,1),    
OrderNumber int NOT NULL,    
PersonID_FK int
)

ALTER TABLE Orders
ADD CONSTRAINT fk_PersonId FOREIGN KEY (PersonID_FK)
REFERENCES Persons(PersonId);

INSERT INTO orders (OrderNumber,PersonID_FK)
VALUES (1,0);
