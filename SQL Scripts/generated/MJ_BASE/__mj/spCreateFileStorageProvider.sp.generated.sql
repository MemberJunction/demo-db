-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: File Storage Providers
-- Item: spCreateFileStorageProvider
-- Generated: 3/30/2024, 10:15:36 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR FileStorageProvider
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateFileStorageProvider]
GO

CREATE PROCEDURE [__mj].[spCreateFileStorageProvider]
    @Name nvarchar(50),
    @Description nvarchar(MAX),
    @ServerDriverKey nvarchar(100),
    @ClientDriverKey nvarchar(100),
    @Priority int,
    @IsActive bit
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [__mj].[FileStorageProvider]
        (
            [Name],
            [Description],
            [ServerDriverKey],
            [ClientDriverKey],
            [Priority],
            [IsActive]
        )
    VALUES
        (
            @Name,
            @Description,
            @ServerDriverKey,
            @ClientDriverKey,
            @Priority,
            @IsActive
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [__mj].[vwFileStorageProviders] WHERE [ID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [__mj].[spCreateFileStorageProvider] TO [cdp_Developer], [cdp_Integration]
