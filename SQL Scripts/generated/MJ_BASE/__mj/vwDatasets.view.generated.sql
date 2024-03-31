-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Datasets
-- Item: vwDatasets
-- Generated: 3/30/2024, 10:15:32 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Datasets
-----               SCHEMA:      __mj
-----               BASE TABLE:  Dataset
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwDatasets]
GO

CREATE VIEW [__mj].[vwDatasets]
AS
SELECT 
    d.*
FROM
    [__mj].[Dataset] AS d
GO
GRANT SELECT ON [__mj].[vwDatasets] TO [cdp_UI], [cdp_Developer], [cdp_Integration]