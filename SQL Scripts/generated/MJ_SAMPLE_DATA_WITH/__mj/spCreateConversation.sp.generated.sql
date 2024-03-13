-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Conversations
-- Item: spCreateConversation
-- Generated: 3/10/2024, 9:38:21 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR Conversation
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateConversation]
GO

CREATE PROCEDURE [__mj].[spCreateConversation]
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
    
    INSERT INTO 
    [__mj].[Conversation]
        (
            [UserID],
            [ExternalID],
            [Name],
            [Description],
            [Type],
            [IsArchived],
            [LinkedEntityID],
            [LinkedRecordID],
            [DataContextID]
        )
    VALUES
        (
            @UserID,
            @ExternalID,
            @Name,
            @Description,
            @Type,
            @IsArchived,
            @LinkedEntityID,
            @LinkedRecordID,
            @DataContextID
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [__mj].[vwConversations] WHERE [ID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [__mj].[spCreateConversation] TO [cdp_UI], [cdp_UI], [cdp_Developer], [cdp_Integration]
