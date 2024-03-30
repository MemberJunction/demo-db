-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Name Seeds
-- Item: vwNameSeeds
-- Generated: 3/30/2024, 4:35:03 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Name Seeds
-----               SCHEMA:      reference
-----               BASE TABLE:  NameSeed
-----               PRIMARY KEY: NameID
------------------------------------------------------------
DROP VIEW IF EXISTS [reference].[vwNameSeeds]
GO

CREATE VIEW [reference].[vwNameSeeds]
AS
SELECT 
    n.*
FROM
    [reference].[NameSeed] AS n
GO
GRANT SELECT ON [reference].[vwNameSeeds] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
