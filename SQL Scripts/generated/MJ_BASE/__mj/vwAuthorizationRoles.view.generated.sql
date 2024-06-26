-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Authorization Roles
-- Item: vwAuthorizationRoles
-- Generated: 3/30/2024, 10:15:27 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Authorization Roles
-----               SCHEMA:      __mj
-----               BASE TABLE:  AuthorizationRole
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwAuthorizationRoles]
GO

CREATE VIEW [__mj].[vwAuthorizationRoles]
AS
SELECT 
    a.*
FROM
    [__mj].[AuthorizationRole] AS a
GO
GRANT SELECT ON [__mj].[vwAuthorizationRoles] TO [cdp_Developer], [cdp_Integration], [cdp_UI]
