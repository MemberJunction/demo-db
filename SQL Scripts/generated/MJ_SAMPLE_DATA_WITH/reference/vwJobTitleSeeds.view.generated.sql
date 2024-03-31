-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Job Title Seeds
-- Item: vwJobTitleSeeds
-- Generated: 3/31/2024, 11:57:29 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Job Title Seeds
-----               SCHEMA:      reference
-----               BASE TABLE:  JobTitleSeed
-----               PRIMARY KEY: JobTitleID
------------------------------------------------------------
DROP VIEW IF EXISTS [reference].[vwJobTitleSeeds]
GO

CREATE VIEW [reference].[vwJobTitleSeeds]
AS
SELECT 
    j.*
FROM
    [reference].[JobTitleSeed] AS j
GO
GRANT SELECT ON [reference].[vwJobTitleSeeds] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
