
--Question1
CREATE FUNCTION dbo.ufnICE4_Q1(@MyDate datetime)  
RETURNS int
AS    
BEGIN  
    DECLARE @ret int;  
    SET @ret = YEAR(DATEADD(m, 6, @MyDate))
    RETURN @ret;  
END; 
Go

--USAGE
SELECT dbo.ufnICE4_Q1 ('2022-09-03')


--Question2
CREATE FUNCTION Sales.ufnICE4_Q2 (@Territory varchar(50))  
RETURNS TABLE  
AS  
RETURN   
(  
    SELECT FirstName, LastName, TerritoryName, ROUND(SalesYTD,2,1) AS SalesYTD, SalesQuota,
	ROW_NUMBER() OVER(PARTITION BY TerritoryName ORDER BY SalesYTD DESC) 
	AS [Ranking]
	FROM Sales.vSalesPerson  
	WHERE SalesYTD <> 0 and TerritoryName = @Territory
);
Go

--USAGE

SELECT * FROM Sales.ufnICE4_Q2 ('Canada');