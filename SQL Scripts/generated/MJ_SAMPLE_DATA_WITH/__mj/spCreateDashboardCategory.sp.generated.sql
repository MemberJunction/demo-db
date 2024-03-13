-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Dashboard Categories
-- Item: spCreateDashboardCategory
-- Generated: 3/10/2024, 9:38:24 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR DashboardCategory
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateDashboardCategory]
GO

CREATE PROCEDURE [__mj].[spCreateDashboardCategory]
    @ID int,
    @Name nvarchar(100),
    @Description nvarchar(MAX),
    @ParentID int
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [__mj].[DashboardCategory]
        (
            [Name],
            [Description],
            [ParentID]
        )
    VALUES
        (
            @Name,
            @Description,
            @ParentID
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [__mj].[vwDashboardCategories] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spCreateDashboardCategory] TO [cdp_Developer], [cdp_Integration]
