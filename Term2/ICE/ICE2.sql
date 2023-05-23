ALTER PROCEDURE spSalesPersonSalesYTD
@Firstname nvarchar (50) = NULL,
@Lastname nvarchar (50) = NULL

AS

IF (@Firstname IS NULL AND @Lastname is NULL)  
BEGIN  
   PRINT 'ERROR: You must inform the first and last name of the sales person'  
   RETURN  
END

ELSE IF @Firstname IS NULL
BEGIN
	PRINT 'ERROR: You must inform the first name of the sales person'  
   RETURN  
END

ELSE IF @Lastname IS NULL
BEGIN
	PRINT 'ERROR: You must inform the last name of the sales person'  
   RETURN  
END

ELSE
BEGIN
	SELECT [SalesYTD]
	FROM AdventureWorks2019.Sales.SalesPerson AS sp
	JOIN AdventureWorks2019.Person.Person AS pp
	ON sp.BusinessEntityID = pp.BusinessEntityID
	WHERE (pp.FirstName = @Firstname AND pp.LastName = @Lastname);
END;
go


EXECUTE spSalesPersonSalesYTD;
go


BEGIN TRY
	DECLARE @Age int
	SET @Age = 'Rodrigo'
END TRY

BEGIN CATCH  
	PRINT 'Invalid parameters.';  
	THROW;  
END CATCH;  