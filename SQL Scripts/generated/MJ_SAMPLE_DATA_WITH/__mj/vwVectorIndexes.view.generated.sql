-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Vector Indexes
-- Item: vwVectorIndexes
-- Generated: 3/10/2024, 9:38:23 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Vector Indexes
-----               SCHEMA:      __mj
-----               BASE TABLE:  VectorIndex
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwVectorIndexes]
GO

CREATE VIEW [__mj].[vwVectorIndexes]
AS
SELECT 
    v.*,
    VectorDatabase_VectorDatabaseID.[Name] AS [VectorDatabase],
    AIModel_EmbeddingModelID.[Name] AS [EmbeddingModel]
FROM
    [__mj].[VectorIndex] AS v
INNER JOIN
    [__mj].[VectorDatabase] AS VectorDatabase_VectorDatabaseID
  ON
    [v].[VectorDatabaseID] = VectorDatabase_VectorDatabaseID.[ID]
INNER JOIN
    [__mj].[AIModel] AS AIModel_EmbeddingModelID
  ON
    [v].[EmbeddingModelID] = AIModel_EmbeddingModelID.[ID]
GO
GRANT SELECT ON [__mj].[vwVectorIndexes] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
