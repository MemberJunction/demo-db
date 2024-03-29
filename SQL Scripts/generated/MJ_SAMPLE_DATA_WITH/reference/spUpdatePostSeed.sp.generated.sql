-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Post Seeds
-- Item: spUpdatePostSeed
-- Generated: 3/16/2024, 12:11:20 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR PostSeed  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [reference].[spUpdatePostSeed]
GO

CREATE PROCEDURE [reference].[spUpdatePostSeed]
    @PostSeedID int,
    @Content nvarchar(MAX),
    @Type nvarchar(50)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [reference].[PostSeed]
    SET 
        [Content] = @Content,
        [Type] = @Type
    WHERE 
        [PostSeedID] = @PostSeedID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [reference].[vwPostSeeds] WHERE [PostSeedID] = @PostSeedID
END
GO
GRANT EXECUTE ON [reference].[spUpdatePostSeed] TO [cdp_Developer], [cdp_Integration]
    