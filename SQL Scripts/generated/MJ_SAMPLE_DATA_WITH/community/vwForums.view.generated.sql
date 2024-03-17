-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Forums
-- Item: vwForums
-- Generated: 3/16/2024, 12:11:17 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Forums
-----               SCHEMA:      community
-----               BASE TABLE:  Forum
-----               PRIMARY KEY: ForumID
------------------------------------------------------------
DROP VIEW IF EXISTS [community].[vwForums]
GO

CREATE VIEW [community].[vwForums]
AS
SELECT 
    f.*
FROM
    [community].[Forum] AS f
GO
GRANT SELECT ON [community].[vwForums] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
