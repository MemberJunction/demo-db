-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Instructors
-- Item: spUpdateInstructor
-- Generated: 3/30/2024, 4:35:05 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Instructor  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [education].[spUpdateInstructor]
GO

CREATE PROCEDURE [education].[spUpdateInstructor]
    @InstructorID int,
    @FirstName nvarchar(50),
    @LastName nvarchar(50),
    @Email nvarchar(100),
    @Bio nvarchar(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [education].[Instructor]
    SET 
        [FirstName] = @FirstName,
        [LastName] = @LastName,
        [Email] = @Email,
        [Bio] = @Bio
    WHERE 
        [InstructorID] = @InstructorID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [education].[vwInstructors] WHERE [InstructorID] = @InstructorID
END
GO
GRANT EXECUTE ON [education].[spUpdateInstructor] TO [cdp_Developer], [cdp_Integration]
    