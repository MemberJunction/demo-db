-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Schema Info
-- Item: vwSchemaInfos
-- Generated: 3/10/2024, 9:38:22 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Schema Info
-----               SCHEMA:      __mj
-----               BASE TABLE:  SchemaInfo
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwSchemaInfos]
GO

CREATE VIEW [__mj].[vwSchemaInfos]
AS
SELECT 
    s.*
FROM
    [__mj].[SchemaInfo] AS s
GO
