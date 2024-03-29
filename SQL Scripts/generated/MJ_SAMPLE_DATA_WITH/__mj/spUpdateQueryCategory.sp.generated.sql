-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Query Categories
-- Item: spUpdateQueryCategory
-- Generated: 3/10/2024, 9:38:23 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR QueryCategory  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateQueryCategory]
GO

CREATE PROCEDURE [__mj].[spUpdateQueryCategory]
    @ID int,
    @Name nvarchar(50),
    @ParentID int,
    @Description nvarchar(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[QueryCategory]
    SET 
        [Name] = @Name,
        [ParentID] = @ParentID,
        [Description] = @Description,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwQueryCategories] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateQueryCategory] TO [cdp_Developer], [cdp_Integration]
    