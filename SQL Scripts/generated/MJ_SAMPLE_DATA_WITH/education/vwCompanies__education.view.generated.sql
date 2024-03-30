-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Companies__education
-- Item: vwCompanies__education
-- Generated: 3/30/2024, 4:35:05 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Companies__education
-----               SCHEMA:      education
-----               BASE TABLE:  Company
-----               PRIMARY KEY: CompanyID
------------------------------------------------------------
DROP VIEW IF EXISTS [education].[vwCompanies__education]
GO

CREATE VIEW [education].[vwCompanies__education]
AS
SELECT 
    c.*
FROM
    [education].[Company] AS c
GO
GRANT SELECT ON [education].[vwCompanies__education] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
