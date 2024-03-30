-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Forums
-- Item: spUpdateForum
-- Generated: 3/30/2024, 4:35:01 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Forum  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [community].[spUpdateForum]
GO

CREATE PROCEDURE [community].[spUpdateForum]
    @ForumID int,
    @Title nvarchar(255),
    @Description nvarchar(MAX),
    @CreationDate date
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [community].[Forum]
    SET 
        [Title] = @Title,
        [Description] = @Description,
        [CreationDate] = @CreationDate
    WHERE 
        [ForumID] = @ForumID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [community].[vwForums] WHERE [ForumID] = @ForumID
END
GO
GRANT EXECUTE ON [community].[spUpdateForum] TO [cdp_Developer], [cdp_Integration]
    