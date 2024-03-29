-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Name Seeds
-- Item: spCreateNameSeed
-- Generated: 3/16/2024, 12:11:20 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR NameSeed
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [reference].[spCreateNameSeed]
GO

CREATE PROCEDURE [reference].[spCreateNameSeed]
    @Name nvarchar(50),
    @NameType nvarchar(10)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [reference].[NameSeed]
        (
            [Name],
            [NameType]
        )
    VALUES
        (
            @Name,
            @NameType
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [reference].[vwNameSeeds] WHERE [NameID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [reference].[spCreateNameSeed] TO [cdp_Developer], [cdp_Integration]
