-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Company Integration Runs
-- Item: vwCompanyIntegrationRuns
-- Generated: 3/30/2024, 10:15:23 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Company Integration Runs
-----               SCHEMA:      __mj
-----               BASE TABLE:  CompanyIntegrationRun
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwCompanyIntegrationRuns]
GO

CREATE VIEW [__mj].[vwCompanyIntegrationRuns]
AS
SELECT 
    c.*,
    User_RunByUserID.[Name] AS [RunByUser]
FROM
    [__mj].[CompanyIntegrationRun] AS c
INNER JOIN
    [__mj].[User] AS User_RunByUserID
  ON
    [c].[RunByUserID] = User_RunByUserID.[ID]
GO
GRANT SELECT ON [__mj].[vwCompanyIntegrationRuns] TO [cdp_Developer], [cdp_Integration], [cdp_UI]
