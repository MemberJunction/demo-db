-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: User View Runs
-- Item: spCreateUserViewRun
-- Generated: 3/10/2024, 9:38:14 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR UserViewRun
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateUserViewRun]
GO

CREATE PROCEDURE [__mj].[spCreateUserViewRun]
    @UserViewID int,
    @RunAt datetime,
    @RunByUserID int
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [__mj].[UserViewRun]
        (
            [UserViewID],
            [RunAt],
            [RunByUserID]
        )
    VALUES
        (
            @UserViewID,
            @RunAt,
            @RunByUserID
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [__mj].[vwUserViewRuns] WHERE [ID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [__mj].[spCreateUserViewRun] TO [cdp_Developer], [cdp_Integration], [cdp_UI]
