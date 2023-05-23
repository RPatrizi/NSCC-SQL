-- CREATE DATABASE --
CREATE DATABASE ExchangeRate;
Go

USE ExchangeRate;
Go

-- CREATE TABLES --
CREATE TABLE CAD_Inflation (
    CAD_Inf_Date date,
	CAD_Inf_Month int,
    CAD_Inf_Year int,
    CAD_Inf_Value decimal (5, 2),
	CONSTRAINT [PK_CAD_Inf] PRIMARY KEY (CAD_Inf_Month, CAD_Inf_Year) 
);
Go

CREATE TABLE BRL_Inflation (
	BRL_Inf_Date varchar(6),
	BRL_Inf_Month int,
    BRL_Inf_Year int,
    BRL_Inf_Value decimal (5, 2),
	CONSTRAINT [PK_BRL_Inf] PRIMARY KEY (BRL_Inf_Month, BRL_Inf_Year) 
);
Go

CREATE TABLE FX_CAD_BRL (
    FX_CAD_BRL_Date date,
	FX_CAD_BRL_Month int,
    FX_CAD_BRL_Year int,
    FX_CAD_BRL_Value decimal (7, 4),
	CONSTRAINT [PK_FX_CAD_BRL] PRIMARY KEY (FX_CAD_BRL_Date) 
);
Go

-- CREATE CONSTRAINTS --
ALTER TABLE FX_CAD_BRL
ADD CONSTRAINT FK_CAD_Inflation_FX_CAD_BRL FOREIGN KEY (FX_CAD_BRL_Month, FX_CAD_BRL_Year) REFERENCES CAD_Inflation(CAD_Inf_Month, CAD_Inf_Year) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE FX_CAD_BRL
ADD CONSTRAINT FK_BRL_Inflation_FX_CAD_BRL FOREIGN KEY (FX_CAD_BRL_Month, FX_CAD_BRL_Year) REFERENCES BRL_Inflation(BRL_Inf_Month, BRL_Inf_Year) ON UPDATE CASCADE ON DELETE CASCADE;
Go


-- CREATE VIEWS --
CREATE VIEW RawData
as
SELECT fx.FX_CAD_BRL_Date, fx.FX_CAD_BRL_Month, FX_CAD_BRL_Year, brl.BRL_Inf_Value, cad.CAD_Inf_Value, fx.FX_CAD_BRL_Value
FROM FX_CAD_BRL fx
INNER JOIN CAD_Inflation cad
ON fx.FX_CAD_BRL_Month = cad.CAD_Inf_Month AND fx.FX_CAD_BRL_Year = cad.CAD_Inf_Year
INNER JOIN BRL_Inflation brl
ON fx.FX_CAD_BRL_Month = brl.BRL_Inf_Month AND fx.FX_CAD_BRL_Year = brl.BRL_Inf_Year;
Go


CREATE VIEW Data
as
SELECT * 
FROM
(SELECT *, Lead (FX_CAD_BRL_Value,1) OVER (order by FX_CAD_BRL_Date asc ) [label]
from RawData) x
Where [label] is not null
Go


CREATE VIEW PredictionData
as
SELECT TOP (10) FX_CAD_BRL_Date, FX_CAD_BRL_Month, FX_CAD_BRL_Year, BRL_Inf_Value, CAD_Inf_Value, FX_CAD_BRL_Value, [label]
FROM Data
ORDER BY FX_CAD_BRL_Date DESC
Go


CREATE VIEW ModelData
as
SELECT FX_CAD_BRL_Date, FX_CAD_BRL_Month, FX_CAD_BRL_Year, BRL_Inf_Value, CAD_Inf_Value, FX_CAD_BRL_Value, [label]
FROM Data
WHERE (FX_CAD_BRL_Date NOT IN (SELECT FX_CAD_BRL_Date FROM PredictionData))
Go

CREATE VIEW CAD_View
as
SELECT * 
FROM
(SELECT *, Lead (CAD_Inf_Value,1) OVER (order by CAD_Inf_Date asc ) [label]
from CAD_Inflation) x
Where [label] is not null
Go