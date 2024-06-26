-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: File Entity Record Links
-- Item: spUpdateFileEntityRecordLink
-- Generated: 3/30/2024, 10:15:37 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR FileEntityRecordLink  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateFileEntityRecordLink]
GO

CREATE PROCEDURE [__mj].[spUpdateFileEntityRecordLink]
    @ID int,
    @FileID int,
    @EntityID int,
    @RecordID nvarchar(255)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[FileEntityRecordLink]
    SET 
        [FileID] = @FileID,
        [EntityID] = @EntityID,
        [RecordID] = @RecordID,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwFileEntityRecordLinks] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateFileEntityRecordLink] TO [cdp_Developer], [cdp_Integration]
    