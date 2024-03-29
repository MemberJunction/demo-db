-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: User View Categories
-- Item: vwUserViewCategories
-- Generated: 3/10/2024, 9:38:24 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      User View Categories
-----               SCHEMA:      __mj
-----               BASE TABLE:  UserViewCategory
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwUserViewCategories]
GO

CREATE VIEW [__mj].[vwUserViewCategories]
AS
SELECT 
    u.*,
    UserViewCategory_ParentID.[Name] AS [Parent]
FROM
    [__mj].[UserViewCategory] AS u
LEFT OUTER JOIN
    [__mj].[UserViewCategory] AS UserViewCategory_ParentID
  ON
    [u].[ParentID] = UserViewCategory_ParentID.[ID]
GO
GRANT SELECT ON [__mj].[vwUserViewCategories] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
