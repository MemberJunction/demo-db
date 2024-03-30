-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Query Fields
-- Item: vwQueryFields
-- Generated: 3/30/2024, 11:48:16 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Query Fields
-----               SCHEMA:      __mj
-----               BASE TABLE:  QueryField
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwQueryFields]
GO

CREATE VIEW [__mj].[vwQueryFields]
AS
SELECT 
    q.*,
    Query_QueryID.[Name] AS [Query],
    Entity_SourceEntityID.[Name] AS [SourceEntity]
FROM
    [__mj].[QueryField] AS q
INNER JOIN
    [__mj].[Query] AS Query_QueryID
  ON
    [q].[QueryID] = Query_QueryID.[ID]
LEFT OUTER JOIN
    [__mj].[Entity] AS Entity_SourceEntityID
  ON
    [q].[SourceEntityID] = Entity_SourceEntityID.[ID]
GO
GRANT SELECT ON [__mj].[vwQueryFields] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
