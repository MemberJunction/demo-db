-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: File Categories
-- Item: vwFileCategories
-- Generated: 3/30/2024, 10:15:37 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      File Categories
-----               SCHEMA:      __mj
-----               BASE TABLE:  FileCategory
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwFileCategories]
GO

CREATE VIEW [__mj].[vwFileCategories]
AS
SELECT 
    f.*,
    FileCategory_ParentID.[Name] AS [Parent]
FROM
    [__mj].[FileCategory] AS f
LEFT OUTER JOIN
    [__mj].[FileCategory] AS FileCategory_ParentID
  ON
    [f].[ParentID] = FileCategory_ParentID.[ID]
GO
GRANT SELECT ON [__mj].[vwFileCategories] TO [cdp_UI], [cdp_Developer], [cdp_Integration]