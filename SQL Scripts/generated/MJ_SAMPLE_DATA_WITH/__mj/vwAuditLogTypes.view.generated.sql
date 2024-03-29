-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Audit Log Types
-- Item: vwAuditLogTypes
-- Generated: 3/10/2024, 9:38:16 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Audit Log Types
-----               SCHEMA:      __mj
-----               BASE TABLE:  AuditLogType
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwAuditLogTypes]
GO

CREATE VIEW [__mj].[vwAuditLogTypes]
AS
SELECT 
    a.*,
    AuditLogType_ParentID.[Name] AS [Parent]
FROM
    [__mj].[AuditLogType] AS a
LEFT OUTER JOIN
    [__mj].[AuditLogType] AS AuditLogType_ParentID
  ON
    [a].[ParentID] = AuditLogType_ParentID.[ID]
GO
GRANT SELECT ON [__mj].[vwAuditLogTypes] TO [cdp_Developer], [cdp_Integration], [cdp_UI]
