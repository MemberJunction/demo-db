-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Files
-- Item: spUpdateFile
-- Generated: 3/30/2024, 10:15:37 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR File  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateFile]
GO

CREATE PROCEDURE [__mj].[spUpdateFile]
    @ID int,
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
    UPDATE 
        [__mj].[File]
    SET 
        [Name] = @Name,
        [Description] = @Description,
        [ProviderID] = @ProviderID,
        [ContentType] = @ContentType,
        [ProviderKey] = @ProviderKey,
        [CategoryID] = @CategoryID,
        [Status] = @Status,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwFiles] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateFile] TO [cdp_Developer], [cdp_Integration]
    