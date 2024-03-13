-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: User View Runs
-- Item: spUpdateUserViewRun
-- Generated: 3/10/2024, 9:38:14 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR UserViewRun  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateUserViewRun]
GO

CREATE PROCEDURE [__mj].[spUpdateUserViewRun]
    @ID int,
    @UserViewID int,
    @RunAt datetime,
    @RunByUserID int
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[UserViewRun]
    SET 
        [UserViewID] = @UserViewID,
        [RunAt] = @RunAt,
        [RunByUserID] = @RunByUserID
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwUserViewRuns] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateUserViewRun] TO [cdp_Developer], [cdp_Integration]
    