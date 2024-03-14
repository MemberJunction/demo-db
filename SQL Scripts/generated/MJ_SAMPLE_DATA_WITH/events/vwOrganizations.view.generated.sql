-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Organizations
-- Item: vwOrganizations
-- Generated: 3/13/2024, 8:19:38 PM
--
-- This was generated by the Entity Generator.
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
