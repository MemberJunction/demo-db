-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Reply Seeds
-- Item: spUpdateReplySeed
-- Generated: 4/8/2024, 7:45:28 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR ReplySeed  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [reference].[spUpdateReplySeed]
GO

CREATE PROCEDURE [reference].[spUpdateReplySeed]
    @ReplySeedID int,
    @Content nvarchar(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [reference].[ReplySeed]
    SET 
        [Content] = @Content
    WHERE 
        [ReplySeedID] = @ReplySeedID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [reference].[vwReplySeeds] WHERE [ReplySeedID] = @ReplySeedID
END
GO
GRANT EXECUTE ON [reference].[spUpdateReplySeed] TO [cdp_Developer], [cdp_Integration]
    