-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Company Integration Run API Logs
-- Item: vwCompanyIntegrationRunAPILogs
-- Generated: 3/30/2024, 10:15:25 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Company Integration Run API Logs
-----               SCHEMA:      __mj
-----               BASE TABLE:  CompanyIntegrationRunAPILog
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwCompanyIntegrationRunAPILogs]
GO

CREATE VIEW [__mj].[vwCompanyIntegrationRunAPILogs]
AS
SELECT 
    c.*
FROM
    [__mj].[CompanyIntegrationRunAPILog] AS c
GO
GRANT SELECT ON [__mj].[vwCompanyIntegrationRunAPILogs] TO [cdp_Developer], [cdp_Integration], [cdp_UI]
