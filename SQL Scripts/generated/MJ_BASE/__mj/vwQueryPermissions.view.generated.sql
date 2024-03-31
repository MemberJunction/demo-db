-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Query Permissions
-- Item: vwQueryPermissions
-- Generated: 3/30/2024, 10:15:34 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Query Permissions
-----               SCHEMA:      __mj
-----               BASE TABLE:  QueryPermission
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwQueryPermissions]
GO

CREATE VIEW [__mj].[vwQueryPermissions]
AS
SELECT 
    q.*
FROM
    [__mj].[QueryPermission] AS q
GO
GRANT SELECT ON [__mj].[vwQueryPermissions] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
