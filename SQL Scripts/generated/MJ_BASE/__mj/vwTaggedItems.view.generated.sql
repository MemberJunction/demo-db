-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Tagged Items
-- Item: vwTaggedItems
-- Generated: 3/30/2024, 10:15:31 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Tagged Items
-----               SCHEMA:      __mj
-----               BASE TABLE:  TaggedItem
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwTaggedItems]
GO

CREATE VIEW [__mj].[vwTaggedItems]
AS
SELECT 
    t.*,
    Tag_TagID.[Name] AS [Tag],
    Entity_EntityID.[Name] AS [Entity]
FROM
    [__mj].[TaggedItem] AS t
INNER JOIN
    [__mj].[Tag] AS Tag_TagID
  ON
    [t].[TagID] = Tag_TagID.[ID]
INNER JOIN
    [__mj].[Entity] AS Entity_EntityID
  ON
    [t].[EntityID] = Entity_EntityID.[ID]
GO
GRANT SELECT ON [__mj].[vwTaggedItems] TO [cdp_UI]