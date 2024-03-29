-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Employee Roles
-- Item: vwEmployeeRoles
-- Generated: 3/10/2024, 9:38:08 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Employee Roles
-----               SCHEMA:      __mj
-----               BASE TABLE:  EmployeeRole
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwEmployeeRoles]
GO

CREATE VIEW [__mj].[vwEmployeeRoles]
AS
SELECT 
    e.*,
    Role_RoleID.[Name] AS [Role]
FROM
    [__mj].[EmployeeRole] AS e
INNER JOIN
    [__mj].[Role] AS Role_RoleID
  ON
    [e].[RoleID] = Role_RoleID.[ID]
GO
GRANT SELECT ON [__mj].[vwEmployeeRoles] TO [cdp_Developer], [cdp_Integration], [cdp_UI]
