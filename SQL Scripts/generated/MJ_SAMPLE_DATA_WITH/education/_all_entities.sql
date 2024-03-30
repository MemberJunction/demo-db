-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Companies__education
-- Item: spCreateCompany__education
-- Generated: 3/30/2024, 4:35:05 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR Company
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [education].[spCreateCompany__education]
GO

CREATE PROCEDURE [education].[spCreateCompany__education]
    @CompanyName nvarchar(255),
    @Website nvarchar(255),
    @Industry nvarchar(100),
    @Size nvarchar(50),
    @Address nvarchar(255),
    @City nvarchar(100),
    @State nvarchar(100),
    @ZipCode nvarchar(20),
    @Country nvarchar(100)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [education].[Company]
        (
            [CompanyName],
            [Website],
            [Industry],
            [Size],
            [Address],
            [City],
            [State],
            [ZipCode],
            [Country]
        )
    VALUES
        (
            @CompanyName,
            @Website,
            @Industry,
            @Size,
            @Address,
            @City,
            @State,
            @ZipCode,
            @Country
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [education].[vwCompanies__education] WHERE [CompanyID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [education].[spCreateCompany__education] TO [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Courses
-- Item: spCreateCourse
-- Generated: 3/30/2024, 4:35:05 PM
--
-- This was generated by the MemberJunction CodeGen tool.
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



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Instructors
-- Item: spCreateInstructor
-- Generated: 3/30/2024, 4:35:05 PM
--
-- This was generated by the MemberJunction CodeGen tool.
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



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Registrations
-- Item: spCreateRegistration
-- Generated: 3/30/2024, 4:35:04 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR Registration
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [education].[spCreateRegistration]
GO

CREATE PROCEDURE [education].[spCreateRegistration]
    @CourseID int,
    @StudentID int,
    @RegistrationDate date,
    @RegistrationFee money,
    @PaymentStatus nvarchar(255),
    @CompletionStatus nvarchar(255),
    @CertificationAwarded bit
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [education].[Registration]
        (
            [CourseID],
            [StudentID],
            [RegistrationDate],
            [RegistrationFee],
            [PaymentStatus],
            [CompletionStatus],
            [CertificationAwarded]
        )
    VALUES
        (
            @CourseID,
            @StudentID,
            @RegistrationDate,
            @RegistrationFee,
            @PaymentStatus,
            @CompletionStatus,
            @CertificationAwarded
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [education].[vwRegistrations] WHERE [RegistrationID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [education].[spCreateRegistration] TO [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Students
-- Item: spCreateStudent
-- Generated: 3/30/2024, 4:35:04 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR Student
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [education].[spCreateStudent]
GO

CREATE PROCEDURE [education].[spCreateStudent]
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
    
    INSERT INTO 
    [education].[Student]
        (
            [CompanyID],
            [Email],
            [FirstName],
            [LastName],
            [JobTitle],
            [Address],
            [City],
            [State],
            [ZipCode],
            [Country]
        )
    VALUES
        (
            @CompanyID,
            @Email,
            @FirstName,
            @LastName,
            @JobTitle,
            @Address,
            @City,
            @State,
            @ZipCode,
            @Country
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [education].[vwStudents] WHERE [StudentID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [education].[spCreateStudent] TO [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Companies__education
-- Item: spUpdateCompany__education
-- Generated: 3/30/2024, 4:35:05 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Company  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [education].[spUpdateCompany__education]
GO

CREATE PROCEDURE [education].[spUpdateCompany__education]
    @CompanyID int,
    @CompanyName nvarchar(255),
    @Website nvarchar(255),
    @Industry nvarchar(100),
    @Size nvarchar(50),
    @Address nvarchar(255),
    @City nvarchar(100),
    @State nvarchar(100),
    @ZipCode nvarchar(20),
    @Country nvarchar(100)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [education].[Company]
    SET 
        [CompanyName] = @CompanyName,
        [Website] = @Website,
        [Industry] = @Industry,
        [Size] = @Size,
        [Address] = @Address,
        [City] = @City,
        [State] = @State,
        [ZipCode] = @ZipCode,
        [Country] = @Country
    WHERE 
        [CompanyID] = @CompanyID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [education].[vwCompanies__education] WHERE [CompanyID] = @CompanyID
END
GO
GRANT EXECUTE ON [education].[spUpdateCompany__education] TO [cdp_Developer], [cdp_Integration]
    


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Courses
-- Item: spUpdateCourse
-- Generated: 3/30/2024, 4:35:05 PM
--
-- This was generated by the MemberJunction CodeGen tool.
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
    


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Registrations
-- Item: spUpdateRegistration
-- Generated: 3/30/2024, 4:35:04 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Registration  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [education].[spUpdateRegistration]
GO

CREATE PROCEDURE [education].[spUpdateRegistration]
    @RegistrationID int,
    @CourseID int,
    @StudentID int,
    @RegistrationDate date,
    @RegistrationFee money,
    @PaymentStatus nvarchar(255),
    @CompletionStatus nvarchar(255),
    @CertificationAwarded bit
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [education].[Registration]
    SET 
        [CourseID] = @CourseID,
        [StudentID] = @StudentID,
        [RegistrationDate] = @RegistrationDate,
        [RegistrationFee] = @RegistrationFee,
        [PaymentStatus] = @PaymentStatus,
        [CompletionStatus] = @CompletionStatus,
        [CertificationAwarded] = @CertificationAwarded
    WHERE 
        [RegistrationID] = @RegistrationID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [education].[vwRegistrations] WHERE [RegistrationID] = @RegistrationID
END
GO
GRANT EXECUTE ON [education].[spUpdateRegistration] TO [cdp_Developer], [cdp_Integration]
    


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Students
-- Item: spUpdateStudent
-- Generated: 3/30/2024, 4:35:04 PM
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
    


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Companies__education
-- Item: vwCompanies__education
-- Generated: 3/30/2024, 4:35:05 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Companies__education
-----               SCHEMA:      education
-----               BASE TABLE:  Company
-----               PRIMARY KEY: CompanyID
------------------------------------------------------------
DROP VIEW IF EXISTS [education].[vwCompanies__education]
GO

CREATE VIEW [education].[vwCompanies__education]
AS
SELECT 
    c.*
FROM
    [education].[Company] AS c
GO
GRANT SELECT ON [education].[vwCompanies__education] TO [cdp_UI], [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Courses
-- Item: vwCourses
-- Generated: 3/30/2024, 4:35:05 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Courses
-----               SCHEMA:      education
-----               BASE TABLE:  Course
-----               PRIMARY KEY: CourseID
------------------------------------------------------------
DROP VIEW IF EXISTS [education].[vwCourses]
GO

CREATE VIEW [education].[vwCourses]
AS
SELECT 
    c.*
FROM
    [education].[Course] AS c
GO
GRANT SELECT ON [education].[vwCourses] TO [cdp_UI], [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Instructors
-- Item: vwInstructors
-- Generated: 3/30/2024, 4:35:05 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Instructors
-----               SCHEMA:      education
-----               BASE TABLE:  Instructor
-----               PRIMARY KEY: InstructorID
------------------------------------------------------------
DROP VIEW IF EXISTS [education].[vwInstructors]
GO

CREATE VIEW [education].[vwInstructors]
AS
SELECT 
    i.*
FROM
    [education].[Instructor] AS i
GO
GRANT SELECT ON [education].[vwInstructors] TO [cdp_UI], [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Registrations
-- Item: vwRegistrations
-- Generated: 3/30/2024, 4:35:04 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Registrations
-----               SCHEMA:      education
-----               BASE TABLE:  Registration
-----               PRIMARY KEY: RegistrationID
------------------------------------------------------------
DROP VIEW IF EXISTS [education].[vwRegistrations]
GO

CREATE VIEW [education].[vwRegistrations]
AS
SELECT 
    r.*
FROM
    [education].[Registration] AS r
GO
GRANT SELECT ON [education].[vwRegistrations] TO [cdp_UI], [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Students
-- Item: vwStudents
-- Generated: 3/30/2024, 4:35:04 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Students
-----               SCHEMA:      education
-----               BASE TABLE:  Student
-----               PRIMARY KEY: StudentID
------------------------------------------------------------
DROP VIEW IF EXISTS [education].[vwStudents]
GO

CREATE VIEW [education].[vwStudents]
AS
SELECT 
    s.*
FROM
    [education].[Student] AS s
GO
GRANT SELECT ON [education].[vwStudents] TO [cdp_UI], [cdp_Developer], [cdp_Integration]




GRANT EXECUTE ON [education].[spCreateCompany__education] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [education].[spCreateCourse] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [education].[spCreateInstructor] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [education].[spCreateRegistration] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [education].[spCreateStudent] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [education].[spUpdateCompany__education] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [education].[spUpdateCourse] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [education].[spUpdateInstructor] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [education].[spUpdateRegistration] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [education].[spUpdateStudent] TO [cdp_Developer], [cdp_Integration]




-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Companies__education
-- Item: Permissions for vwCompanies__education
-- Generated: 3/30/2024, 4:35:05 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [education].[vwCompanies__education] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Courses
-- Item: Permissions for vwCourses
-- Generated: 3/30/2024, 4:35:05 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [education].[vwCourses] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Instructors
-- Item: Permissions for vwInstructors
-- Generated: 3/30/2024, 4:35:05 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [education].[vwInstructors] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Registrations
-- Item: Permissions for vwRegistrations
-- Generated: 3/30/2024, 4:35:04 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [education].[vwRegistrations] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Students
-- Item: Permissions for vwStudents
-- Generated: 3/30/2024, 4:35:04 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [education].[vwStudents] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


