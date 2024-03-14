-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Posts
-- Item: spUpdatePost
-- Generated: 3/13/2024, 8:19:34 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Post  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [community].[spUpdatePost]
GO

CREATE PROCEDURE [community].[spUpdatePost]
    @PostID int,
    @ForumID int,
    @AuthorID int,
    @PostContent nvarchar(MAX),
    @PostDate date
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [community].[Post]
    SET 
        [ForumID] = @ForumID,
        [AuthorID] = @AuthorID,
        [PostContent] = @PostContent,
        [PostDate] = @PostDate
    WHERE 
        [PostID] = @PostID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [community].[vwPosts] WHERE [PostID] = @PostID
END
GO
GRANT EXECUTE ON [community].[spUpdatePost] TO [cdp_Developer], [cdp_Integration]
    