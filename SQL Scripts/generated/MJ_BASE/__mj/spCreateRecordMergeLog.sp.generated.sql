-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Record Merge Logs
-- Item: spCreateRecordMergeLog
-- Generated: 3/30/2024, 10:15:33 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR RecordMergeLog
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateRecordMergeLog]
GO

CREATE PROCEDURE [__mj].[spCreateRecordMergeLog]
    @EntityID int,
    @SurvivingRecordID nvarchar(255),
    @InitiatedByUserID int,
    @ApprovalStatus nvarchar(10),
    @ApprovedByUserID int,
    @ProcessingStatus nvarchar(10),
    @ProcessingStartedAt datetime,
    @ProcessingEndedAt datetime,
    @ProcessingLog nvarchar(MAX),
    @Comments nvarchar(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [__mj].[RecordMergeLog]
        (
            [EntityID],
            [SurvivingRecordID],
            [InitiatedByUserID],
            [ApprovalStatus],
            [ApprovedByUserID],
            [ProcessingStatus],
            [ProcessingStartedAt],
            [ProcessingEndedAt],
            [ProcessingLog],
            [Comments]
        )
    VALUES
        (
            @EntityID,
            @SurvivingRecordID,
            @InitiatedByUserID,
            @ApprovalStatus,
            @ApprovedByUserID,
            @ProcessingStatus,
            @ProcessingStartedAt,
            @ProcessingEndedAt,
            @ProcessingLog,
            @Comments
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [__mj].[vwRecordMergeLogs] WHERE [ID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [__mj].[spCreateRecordMergeLog] TO [cdp_Developer], [cdp_Integration]
