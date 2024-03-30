-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Report Categories
-- Item: vwReportCategories
-- Generated: 3/30/2024, 11:48:19 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Report Categories
-----               SCHEMA:      __mj
-----               BASE TABLE:  ReportCategory
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwReportCategories]
GO

CREATE VIEW [__mj].[vwReportCategories]
AS
SELECT 
    r.*,
    ReportCategory_ParentID.[Name] AS [Parent]
FROM
    [__mj].[ReportCategory] AS r
LEFT OUTER JOIN
    [__mj].[ReportCategory] AS ReportCategory_ParentID
  ON
    [r].[ParentID] = ReportCategory_ParentID.[ID]
GO
GRANT SELECT ON [__mj].[vwReportCategories] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
