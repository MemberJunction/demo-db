-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: File Storage Providers
-- Item: spUpdateFileStorageProvider
-- Generated: 3/30/2024, 10:15:36 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR FileStorageProvider  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateFileStorageProvider]
GO

CREATE PROCEDURE [__mj].[spUpdateFileStorageProvider]
    @ID int,
    @Name nvarchar(50),
    @Description nvarchar(MAX),
    @ServerDriverKey nvarchar(100),
    @ClientDriverKey nvarchar(100),
    @Priority int,
    @IsActive bit
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[FileStorageProvider]
    SET 
        [Name] = @Name,
        [Description] = @Description,
        [ServerDriverKey] = @ServerDriverKey,
        [ClientDriverKey] = @ClientDriverKey,
        [Priority] = @Priority,
        [IsActive] = @IsActive,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwFileStorageProviders] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateFileStorageProvider] TO [cdp_Developer], [cdp_Integration]
    