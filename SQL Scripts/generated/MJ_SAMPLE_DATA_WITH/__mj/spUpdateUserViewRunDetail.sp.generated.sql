-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: User View Run Details
-- Item: spUpdateUserViewRunDetail
-- Generated: 3/10/2024, 9:38:14 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR UserViewRunDetail  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateUserViewRunDetail]
GO

CREATE PROCEDURE [__mj].[spUpdateUserViewRunDetail]
    @ID int,
    @UserViewRunID int,
    @RecordID nvarchar(255)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[UserViewRunDetail]
    SET 
        [UserViewRunID] = @UserViewRunID,
        [RecordID] = @RecordID
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwUserViewRunDetails] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateUserViewRunDetail] TO [cdp_Developer], [cdp_Integration]
    