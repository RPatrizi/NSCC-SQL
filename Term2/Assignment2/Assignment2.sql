IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'PatientVitalsDB')
BEGIN
CREATE DATABASE PatientVitalsDB;
END;
Go


USE PatientVitalsDB;
Go


IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Patient')
BEGIN
CREATE TABLE Patient(
	PatientID INT IDENTITY (1,1),
	FirstName varchar(255),
	LastName varchar(255),
	HCN varchar(255),
	CONSTRAINT PK_Patient PRIMARY KEY (PatientID)
);
END;

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Vitals')
BEGIN
CREATE TABLE Vitals(
	VitalsID INT IDENTITY (1,1),
	PatientID INT,
	VitalsTypeID INT,
	VitalsDT DATETIME,
	VitalsValue FLOAT,
	CONSTRAINT PK_Vitals PRIMARY KEY (VitalsID)
);
END;

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='VitalsType')
BEGIN
CREATE TABLE VitalsType(
	VitalsTypeID INT,
	VitalsTypeName varchar(255),
	CONSTRAINT PK_VitalsType PRIMARY KEY (VitalsTypeID)
);
END;
Go


ALTER TABLE Vitals
ADD CONSTRAINT FK_Patient_Vitals FOREIGN KEY (PatientID) REFERENCES Patient(PatientID) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Vitals
ADD CONSTRAINT FK_VitalsType_Vitals FOREIGN KEY (VitalsTypeID) REFERENCES VitalsType(VitalsTypeID) ON UPDATE CASCADE ON DELETE CASCADE;
Go


INSERT INTO Patient (FirstName, LastName, HCN) VALUES ('James', 'Brown', '757234587');
INSERT INTO Patient (FirstName, LastName, HCN) VALUES ('Bob', 'Marley', '75777761');
Go

INSERT INTO VitalsType (VitalsTypeID, VitalsTypeName) VALUES (1, 'HR');
INSERT INTO VitalsType (VitalsTypeID, VitalsTypeName) VALUES (2, 'Temp');
INSERT INTO VitalsType (VitalsTypeID, VitalsTypeName) VALUES (3, 'MAP');
INSERT INTO VitalsType (VitalsTypeID, VitalsTypeName) VALUES (4, 'SBP');
INSERT INTO VitalsType (VitalsTypeID, VitalsTypeName) VALUES (5, 'DBP');
Go

CREATE PROCEDURE spAssignment2
AS

BEGIN TRY  
	BEGIN TRAN  
		INSERT INTO Vitals (PatientID, VitalsTypeID, VitalsDT, VitalsValue) VALUES (1, 1, '20220101 00:00:00', 85);
		INSERT INTO Vitals (PatientID, VitalsTypeID, VitalsDT, VitalsValue) VALUES (1, 2, '20220101 00:00:00', 36.1);
		INSERT INTO Vitals (PatientID, VitalsTypeID, VitalsDT, VitalsValue) VALUES (1, 4, '20220101 00:00:00', 134);
		INSERT INTO Vitals (PatientID, VitalsTypeID, VitalsDT, VitalsValue) VALUES (1, 5, '20220101 00:00:00', 91);
		INSERT INTO Vitals (PatientID, VitalsTypeID, VitalsDT, VitalsValue) VALUES (2, 1, '20220102 00:00:00', 67);
		INSERT INTO Vitals (PatientID, VitalsTypeID, VitalsDT, VitalsValue) VALUES (2, 2, '20220102 00:00:00', 37.5);
		INSERT INTO Vitals (PatientID, VitalsTypeID, VitalsDT, VitalsValue) VALUES (2, 4, '20220102 00:00:00', 145);
		INSERT INTO Vitals (PatientID, VitalsTypeID, VitalsDT, VitalsValue) VALUES (2, 5, '20220102 00:00:00', 87);
		INSERT INTO Vitals (PatientID, VitalsTypeID, VitalsDT, VitalsValue) VALUES (1, 1, '20220103 00:00:00', 81);
		INSERT INTO Vitals (PatientID, VitalsTypeID, VitalsDT, VitalsValue) VALUES (1, 2, '20220103 00:00:00', 38.1);
		INSERT INTO Vitals (PatientID, VitalsTypeID, VitalsDT, VitalsValue) VALUES (1, 4, '20220103 00:00:00', 154);
		INSERT INTO Vitals (PatientID, VitalsTypeID, VitalsDT, VitalsValue) VALUES (1, 5, '20220103 00:00:00', 97);
		INSERT INTO Vitals (PatientID, VitalsTypeID, VitalsDT, VitalsValue) VALUES (2, 1, '20220104 00:00:00', 72);
		INSERT INTO Vitals (PatientID, VitalsTypeID, VitalsDT, VitalsValue) VALUES (2, 2, '20220104 00:00:00', 37.5);
		INSERT INTO Vitals (PatientID, VitalsTypeID, VitalsDT, VitalsValue) VALUES (2, 4, '20220104 00:00:00', 157);
		INSERT INTO Vitals (PatientID, VitalsTypeID, VitalsDT, VitalsValue) VALUES (2, 5, '20220104 00:00:00', 88);

		INSERT INTO Vitals (PatientID, VitalsTypeID, VitalsDT, VitalsValue)
		SELECT s.PatientID, 3, s.VitalsDT, ((SBP + (2 * DBP)) / 3) AS MAP
		FROM (SELECT PatientID, VitalsTypeID, VitalsDT, VitalsValue AS SBP FROM Vitals WHERE VitalsTypeID = 4) AS s
		INNER JOIN (SELECT PatientID, VitalsTypeID, VitalsDT, VitalsValue AS DBP FROM Vitals WHERE VitalsTypeID = 5) AS d
		ON s.PatientID = d.PatientID AND s.VitalsDT = d.VitalsDT;

		DECLARE @date varchar(255)
		DECLARE @fname varchar(255)
		DECLARE @lname varchar(255)
		DECLARE @map varchar(255)
		DECLARE @text varchar(255)

		DECLARE NameMap CURSOR FOR
		SELECT v.VitalsDT, p.FirstName, p.LastName, v.VitalsValue
		FROM Patient p
		INNER JOIN Vitals v
		ON p.PatientID = v.PatientID
		ORDER BY p.FirstName, p.LastName, v.VitalsDT;

		OPEN NameMap;
		FETCH NEXT FROM NameMap INTO @date, @fname, @lname, @map;
		WHILE @@FETCH_STATUS = 0
			BEGIN
				Set @text = @fname + ' ' + @lname + ' - Map: ' + @map + ' - ' + @date
				print @text;
				FETCH NEXT FROM NameMap INTO @date, @fname, @lname, @map;
			END
		CLOSE NameMAp
		DEALLOCATE NameMap;
	COMMIT TRAN  
END TRY

BEGIN CATCH  
	ROLLBACK TRAN  
END CATCH
Go

EXECUTE spAssignment2;
Go

/*
TRUNCATE TABLE Vitals;
Go
*/

/*
DROP DATABASE PatientVitalsDB;
Go
*/