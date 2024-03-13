-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Reply Seeds
-- Item: vwReplySeeds
-- Generated: 3/12/2024, 11:32:28 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Reply Seeds
-----               SCHEMA:      reference
-----               BASE TABLE:  ReplySeed
-----               PRIMARY KEY: ReplySeedID
------------------------------------------------------------
DROP VIEW IF EXISTS [reference].[vwReplySeeds]
GO

CREATE VIEW [reference].[vwReplySeeds]
AS
SELECT 
    r.*
FROM
    [reference].[ReplySeed] AS r
GO
GRANT SELECT ON [reference].[vwReplySeeds] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
