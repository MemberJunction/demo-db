-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Dashboards
-- Item: vwDashboards
-- Generated: 3/30/2024, 10:15:28 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Dashboards
-----               SCHEMA:      __mj
-----               BASE TABLE:  Dashboard
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwDashboards]
GO

CREATE VIEW [__mj].[vwDashboards]
AS
SELECT 
    d.*,
    DashboardCategory_CategoryID.[Name] AS [Category],
    User_UserID.[Name] AS [User]
FROM
    [__mj].[Dashboard] AS d
LEFT OUTER JOIN
    [__mj].[DashboardCategory] AS DashboardCategory_CategoryID
  ON
    [d].[CategoryID] = DashboardCategory_CategoryID.[ID]
LEFT OUTER JOIN
    [__mj].[User] AS User_UserID
  ON
    [d].[UserID] = User_UserID.[ID]
GO
GRANT SELECT ON [__mj].[vwDashboards] TO [cdp_UI]