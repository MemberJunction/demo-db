-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Conversation Details
-- Item: spUpdateConversationDetail
-- Generated: 3/30/2024, 11:48:15 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR ConversationDetail  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateConversationDetail]
GO

CREATE PROCEDURE [__mj].[spUpdateConversationDetail]
    @ID int,
    @ConversationID int,
    @ExternalID nvarchar(100),
    @Role nvarchar(20),
    @Message nvarchar(MAX),
    @Error nvarchar(MAX),
    @HiddenToUser bit
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[ConversationDetail]
    SET 
        [ConversationID] = @ConversationID,
        [ExternalID] = @ExternalID,
        [Role] = @Role,
        [Message] = @Message,
        [Error] = @Error,
        [HiddenToUser] = @HiddenToUser,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwConversationDetails] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateConversationDetail] TO [cdp_Developer], [cdp_Integration], [cdp_UI]
    