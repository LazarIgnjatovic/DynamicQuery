MERGE SalesLT.Alias as tgt
USING (SELECT 
	TABLE_NAME as TableName,
	TABLE_NAME as TableAlias,
	LEFT(TABLE_NAME,2) as TableAbbr,
	CASE WHEN TABLE_NAME IN ('BuildVersion','ErrorLog','CustomerAddress','sysdiagrams','ProductModelProductDescription','Alias','vProductAndDescription','vProductModelCatalogDescription','vGetAllCategories') 
		THEN 1 ELSE 0 END TableIgnore,
    COLUMN_NAME AS ColumnName,
    COLUMN_NAME AS ColumnAlias,
	CASE WHEN COLUMN_NAME LIKE '%ID' THEN 1 ELSE 0 END ColumnIgnore
	FROM INFORMATION_SCHEMA.COLUMNS) AS src

ON (tgt.TableName=src.TableName AND tgt.ColumnName=src.ColumnName)
WHEN NOT MATCHED THEN
	INSERT (TableName,TableAlias,TableAbbr,TableIgnore,ColumnName,ColumnAlias,ColumnIgnore)
	VALUES (src.TableName,src.TableAlias,src.TableAbbr,src.TableIgnore,src.ColumnName,src.ColumnAlias,src.ColumnIgnore)
;