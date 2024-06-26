-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Company Integrations
-- Item: spUpdateCompanyIntegration
-- Generated: 3/30/2024, 10:15:22 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR CompanyIntegration  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateCompanyIntegration]
GO

CREATE PROCEDURE [__mj].[spUpdateCompanyIntegration]
    @ID int,
    @CompanyName nvarchar(50),
    @IntegrationName nvarchar(100),
    @IsActive bit,
    @AccessToken nvarchar(255),
    @RefreshToken nvarchar(255),
    @TokenExpirationDate datetime,
    @APIKey nvarchar(255),
    @ExternalSystemID nvarchar(100),
    @IsExternalSystemReadOnly bit,
    @ClientID nvarchar(255),
    @ClientSecret nvarchar(255),
    @CustomAttribute1 nvarchar(255)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[CompanyIntegration]
    SET 
        [CompanyName] = @CompanyName,
        [IntegrationName] = @IntegrationName,
        [IsActive] = @IsActive,
        [AccessToken] = @AccessToken,
        [RefreshToken] = @RefreshToken,
        [TokenExpirationDate] = @TokenExpirationDate,
        [APIKey] = @APIKey,
        [UpdatedAt] = GETDATE(),
        [ExternalSystemID] = @ExternalSystemID,
        [IsExternalSystemReadOnly] = @IsExternalSystemReadOnly,
        [ClientID] = @ClientID,
        [ClientSecret] = @ClientSecret,
        [CustomAttribute1] = @CustomAttribute1
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwCompanyIntegrations] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateCompanyIntegration] TO [cdp_Developer], [cdp_Integration]
    