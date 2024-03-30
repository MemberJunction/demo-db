-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Reply Seeds
-- Item: spCreateReplySeed
-- Generated: 3/30/2024, 4:35:03 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR ReplySeed
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [reference].[spCreateReplySeed]
GO

CREATE PROCEDURE [reference].[spCreateReplySeed]
    @Content nvarchar(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [reference].[ReplySeed]
        (
            [Content]
        )
    VALUES
        (
            @Content
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [reference].[vwReplySeeds] WHERE [ReplySeedID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [reference].[spCreateReplySeed] TO [cdp_Developer], [cdp_Integration]
