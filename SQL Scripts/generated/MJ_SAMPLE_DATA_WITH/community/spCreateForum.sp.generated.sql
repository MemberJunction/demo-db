-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Forums
-- Item: spCreateForum
-- Generated: 3/16/2024, 12:11:17 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR Forum
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [community].[spCreateForum]
GO

CREATE PROCEDURE [community].[spCreateForum]
    @Title nvarchar(255),
    @Description nvarchar(MAX),
    @CreationDate date
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [community].[Forum]
        (
            [Title],
            [Description],
            [CreationDate]
        )
    VALUES
        (
            @Title,
            @Description,
            @CreationDate
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [community].[vwForums] WHERE [ForumID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [community].[spCreateForum] TO [cdp_Developer], [cdp_Integration]
