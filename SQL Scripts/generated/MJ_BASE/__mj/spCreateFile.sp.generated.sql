-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Files
-- Item: spCreateFile
-- Generated: 3/30/2024, 10:15:37 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR File
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateFile]
GO

CREATE PROCEDURE [__mj].[spCreateFile]
    @Name nvarchar(500),
    @Description nvarchar(MAX),
    @ProviderID int,
    @ContentType nvarchar(50),
    @ProviderKey nvarchar(500),
    @CategoryID int,
    @Status nvarchar(20)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [__mj].[File]
        (
            [Name],
            [Description],
            [ProviderID],
            [ContentType],
            [ProviderKey],
            [CategoryID],
            [Status]
        )
    VALUES
        (
            @Name,
            @Description,
            @ProviderID,
            @ContentType,
            @ProviderKey,
            @CategoryID,
            @Status
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [__mj].[vwFiles] WHERE [ID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [__mj].[spCreateFile] TO [cdp_Developer], [cdp_Integration]
