SELECT 
	TABLE_NAME as TableName,
	TABLE_NAME as TableAlias,
	LEFT(TABLE_NAME,2) as TableAbbr,
	CASE WHEN TABLE_NAME IN ('Address') THEN 0 ELSE 1 END TableIgnore,
    COLUMN_NAME AS ColumnName,
    COLUMN_NAME AS ColumnAlias,
	CASE WHEN COLUMN_NAME LIKE '%ID' THEN 1 ELSE 0 END ColumnIgnore--,
	--*
FROM INFORMATION_SCHEMA.COLUMNS
--WHERE TABLE_NAME = @Table
ORDER BY
    ColumnName;

SELECT
    TABLE_NAME AS TableName,*
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='SalesLT'
ORDER BY
    TableName;

 SELECT *
   FROM (VALUES --This represents the values in a table
         (1,'02830916-85AB-47FF-A2CA-2228441840EE','All UPPER CASE')
        ,(2,'02830916-85ab-47ff-a2ca-2228441840ee','All LOWER CASE')
        ,(3,'02830916-85aB-47ff-a2ca-2228441840ee','One UPPER CASE')
        )v(RowNum, GUIDString, Explanation)
  WHERE GUIDString LIKE '%[A-F]%' COLLATE Latin1_General_BIN
;