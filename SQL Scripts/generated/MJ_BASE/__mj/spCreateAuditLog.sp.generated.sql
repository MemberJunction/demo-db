-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Audit Logs
-- Item: spCreateAuditLog
-- Generated: 3/30/2024, 10:15:27 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR AuditLog
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateAuditLog]
GO

CREATE PROCEDURE [__mj].[spCreateAuditLog]
    @AuditLogTypeName nvarchar(50),
    @UserID int,
    @AuthorizationName nvarchar(100),
    @Status nvarchar(50),
    @Description nvarchar(MAX),
    @Details nvarchar(MAX),
    @EntityID int,
    @RecordID nvarchar(255)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [__mj].[AuditLog]
        (
            [AuditLogTypeName],
            [UserID],
            [AuthorizationName],
            [Status],
            [Description],
            [Details],
            [EntityID],
            [RecordID]
        )
    VALUES
        (
            @AuditLogTypeName,
            @UserID,
            @AuthorizationName,
            @Status,
            @Description,
            @Details,
            @EntityID,
            @RecordID
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [__mj].[vwAuditLogs] WHERE [ID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [__mj].[spCreateAuditLog] TO [cdp_Developer], [cdp_Integration], [cdp_UI]
