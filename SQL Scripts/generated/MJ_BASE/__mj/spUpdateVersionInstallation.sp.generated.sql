-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Version Installations
-- Item: spUpdateVersionInstallation
-- Generated: 3/30/2024, 10:15:37 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR VersionInstallation  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateVersionInstallation]
GO

CREATE PROCEDURE [__mj].[spUpdateVersionInstallation]
    @ID int,
    @MajorVersion int,
    @MinorVersion int,
    @PatchVersion int,
    @Type nvarchar(20),
    @InstalledAt datetime,
    @Status nvarchar(20),
    @InstallLog nvarchar(MAX),
    @Comments nvarchar(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[VersionInstallation]
    SET 
        [MajorVersion] = @MajorVersion,
        [MinorVersion] = @MinorVersion,
        [PatchVersion] = @PatchVersion,
        [Type] = @Type,
        [InstalledAt] = @InstalledAt,
        [Status] = @Status,
        [InstallLog] = @InstallLog,
        [Comments] = @Comments,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwVersionInstallations] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateVersionInstallation] TO [cdp_Developer], [cdp_Integration]
    