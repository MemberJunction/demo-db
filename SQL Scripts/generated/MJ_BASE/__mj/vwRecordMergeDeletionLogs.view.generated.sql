-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Record Merge Deletion Logs
-- Item: vwRecordMergeDeletionLogs
-- Generated: 3/30/2024, 11:48:16 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Record Merge Deletion Logs
-----               SCHEMA:      __mj
-----               BASE TABLE:  RecordMergeDeletionLog
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwRecordMergeDeletionLogs]
GO

CREATE VIEW [__mj].[vwRecordMergeDeletionLogs]
AS
SELECT 
    r.*
FROM
    [__mj].[RecordMergeDeletionLog] AS r
GO
GRANT SELECT ON [__mj].[vwRecordMergeDeletionLogs] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
