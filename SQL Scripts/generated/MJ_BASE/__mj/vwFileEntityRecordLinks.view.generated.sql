-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: File Entity Record Links
-- Item: vwFileEntityRecordLinks
-- Generated: 3/30/2024, 10:15:37 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      File Entity Record Links
-----               SCHEMA:      __mj
-----               BASE TABLE:  FileEntityRecordLink
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwFileEntityRecordLinks]
GO

CREATE VIEW [__mj].[vwFileEntityRecordLinks]
AS
SELECT 
    f.*,
    File_FileID.[Name] AS [File],
    Entity_EntityID.[Name] AS [Entity]
FROM
    [__mj].[FileEntityRecordLink] AS f
INNER JOIN
    [__mj].[File] AS File_FileID
  ON
    [f].[FileID] = File_FileID.[ID]
INNER JOIN
    [__mj].[Entity] AS Entity_EntityID
  ON
    [f].[EntityID] = Entity_EntityID.[ID]
GO
GRANT SELECT ON [__mj].[vwFileEntityRecordLinks] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
