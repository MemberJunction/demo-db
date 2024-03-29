-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Name Seeds
-- Item: spUpdateNameSeed
-- Generated: 3/16/2024, 12:11:20 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR NameSeed  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [reference].[spUpdateNameSeed]
GO

CREATE PROCEDURE [reference].[spUpdateNameSeed]
    @NameID int,
    @Name nvarchar(50),
    @NameType nvarchar(10)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [reference].[NameSeed]
    SET 
        [Name] = @Name,
        [NameType] = @NameType
    WHERE 
        [NameID] = @NameID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [reference].[vwNameSeeds] WHERE [NameID] = @NameID
END
GO
GRANT EXECUTE ON [reference].[spUpdateNameSeed] TO [cdp_Developer], [cdp_Integration]
    