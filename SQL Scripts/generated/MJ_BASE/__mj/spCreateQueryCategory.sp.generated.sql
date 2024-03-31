-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Query Categories
-- Item: spCreateQueryCategory
-- Generated: 3/30/2024, 10:15:34 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR QueryCategory
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateQueryCategory]
GO

CREATE PROCEDURE [__mj].[spCreateQueryCategory]
    @Name nvarchar(50),
    @ParentID int,
    @Description nvarchar(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [__mj].[QueryCategory]
        (
            [Name],
            [ParentID],
            [Description]
        )
    VALUES
        (
            @Name,
            @ParentID,
            @Description
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [__mj].[vwQueryCategories] WHERE [ID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [__mj].[spCreateQueryCategory] TO [cdp_Developer], [cdp_Integration]
