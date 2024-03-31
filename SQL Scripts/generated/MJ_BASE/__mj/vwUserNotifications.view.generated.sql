-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: User Notifications
-- Item: vwUserNotifications
-- Generated: 3/30/2024, 10:15:32 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      User Notifications
-----               SCHEMA:      __mj
-----               BASE TABLE:  UserNotification
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwUserNotifications]
GO

CREATE VIEW [__mj].[vwUserNotifications]
AS
SELECT 
    u.*,
    User_UserID.[Name] AS [User]
FROM
    [__mj].[UserNotification] AS u
INNER JOIN
    [__mj].[User] AS User_UserID
  ON
    [u].[UserID] = User_UserID.[ID]
GO
GRANT SELECT ON [__mj].[vwUserNotifications] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
