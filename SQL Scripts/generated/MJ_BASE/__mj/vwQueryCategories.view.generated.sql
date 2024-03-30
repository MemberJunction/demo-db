-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Query Categories
-- Item: vwQueryCategories
-- Generated: 3/30/2024, 11:48:17 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Query Categories
-----               SCHEMA:      __mj
-----               BASE TABLE:  QueryCategory
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwQueryCategories]
GO

CREATE VIEW [__mj].[vwQueryCategories]
AS
SELECT 
    q.*,
    QueryCategory_ParentID.[Name] AS [Parent]
FROM
    [__mj].[QueryCategory] AS q
LEFT OUTER JOIN
    [__mj].[QueryCategory] AS QueryCategory_ParentID
  ON
    [q].[ParentID] = QueryCategory_ParentID.[ID]
GO
GRANT SELECT ON [__mj].[vwQueryCategories] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
