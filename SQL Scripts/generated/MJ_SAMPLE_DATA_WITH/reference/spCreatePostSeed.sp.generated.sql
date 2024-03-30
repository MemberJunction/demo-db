-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Post Seeds
-- Item: spCreatePostSeed
-- Generated: 3/30/2024, 4:35:03 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR PostSeed
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [reference].[spCreatePostSeed]
GO

CREATE PROCEDURE [reference].[spCreatePostSeed]
    @Content nvarchar(MAX),
    @Type nvarchar(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [reference].[PostSeed]
        (
            [Content],
            [Type]
        )
    VALUES
        (
            @Content,
            @Type
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [reference].[vwPostSeeds] WHERE [PostSeedID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [reference].[spCreatePostSeed] TO [cdp_Developer], [cdp_Integration]
