-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: List Details
-- Item: vwListDetails
-- Generated: 3/30/2024, 11:48:08 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      List Details
-----               SCHEMA:      __mj
-----               BASE TABLE:  ListDetail
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwListDetails]
GO

CREATE VIEW [__mj].[vwListDetails]
AS
SELECT 
    l.*
FROM
    [__mj].[ListDetail] AS l
GO
GRANT SELECT ON [__mj].[vwListDetails] TO [cdp_Developer], [cdp_Integration], [cdp_UI]
