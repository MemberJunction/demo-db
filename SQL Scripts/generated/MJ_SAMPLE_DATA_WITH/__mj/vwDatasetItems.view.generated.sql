-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Dataset Items
-- Item: vwDatasetItems
-- Generated: 3/10/2024, 9:38:21 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Dataset Items
-----               SCHEMA:      __mj
-----               BASE TABLE:  DatasetItem
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwDatasetItems]
GO

CREATE VIEW [__mj].[vwDatasetItems]
AS
SELECT 
    d.*,
    Entity_EntityID.[Name] AS [Entity]
FROM
    [__mj].[DatasetItem] AS d
INNER JOIN
    [__mj].[Entity] AS Entity_EntityID
  ON
    [d].[EntityID] = Entity_EntityID.[ID]
GO
GRANT SELECT ON [__mj].[vwDatasetItems] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
