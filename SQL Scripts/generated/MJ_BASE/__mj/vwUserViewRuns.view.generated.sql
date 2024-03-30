-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: User View Runs
-- Item: vwUserViewRuns
-- Generated: 3/30/2024, 11:48:08 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      User View Runs
-----               SCHEMA:      __mj
-----               BASE TABLE:  UserViewRun
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwUserViewRuns]
GO

CREATE VIEW [__mj].[vwUserViewRuns]
AS
SELECT 
    u.*,
    UserView_UserViewID.[Name] AS [UserView],
    User_RunByUserID.[Name] AS [RunByUser]
FROM
    [__mj].[UserViewRun] AS u
INNER JOIN
    [__mj].[UserView] AS UserView_UserViewID
  ON
    [u].[UserViewID] = UserView_UserViewID.[ID]
INNER JOIN
    [__mj].[User] AS User_RunByUserID
  ON
    [u].[RunByUserID] = User_RunByUserID.[ID]
GO
GRANT SELECT ON [__mj].[vwUserViewRuns] TO [cdp_Developer], [cdp_Integration], [cdp_UI]
