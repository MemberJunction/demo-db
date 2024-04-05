-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Students
-- Item: spUpdateStudent
-- Generated: 4/5/2024, 6:36:54 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Student  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [education].[spUpdateStudent]
GO

CREATE PROCEDURE [education].[spUpdateStudent]
    @StudentID int,
    @CompanyID int,
    @Email nvarchar(255),
    @FirstName nvarchar(50),
    @LastName nvarchar(50),
    @JobTitle nvarchar(100),
    @Address nvarchar(255),
    @City nvarchar(100),
    @State nvarchar(100),
    @ZipCode nvarchar(20),
    @Country nvarchar(100)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [education].[Student]
    SET 
        [CompanyID] = @CompanyID,
        [Email] = @Email,
        [FirstName] = @FirstName,
        [LastName] = @LastName,
        [JobTitle] = @JobTitle,
        [Address] = @Address,
        [City] = @City,
        [State] = @State,
        [ZipCode] = @ZipCode,
        [Country] = @Country
    WHERE 
        [StudentID] = @StudentID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [education].[vwStudents] WHERE [StudentID] = @StudentID
END
GO
GRANT EXECUTE ON [education].[spUpdateStudent] TO [cdp_Developer], [cdp_Integration]
    