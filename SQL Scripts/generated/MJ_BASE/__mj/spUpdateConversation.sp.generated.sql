-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Conversations
-- Item: spUpdateConversation
-- Generated: 3/30/2024, 10:15:32 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Conversation  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateConversation]
GO

CREATE PROCEDURE [__mj].[spUpdateConversation]
    @ID int,
    @UserID int,
    @ExternalID nvarchar(100),
    @Name nvarchar(100),
    @Description nvarchar(MAX),
    @Type nvarchar(50),
    @IsArchived bit,
    @LinkedEntityID int,
    @LinkedRecordID int,
    @DataContextID int
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[Conversation]
    SET 
        [UserID] = @UserID,
        [ExternalID] = @ExternalID,
        [Name] = @Name,
        [Description] = @Description,
        [Type] = @Type,
        [IsArchived] = @IsArchived,
        [LinkedEntityID] = @LinkedEntityID,
        [LinkedRecordID] = @LinkedRecordID,
        [DataContextID] = @DataContextID,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwConversations] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateConversation] TO [cdp_Developer], [cdp_Integration], [cdp_UI]
    