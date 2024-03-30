-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Company Integration Record Maps
-- Item: vwCompanyIntegrationRecordMaps
-- Generated: 3/30/2024, 11:48:16 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Company Integration Record Maps
-----               SCHEMA:      __mj
-----               BASE TABLE:  CompanyIntegrationRecordMap
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwCompanyIntegrationRecordMaps]
GO

CREATE VIEW [__mj].[vwCompanyIntegrationRecordMaps]
AS
SELECT 
    c.*,
    Entity_EntityID.[Name] AS [Entity]
FROM
    [__mj].[CompanyIntegrationRecordMap] AS c
INNER JOIN
    [__mj].[Entity] AS Entity_EntityID
  ON
    [c].[EntityID] = Entity_EntityID.[ID]
GO
GRANT SELECT ON [__mj].[vwCompanyIntegrationRecordMaps] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
