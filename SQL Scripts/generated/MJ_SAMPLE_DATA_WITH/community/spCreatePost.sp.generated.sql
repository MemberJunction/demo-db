-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Posts
-- Item: spCreatePost
-- Generated: 4/8/2024, 8:01:15 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR Post
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [community].[spCreatePost]
GO

CREATE PROCEDURE [community].[spCreatePost]
    @ForumID int,
    @AuthorID int,
    @PostContent nvarchar(MAX),
    @PostDate date
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [community].[Post]
        (
            [ForumID],
            [AuthorID],
            [PostContent],
            [PostDate]
        )
    VALUES
        (
            @ForumID,
            @AuthorID,
            @PostContent,
            @PostDate
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [community].[vwPosts] WHERE [PostID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [community].[spCreatePost] TO [cdp_Developer], [cdp_Integration]
