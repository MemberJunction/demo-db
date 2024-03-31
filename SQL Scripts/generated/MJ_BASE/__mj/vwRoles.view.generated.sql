-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Roles
-- Item: vwRoles
-- Generated: 3/30/2024, 10:15:21 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Roles
-----               SCHEMA:      __mj
-----               BASE TABLE:  Role
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwRoles]
GO

CREATE VIEW [__mj].[vwRoles]
AS
SELECT 
    r.*
FROM
    [__mj].[Role] AS r
GO
GRANT SELECT ON [__mj].[vwRoles] TO [cdp_Developer], [cdp_Integration], [cdp_UI]