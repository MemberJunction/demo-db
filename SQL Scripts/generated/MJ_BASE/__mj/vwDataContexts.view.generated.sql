-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Data Contexts
-- Item: vwDataContexts
-- Generated: 3/30/2024, 10:15:36 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Data Contexts
-----               SCHEMA:      __mj
-----               BASE TABLE:  DataContext
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwDataContexts]
GO

CREATE VIEW [__mj].[vwDataContexts]
AS
SELECT 
    d.*,
    User_UserID.[Name] AS [User]
FROM
    [__mj].[DataContext] AS d
INNER JOIN
    [__mj].[User] AS User_UserID
  ON
    [d].[UserID] = User_UserID.[ID]
GO
GRANT SELECT ON [__mj].[vwDataContexts] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
