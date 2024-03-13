-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Instructors
-- Item: spCreateInstructor
-- Generated: 3/12/2024, 11:32:32 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR Instructor
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [education].[spCreateInstructor]
GO

CREATE PROCEDURE [education].[spCreateInstructor]
    @FirstName nvarchar(50),
    @LastName nvarchar(50),
    @Email nvarchar(100),
    @Bio nvarchar(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [education].[Instructor]
        (
            [FirstName],
            [LastName],
            [Email],
            [Bio]
        )
    VALUES
        (
            @FirstName,
            @LastName,
            @Email,
            @Bio
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [education].[vwInstructors] WHERE [InstructorID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [education].[spCreateInstructor] TO [cdp_Developer], [cdp_Integration]
