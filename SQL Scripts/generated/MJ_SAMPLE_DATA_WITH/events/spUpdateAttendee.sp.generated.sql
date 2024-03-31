-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Attendees
-- Item: spUpdateAttendee
-- Generated: 3/31/2024, 11:57:30 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Attendee  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [events].[spUpdateAttendee]
GO

CREATE PROCEDURE [events].[spUpdateAttendee]
    @AttendeeID int,
    @OrganizationID int,
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
        [events].[Attendee]
    SET 
        [OrganizationID] = @OrganizationID,
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
        [AttendeeID] = @AttendeeID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [events].[vwAttendees] WHERE [AttendeeID] = @AttendeeID
END
GO
GRANT EXECUTE ON [events].[spUpdateAttendee] TO [cdp_Developer], [cdp_Integration]
    