-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Job Title Seeds
-- Item: spUpdateJobTitleSeed
-- Generated: 4/8/2024, 7:45:28 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR JobTitleSeed  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [reference].[spUpdateJobTitleSeed]
GO

CREATE PROCEDURE [reference].[spUpdateJobTitleSeed]
    @JobTitleID int,
    @JobTitle nvarchar(100)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [reference].[JobTitleSeed]
    SET 
        [JobTitle] = @JobTitle
    WHERE 
        [JobTitleID] = @JobTitleID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [reference].[vwJobTitleSeeds] WHERE [JobTitleID] = @JobTitleID
END
GO
GRANT EXECUTE ON [reference].[spUpdateJobTitleSeed] TO [cdp_Developer], [cdp_Integration]
    