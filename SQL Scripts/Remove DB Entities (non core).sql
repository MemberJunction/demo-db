SELECT * FROM __mj.vwEntityFields WHERE Entity='Members' ORDER BY sequence
SELECT * FROM __mj.vwEntityFields WHERE Entity IN(SELECT Name FROM __mj.vwEntities WHERE SchemaName<>'__mj') ORDER BY Entity,sequence
SELECT * FROM __mj.vwEntities WHERE SchemaName <>'__mj' ORDER BY CreatedAt

/*

DELETE FROM __mj.EntityPermission WHERE EntityID IN (
    SELECT ID FROM __mj.vwEntities WHERE SchemaName <>'__mj'
)
DELETE FROM __mj.ApplicationEntity WHERE EntityID IN (
    SELECT ID FROM __mj.vwEntities WHERE SchemaName <>'__mj'
)
DELETE FROM __mj.EntityField WHERE EntityID IN (
    SELECT ID FROM __mj.vwEntities WHERE SchemaName <>'__mj'
)
DELETE FROM __mj.UserView WHERE EntityID IN (
    SELECT ID FROM __mj.vwEntities WHERE SchemaName <>'__mj'
)
DELETE FROM __mj.EntityRelationship WHERE RelatedEntityID IN (
    SELECT ID FROM __mj.vwEntities WHERE SchemaName <>'__mj'
) OR
EntityID IN (
    SELECT ID FROM __mj.vwEntities WHERE SchemaName <>'__mj'
)

DELETE FROM __mj.Entity WHERE SchemaName <>'__mj'
*/
--DELETE FROM __mj.EntityField WHERE EntityID=25125004
/*
WITH NumberedRows AS (
SELECT 
   sf.EntityID,
   sf.Sequence,
   sf.FieldName,
   sf.Description,
   sf.Type,
   sf.Length,
   sf.Precision,
   sf.Scale,
   sf.AllowsNull,
   sf.DefaultValue,
   sf.AutoIncrement,
   IIF(sf.IsVirtual = 1, 0, IIF(sf.FieldName = 'CreatedAt' OR sf.FieldName = 'UpdatedAt' OR sf.FieldName = 'ID', 0, 1)) AllowUpdateAPI,
   sf.IsVirtual,
   re.ID RelatedEntityID,
   fk.referenced_column RelatedEntityFieldName,
   IIF(sf.FieldName = 'Name', 1, 0) IsNameField,
   IsPrimaryKey =	CASE 
         WHEN pk.ColumnName IS NOT NULL THEN 1 
         ELSE 0 
      END,
   IsUnique =		CASE 
         WHEN pk.ColumnName IS NOT NULL THEN 1 
         ELSE 
            CASE 
               WHEN uk.ColumnName IS NOT NULL THEN 1 
               ELSE 0 
            END 
      END,
   ROW_NUMBER() OVER (PARTITION BY sf.EntityID, sf.FieldName ORDER BY (SELECT NULL)) AS rn
FROM
   [__mj].vwSQLColumnsAndEntityFields sf
LEFT OUTER JOIN	
   [__mj].Entity e
ON
   sf.EntityID = e.ID
LEFT OUTER JOIN
   [__mj].vwForeignKeys fk
ON
   sf.FieldName = fk.[column] AND
   e.BaseTable = fk.[table] AND
   e.SchemaName = fk.[schema_name]
LEFT OUTER JOIN 
   [__mj].Entity re -- Related Entity
ON
   re.BaseTable = fk.referenced_table AND
   re.SchemaName = fk.[schema_name]
LEFT OUTER JOIN 
   [__mj].vwTablePrimaryKeys pk
ON
   e.BaseTable = pk.TableName AND
   sf.FieldName = pk.ColumnName AND
   e.SchemaName = pk.SchemaName
LEFT OUTER JOIN 
   [__mj].vwTableUniqueKeys uk
ON
   e.BaseTable = uk.TableName AND
   sf.FieldName = uk.ColumnName AND
   e.SchemaName = uk.SchemaName
WHERE
   EntityFieldID IS NULL -- only where we have NOT YET CREATED EntityField records
 AND ( NOT ( sf.SchemaName LIKE '%' AND sf.TableName LIKE 'sys%') ) AND (sf.SchemaName <> 'sys' AND sf.SchemaName <> 'staging' AND sf.SchemaName <> '__mj')
)
SELECT 
   * 
FROM 
   NumberedRows WHERE rn = 1 -- if someone has two foreign keys with same to/from table and field name this makes sure we only get the field info ONCE 
ORDER BY EntityID, Sequence

*/