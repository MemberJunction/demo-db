-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Organizations
-- Item: vwOrganizations
-- Generated: 4/5/2024, 6:36:53 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Organizations
-----               SCHEMA:      events
-----               BASE TABLE:  Organization
-----               PRIMARY KEY: OrganizationID
------------------------------------------------------------
DROP VIEW IF EXISTS [events].[vwOrganizations]
GO

CREATE VIEW [events].[vwOrganizations]
AS
SELECT 
    o.*
FROM
    [events].[Organization] AS o
GO
GRANT SELECT ON [events].[vwOrganizations] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
