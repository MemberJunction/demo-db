-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Queries
-- Item: vwQueries
-- Generated: 3/30/2024, 11:48:17 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Queries
-----               SCHEMA:      __mj
-----               BASE TABLE:  Query
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwQueries]
GO

CREATE VIEW [__mj].[vwQueries]
AS
SELECT 
    q.*,
    QueryCategory_CategoryID.[Name] AS [Category]
FROM
    [__mj].[Query] AS q
LEFT OUTER JOIN
    [__mj].[QueryCategory] AS QueryCategory_CategoryID
  ON
    [q].[CategoryID] = QueryCategory_CategoryID.[ID]
GO
GRANT SELECT ON [__mj].[vwQueries] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
