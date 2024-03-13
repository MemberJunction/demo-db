-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Post Seeds
-- Item: vwPostSeeds
-- Generated: 3/12/2024, 11:32:28 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Post Seeds
-----               SCHEMA:      reference
-----               BASE TABLE:  PostSeed
-----               PRIMARY KEY: PostSeedID
------------------------------------------------------------
DROP VIEW IF EXISTS [reference].[vwPostSeeds]
GO

CREATE VIEW [reference].[vwPostSeeds]
AS
SELECT 
    p.*
FROM
    [reference].[PostSeed] AS p
GO
GRANT SELECT ON [reference].[vwPostSeeds] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
