-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Conversations
-- Item: vwConversations
-- Generated: 3/30/2024, 11:48:15 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Conversations
-----               SCHEMA:      __mj
-----               BASE TABLE:  Conversation
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwConversations]
GO

CREATE VIEW [__mj].[vwConversations]
AS
SELECT 
    c.*,
    User_UserID.[Name] AS [User],
    Entity_LinkedEntityID.[Name] AS [LinkedEntity]
FROM
    [__mj].[Conversation] AS c
INNER JOIN
    [__mj].[User] AS User_UserID
  ON
    [c].[UserID] = User_UserID.[ID]
LEFT OUTER JOIN
    [__mj].[Entity] AS Entity_LinkedEntityID
  ON
    [c].[LinkedEntityID] = Entity_LinkedEntityID.[ID]
GO
GRANT SELECT ON [__mj].[vwConversations] TO [cdp_Developer], [cdp_Integration], [cdp_UI]
