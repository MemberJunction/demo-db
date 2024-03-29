-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Courses
-- Item: spCreateCourse
-- Generated: 3/16/2024, 12:11:22 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR Course
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [education].[spCreateCourse]
GO

CREATE PROCEDURE [education].[spCreateCourse]
    @CourseName nvarchar(255),
    @Description nvarchar(MAX),
    @StartDate date,
    @EndDate date,
    @MemberPrice money,
    @NonMemberPrice money,
    @InstructorID int
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [education].[Course]
        (
            [CourseName],
            [Description],
            [StartDate],
            [EndDate],
            [MemberPrice],
            [NonMemberPrice],
            [InstructorID]
        )
    VALUES
        (
            @CourseName,
            @Description,
            @StartDate,
            @EndDate,
            @MemberPrice,
            @NonMemberPrice,
            @InstructorID
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [education].[vwCourses] WHERE [CourseID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [education].[spCreateCourse] TO [cdp_Developer], [cdp_Integration]
