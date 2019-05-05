USE AdventureWorks2008
-- cau Ex 2.1
CREATE FUNCTION Filter_CA_balck()
RETURNS TABLE AS RETURN (
	SELECT p.ProductID, p.Name, p.ProductNumber, p.Color, p.ListPrice
	FROM Production.Product p
	WHERE p.Color= 'black'  AND p.ProductNumber LIKE '%CA%'
);
SELECT * FROM	Filter_CA_balck();

-- Ex 2.2

CREATE FUNCTION find_addressBusinessByBusinessEntityID(@BusinessEntityID INT)
RETURNS TABLE AS RETURN (
	SELECT x.AddressLine1, x.AddressLine2, x.City, x.PostalCode, at.Name AS AddresType
	FROM Person.BusinessEntityAddress y
	LEFT JOIN Person.Address x
	ON y.AddressID = x.AddressID
	LEFT JOIN Person.AddressType at
	ON y.AddressTypeID = at.AddressTypeID
	WHERE y.BusinessEntityID = 1
);

SELECT * FROM find_addressBusinessByBusinessEntityID(2);

-- ex 3
USE AdventureWorks2008;
go 
if OBJECT_ID('findFisNameByModifiedDateAndUpperFlag','p') is not null
	drop procedure findFisNameByModifiedDateAndUpperFlag;
go 
create procedure findFisNameByModifiedDateAndUpperFlag
	@ModifiedDate DATETIME, 
	@UpperFlag BIT
as
	SET NOCOUNT ON;
	SELECT CASE @UpperFlag
         WHEN 'True' THEN UPPER(FirstName)
         WHEN 'False' THEN FirstName
       END AS FirstName
	FROM Person.Person
	WHERE ModifiedDate > @ModifiedDate
	return
GO
EXECute findFisNameByModifiedDateAndUpperFlag '10/10/2000',1;

-- ex4

CREATE TABLE Production.ProductInventoryAudit
(
ProductID INT NOT NULL
, LocationID SMALLINT NOT NULL
, Shelf NVARCHAR(10) NOT NULL
, Bin TINYINT NOT NULL
, Quantity SMALLINT NOT NULL
, rowguid UNIQUEIDENTIFIER NOT NULL
, ModifiedDate DATETIME NOT NULL
, InsertOrDelete CHAR(1) NOT NULL
)

CREATE TRIGGER trg_save_event_insetDelete on [Production].[ProductInventory]
AFTER INSERT,DELETE
AS
	SET NOCOUNT ON;
	--save information to table audit
	INSERT Production.ProductInventoryAudit
	(ProductID, LocationID, Shelf, Bin, Quantity,rowguid, ModifiedDate, InsertOrDelete) 
	SELECT DISTINCT i.ProductID, i.LocationID, i.Shelf, i.Bin, i.Quantity,i.rowguid, GETDATE(), 'I'
	FROM inserted i;

	--delete
		INSERT Production.ProductInventoryAudit
	(ProductID, LocationID, Shelf, Bin, Quantity,rowguid, ModifiedDate, InsertOrDelete)
	SELECT d.ProductID, d.LocationID, d.Shelf, d.Bin, d.Quantity,d.rowguid, GETDATE(), 'D'
	FROM deleted d;
GO

INSERT Production.ProductInventory(ProductID, LocationID, Shelf, Bin, Quantity)
VALUES (110, 6, 'abc',5,22);

DELETE FROM Production.ProductInventory WHERE ProductID = 110;


SELECT * FROM Production.ProductInventoryAudit
