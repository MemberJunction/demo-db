-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Entity Documents
-- Item: vwEntityDocuments
-- Generated: 3/30/2024, 11:48:18 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Entity Documents
-----               SCHEMA:      __mj
-----               BASE TABLE:  EntityDocument
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwEntityDocuments]
GO

CREATE VIEW [__mj].[vwEntityDocuments]
AS
SELECT 
    e.*,
    Entity_EntityID.[Name] AS [Entity],
    EntityDocumentType_TypeID.[Name] AS [Type]
FROM
    [__mj].[EntityDocument] AS e
INNER JOIN
    [__mj].[Entity] AS Entity_EntityID
  ON
    [e].[EntityID] = Entity_EntityID.[ID]
INNER JOIN
    [__mj].[EntityDocumentType] AS EntityDocumentType_TypeID
  ON
    [e].[TypeID] = EntityDocumentType_TypeID.[ID]
GO
GRANT SELECT ON [__mj].[vwEntityDocuments] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
