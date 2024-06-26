-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: File Storage Providers
-- Item: vwFileStorageProviders
-- Generated: 3/30/2024, 10:15:36 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      File Storage Providers
-----               SCHEMA:      __mj
-----               BASE TABLE:  FileStorageProvider
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwFileStorageProviders]
GO

CREATE VIEW [__mj].[vwFileStorageProviders]
AS
SELECT 
    f.*
FROM
    [__mj].[FileStorageProvider] AS f
GO
GRANT SELECT ON [__mj].[vwFileStorageProviders] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
