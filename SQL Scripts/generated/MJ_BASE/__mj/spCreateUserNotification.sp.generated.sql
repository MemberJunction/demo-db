-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: User Notifications
-- Item: spCreateUserNotification
-- Generated: 3/30/2024, 10:15:32 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR UserNotification
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateUserNotification]
GO

CREATE PROCEDURE [__mj].[spCreateUserNotification]
    @UserID int,
    @Title nvarchar(255),
    @Message nvarchar(MAX),
    @ResourceTypeID int,
    @ResourceRecordID int,
    @ResourceConfiguration nvarchar(MAX),
    @Unread bit,
    @ReadAt datetime
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [__mj].[UserNotification]
        (
            [UserID],
            [Title],
            [Message],
            [ResourceTypeID],
            [ResourceRecordID],
            [ResourceConfiguration],
            [Unread],
            [ReadAt]
        )
    VALUES
        (
            @UserID,
            @Title,
            @Message,
            @ResourceTypeID,
            @ResourceRecordID,
            @ResourceConfiguration,
            @Unread,
            @ReadAt
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [__mj].[vwUserNotifications] WHERE [ID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [__mj].[spCreateUserNotification] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
