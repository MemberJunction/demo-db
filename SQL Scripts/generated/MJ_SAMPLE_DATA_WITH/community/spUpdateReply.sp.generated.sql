-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Replies
-- Item: spUpdateReply
-- Generated: 3/13/2024, 8:19:34 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Reply  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [community].[spUpdateReply]
GO

CREATE PROCEDURE [community].[spUpdateReply]
    @ReplyID int,
    @PostID int,
    @AuthorID int,
    @ReplyContent nvarchar(MAX),
    @ReplyDate date
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [community].[Reply]
    SET 
        [PostID] = @PostID,
        [AuthorID] = @AuthorID,
        [ReplyContent] = @ReplyContent,
        [ReplyDate] = @ReplyDate
    WHERE 
        [ReplyID] = @ReplyID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [community].[vwReplies] WHERE [ReplyID] = @ReplyID
END
GO
GRANT EXECUTE ON [community].[spUpdateReply] TO [cdp_Developer], [cdp_Integration]
    