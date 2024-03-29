-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Organization Links
-- Item: vwOrganizationLinks
-- Generated: 3/16/2024, 12:11:22 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Organization Links
-----               SCHEMA:      common
-----               BASE TABLE:  OrganizationLink
-----               PRIMARY KEY: OrganizationLinkID
------------------------------------------------------------
DROP VIEW IF EXISTS [common].[vwOrganizationLinks]
GO

CREATE VIEW [common].[vwOrganizationLinks]
AS
SELECT 
    o.*
FROM
    [common].[OrganizationLink] AS o
GO
GRANT SELECT ON [common].[vwOrganizationLinks] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
