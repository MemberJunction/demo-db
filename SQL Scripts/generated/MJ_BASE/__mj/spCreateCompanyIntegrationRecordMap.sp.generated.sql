-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Company Integration Record Maps
-- Item: spCreateCompanyIntegrationRecordMap
-- Generated: 3/30/2024, 11:48:16 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR CompanyIntegrationRecordMap
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateCompanyIntegrationRecordMap]
GO

CREATE PROCEDURE [__mj].[spCreateCompanyIntegrationRecordMap]
    @CompanyIntegrationID int,
    @ExternalSystemRecordID nvarchar(100),
    @EntityID int,
    @EntityRecordID nvarchar(255)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [__mj].[CompanyIntegrationRecordMap]
        (
            [CompanyIntegrationID],
            [ExternalSystemRecordID],
            [EntityID],
            [EntityRecordID]
        )
    VALUES
        (
            @CompanyIntegrationID,
            @ExternalSystemRecordID,
            @EntityID,
            @EntityRecordID
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [__mj].[vwCompanyIntegrationRecordMaps] WHERE [ID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [__mj].[spCreateCompanyIntegrationRecordMap] TO [cdp_Developer], [cdp_Integration]
