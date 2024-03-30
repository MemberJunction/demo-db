-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Record Merge Logs
-- Item: spUpdateRecordMergeLog
-- Generated: 3/30/2024, 11:48:16 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR RecordMergeLog  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateRecordMergeLog]
GO

CREATE PROCEDURE [__mj].[spUpdateRecordMergeLog]
    @ID int,
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
    UPDATE 
        [__mj].[RecordMergeLog]
    SET 
        [EntityID] = @EntityID,
        [SurvivingRecordID] = @SurvivingRecordID,
        [InitiatedByUserID] = @InitiatedByUserID,
        [ApprovalStatus] = @ApprovalStatus,
        [ApprovedByUserID] = @ApprovedByUserID,
        [ProcessingStatus] = @ProcessingStatus,
        [ProcessingStartedAt] = @ProcessingStartedAt,
        [ProcessingEndedAt] = @ProcessingEndedAt,
        [ProcessingLog] = @ProcessingLog,
        [Comments] = @Comments,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwRecordMergeLogs] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateRecordMergeLog] TO [cdp_Developer], [cdp_Integration]
    