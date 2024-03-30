-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Entity Document Types
-- Item: vwEntityDocumentTypes
-- Generated: 3/30/2024, 11:48:17 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Entity Document Types
-----               SCHEMA:      __mj
-----               BASE TABLE:  EntityDocumentType
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwEntityDocumentTypes]
GO

CREATE VIEW [__mj].[vwEntityDocumentTypes]
AS
SELECT 
    e.*
FROM
    [__mj].[EntityDocumentType] AS e
GO
GRANT SELECT ON [__mj].[vwEntityDocumentTypes] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
