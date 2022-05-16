--TOTALNO IGNORISANE TABLE
INSERT INTO SalesLT.Alias (TableName,TableIgnore) VALUES ('ProductModelProductDescription',1);
INSERT INTO SalesLT.Alias (TableName,TableIgnore) VALUES ('CustomerAddress',1);
INSERT INTO SalesLT.Alias (TableName,TableIgnore) VALUES ('Alias',1);

INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Address','Address','AD',0,'AddressID','id',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Address','Address','AD',0,'AddressLine1','Address Line 1',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Address','Address','AD',0,'AddressLine2','Address Line 2',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Address','Address','AD',0,'City','City',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Address','Address','AD',0,'StateProvince','State',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Address','Address','AD',0,'CountryRegion','Region',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Address','Address','AD',0,'PostalCode','Postal Code',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Address','Address','AD',0,'rowguid','guid',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Address','Address','AD',0,'ModifiedDate','date',1);

INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Customer','Customer','CU',0,'CustomerID','ID',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Customer','Customer','CU',0,'NameStyle','namestyle',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Customer','Customer','CU',0,'Title','Title',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Customer','Customer','CU',0,'FirstName','First Name',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Customer','Customer','CU',0,'MiddleName','Middle Name',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Customer','Customer','CU',0,'LastName','Last Name',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Customer','Customer','CU',0,'Suffix','Suffix',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Customer','Customer','CU',0,'CompanyName','Company',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Customer','Customer','CU',0,'SalesPerson','Sales Person',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Customer','Customer','CU',0,'EmailAddress','Email',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Customer','Customer','CU',0,'Phone','Phone',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Customer','Customer','CU',0,'PasswordHash','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Customer','Customer','CU',0,'PasswordSalt','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Customer','Customer','CU',0,'rowguid','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Customer','Customer','CU',0,'ModifiedDate','',1);
	

INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Product','Product','PR',0,'ProductID','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Product','Product','PR',0,'Name','Product Name',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Product','Product','PR',0,'ProductNumber','Product Number',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Product','Product','PR',0,'Color','Color',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Product','Product','PR',0,'StandardCost','Cost',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Product','Product','PR',0,'ListPrice','List Price',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Product','Product','PR',0,'Size','Size',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Product','Product','PR',0,'Weight','Weight',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Product','Product','PR',0,'ProductCategoryID','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Product','Product','PR',0,'ProductModelID','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Product','Product','PR',0,'SellStartDate','Sale Beginning',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Product','Product','PR',0,'SellEndDate','Sale End',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Product','Product','PR',0,'DiscontinuedDate','Discontinued From',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Product','Product','PR',0,'ThumbNailPhoto','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Product','Product','PR',0,'ThumbnailPhotoFileName','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Product','Product','PR',0,'rowguid','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('Product','Product','PR',0,'ModifiedDate','',1);

	---
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('ProductCategory','Product Category','PC',0,'ProductCategoryID','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('ProductCategory','Product Category','PC',0,'ParentProductCategoryID','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('ProductCategory','Product Category','PC',0,'Name','Category',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('ProductCategory','Product Category','PC',0,'rowguid','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('ProductCategory','Product Category','PC',0,'ModifiedDate','',1);

INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('ProductDescription','Product Description','PD',0,'ProductDescriptionID','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('ProductDescription','Product Description','PD',0,'Description','Description',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('ProductDescription','Product Description','PD',0,'rowguid','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('ProductDescription','Product Description','PD',0,'ModifiedDate','',1);

INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('ProductModel','Product Model','PM',0,'ProductModelID','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('ProductModel','Product Model','PM',0,'Name','Model Name',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('ProductModel','Product Model','PM',0,'CatalogDescription','Model Description',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('ProductModel','Product Model','PM',0,'rowguid','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('ProductModel','Product Model','PM',0,'ModifiedDate','',1);
	
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderDetail','Order Details','SD',0,'SalesOrderID','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderDetail','Order Details','SD',0,'SalesOrderDetailID','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderDetail','Order Details','SD',0,'OrderQty','Quantity Ordered',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderDetail','Order Details','SD',0,'ProductID','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderDetail','Order Details','SD',0,'UnitPrice','Price',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderDetail','Order Details','SD',0,'UnitPriceDiscount','Discount',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderDetail','Order Details','SD',0,'LineTotal','Total Price',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderDetail','Order Details','SD',0,'rowguid','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderDetail','Order Details','SD',0,'ModifiedDate','',1);

INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'SalesOrderID','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'RevisionNumber','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'OrderDate','Order Date',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'DueDate','Due Date',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'ShipDate','Shipping Date',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'Status','Status',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'OnlineOrderFlag','Order Flag',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'SalesOrderNumber','Order Number',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'PurchaseOrderNumber','Purchase Number',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'AccountNumber','Account',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'CustomerID','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'ShipToAddressID','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'BillToAddressID','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'ShipMethod','Shipping Method',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'CreditCardApprovalCode','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'SubTotal','Sub Total',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'TaxAmt','Tax Amount',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'Freight','Freight',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'TotalDue','Total Due',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'Comment','Comment',0);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'rowguid','',1);
INSERT INTO SalesLT.Alias (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES ('SalesOrderHeader','Order Header','SH',0,'ModifiedDate','',1);
