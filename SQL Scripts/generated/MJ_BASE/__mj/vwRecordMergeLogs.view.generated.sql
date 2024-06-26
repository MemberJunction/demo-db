-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Record Merge Logs
-- Item: vwRecordMergeLogs
-- Generated: 3/30/2024, 10:15:33 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Record Merge Logs
-----               SCHEMA:      __mj
-----               BASE TABLE:  RecordMergeLog
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwRecordMergeLogs]
GO

CREATE VIEW [__mj].[vwRecordMergeLogs]
AS
SELECT 
    r.*,
    Entity_EntityID.[Name] AS [Entity],
    User_InitiatedByUserID.[Name] AS [InitiatedByUser]
FROM
    [__mj].[RecordMergeLog] AS r
INNER JOIN
    [__mj].[Entity] AS Entity_EntityID
  ON
    [r].[EntityID] = Entity_EntityID.[ID]
INNER JOIN
    [__mj].[User] AS User_InitiatedByUserID
  ON
    [r].[InitiatedByUserID] = User_InitiatedByUserID.[ID]
GO
GRANT SELECT ON [__mj].[vwRecordMergeLogs] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
