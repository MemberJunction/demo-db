-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Entity Document Runs
-- Item: spUpdateEntityDocumentRun
-- Generated: 3/30/2024, 10:15:35 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR EntityDocumentRun  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateEntityDocumentRun]
GO

CREATE PROCEDURE [__mj].[spUpdateEntityDocumentRun]
    @ID int,
    @EntityDocumentID int,
    @StartedAt datetime,
    @EndedAt datetime,
    @Status nvarchar(15)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[EntityDocumentRun]
    SET 
        [EntityDocumentID] = @EntityDocumentID,
        [StartedAt] = @StartedAt,
        [EndedAt] = @EndedAt,
        [Status] = @Status,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwEntityDocumentRuns] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateEntityDocumentRun] TO [cdp_Developer], [cdp_Integration]
    