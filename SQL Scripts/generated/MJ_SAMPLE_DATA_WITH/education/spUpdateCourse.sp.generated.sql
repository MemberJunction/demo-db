-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Courses
-- Item: spUpdateCourse
-- Generated: 3/16/2024, 12:11:22 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Course  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [education].[spUpdateCourse]
GO

CREATE PROCEDURE [education].[spUpdateCourse]
    @CourseID int,
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
    UPDATE 
        [education].[Course]
    SET 
        [CourseName] = @CourseName,
        [Description] = @Description,
        [StartDate] = @StartDate,
        [EndDate] = @EndDate,
        [MemberPrice] = @MemberPrice,
        [NonMemberPrice] = @NonMemberPrice,
        [InstructorID] = @InstructorID
    WHERE 
        [CourseID] = @CourseID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [education].[vwCourses] WHERE [CourseID] = @CourseID
END
GO
GRANT EXECUTE ON [education].[spUpdateCourse] TO [cdp_Developer], [cdp_Integration]
    