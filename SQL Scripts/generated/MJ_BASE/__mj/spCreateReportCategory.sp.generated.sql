-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Report Categories
-- Item: spCreateReportCategory
-- Generated: 3/30/2024, 10:15:36 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR ReportCategory
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateReportCategory]
GO

CREATE PROCEDURE [__mj].[spCreateReportCategory]
    @Name nvarchar(100),
    @Description nvarchar(MAX),
    @ParentID int
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [__mj].[ReportCategory]
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
    SELECT * FROM [__mj].[vwReportCategories] WHERE [ID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [__mj].[spCreateReportCategory] TO [cdp_Developer], [cdp_Integration]
