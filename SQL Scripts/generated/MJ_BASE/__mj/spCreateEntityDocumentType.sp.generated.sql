-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Entity Document Types
-- Item: spCreateEntityDocumentType
-- Generated: 3/30/2024, 11:48:17 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR EntityDocumentType
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateEntityDocumentType]
GO

CREATE PROCEDURE [__mj].[spCreateEntityDocumentType]
    @Name nvarchar(100),
    @Description nvarchar(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [__mj].[EntityDocumentType]
        (
            [Name],
            [Description]
        )
    VALUES
        (
            @Name,
            @Description
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [__mj].[vwEntityDocumentTypes] WHERE [ID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [__mj].[spCreateEntityDocumentType] TO [cdp_Developer], [cdp_Integration]
