-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Attendees
-- Item: spCreateAttendee
-- Generated: 3/16/2024, 12:11:21 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR Attendee
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [events].[spCreateAttendee]
GO

CREATE PROCEDURE [events].[spCreateAttendee]
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
    
    INSERT INTO 
    [events].[Attendee]
        (
            [OrganizationID],
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
            @OrganizationID,
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
    SELECT * FROM [events].[vwAttendees] WHERE [AttendeeID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [events].[spCreateAttendee] TO [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Events
-- Item: spCreateEvent
-- Generated: 3/16/2024, 12:11:21 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR Event
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [events].[spCreateEvent]
GO

CREATE PROCEDURE [events].[spCreateEvent]
    @EventName nvarchar(255),
    @Location nvarchar(255),
    @Description nvarchar(MAX),
    @StartDate date,
    @EndDate date,
    @Address nvarchar(255),
    @City nvarchar(100),
    @State nvarchar(100),
    @Zip nvarchar(20),
    @Country nvarchar(100),
    @EventType nvarchar(20),
    @MemberPrice money,
    @NonMemberPrice money,
    @SpeakerPrice money
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [events].[Event]
        (
            [EventName],
            [Location],
            [Description],
            [StartDate],
            [EndDate],
            [Address],
            [City],
            [State],
            [Zip],
            [Country],
            [EventType],
            [MemberPrice],
            [NonMemberPrice],
            [SpeakerPrice]
        )
    VALUES
        (
            @EventName,
            @Location,
            @Description,
            @StartDate,
            @EndDate,
            @Address,
            @City,
            @State,
            @Zip,
            @Country,
            @EventType,
            @MemberPrice,
            @NonMemberPrice,
            @SpeakerPrice
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [events].[vwEvents] WHERE [EventID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [events].[spCreateEvent] TO [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Organizations
-- Item: spCreateOrganization
-- Generated: 3/16/2024, 12:11:20 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR Organization
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [events].[spCreateOrganization]
GO

CREATE PROCEDURE [events].[spCreateOrganization]
    @OrganizationName nvarchar(255),
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
    [events].[Organization]
        (
            [OrganizationName],
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
            @OrganizationName,
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
    SELECT * FROM [events].[vwOrganizations] WHERE [OrganizationID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [events].[spCreateOrganization] TO [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Registrations__events
-- Item: spCreateRegistration__events
-- Generated: 3/16/2024, 12:11:21 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR Registration
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [events].[spCreateRegistration__events]
GO

CREATE PROCEDURE [events].[spCreateRegistration__events]
    @EventID int,
    @AttendeeID int,
    @RegistrationDate date,
    @RegistrationFee money,
    @PaymentStatus nvarchar(255),
    @Status nvarchar(255),
    @RegistrationType nvarchar(20)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [events].[Registration]
        (
            [EventID],
            [AttendeeID],
            [RegistrationDate],
            [RegistrationFee],
            [PaymentStatus],
            [Status],
            [RegistrationType]
        )
    VALUES
        (
            @EventID,
            @AttendeeID,
            @RegistrationDate,
            @RegistrationFee,
            @PaymentStatus,
            @Status,
            @RegistrationType
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [events].[vwRegistrations__events] WHERE [RegistrationID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [events].[spCreateRegistration__events] TO [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Attendees
-- Item: spUpdateAttendee
-- Generated: 3/16/2024, 12:11:21 PM
--
-- This was generated by the Entity Generator.
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
    


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Events
-- Item: spUpdateEvent
-- Generated: 3/16/2024, 12:11:21 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Event  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [events].[spUpdateEvent]
GO

CREATE PROCEDURE [events].[spUpdateEvent]
    @EventID int,
    @EventName nvarchar(255),
    @Location nvarchar(255),
    @Description nvarchar(MAX),
    @StartDate date,
    @EndDate date,
    @Address nvarchar(255),
    @City nvarchar(100),
    @State nvarchar(100),
    @Zip nvarchar(20),
    @Country nvarchar(100),
    @EventType nvarchar(20),
    @MemberPrice money,
    @NonMemberPrice money,
    @SpeakerPrice money
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [events].[Event]
    SET 
        [EventName] = @EventName,
        [Location] = @Location,
        [Description] = @Description,
        [StartDate] = @StartDate,
        [EndDate] = @EndDate,
        [Address] = @Address,
        [City] = @City,
        [State] = @State,
        [Zip] = @Zip,
        [Country] = @Country,
        [EventType] = @EventType,
        [MemberPrice] = @MemberPrice,
        [NonMemberPrice] = @NonMemberPrice,
        [SpeakerPrice] = @SpeakerPrice
    WHERE 
        [EventID] = @EventID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [events].[vwEvents] WHERE [EventID] = @EventID
END
GO
GRANT EXECUTE ON [events].[spUpdateEvent] TO [cdp_Developer], [cdp_Integration]
    


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Organizations
-- Item: spUpdateOrganization
-- Generated: 3/16/2024, 12:11:20 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Organization  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [events].[spUpdateOrganization]
GO

CREATE PROCEDURE [events].[spUpdateOrganization]
    @OrganizationID int,
    @OrganizationName nvarchar(255),
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
        [events].[Organization]
    SET 
        [OrganizationName] = @OrganizationName,
        [Website] = @Website,
        [Industry] = @Industry,
        [Size] = @Size,
        [Address] = @Address,
        [City] = @City,
        [State] = @State,
        [ZipCode] = @ZipCode,
        [Country] = @Country
    WHERE 
        [OrganizationID] = @OrganizationID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [events].[vwOrganizations] WHERE [OrganizationID] = @OrganizationID
END
GO
GRANT EXECUTE ON [events].[spUpdateOrganization] TO [cdp_Developer], [cdp_Integration]
    


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Registrations__events
-- Item: spUpdateRegistration__events
-- Generated: 3/16/2024, 12:11:21 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Registration  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [events].[spUpdateRegistration__events]
GO

CREATE PROCEDURE [events].[spUpdateRegistration__events]
    @RegistrationID int,
    @EventID int,
    @AttendeeID int,
    @RegistrationDate date,
    @RegistrationFee money,
    @PaymentStatus nvarchar(255),
    @Status nvarchar(255),
    @RegistrationType nvarchar(20)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [events].[Registration]
    SET 
        [EventID] = @EventID,
        [AttendeeID] = @AttendeeID,
        [RegistrationDate] = @RegistrationDate,
        [RegistrationFee] = @RegistrationFee,
        [PaymentStatus] = @PaymentStatus,
        [Status] = @Status,
        [RegistrationType] = @RegistrationType
    WHERE 
        [RegistrationID] = @RegistrationID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [events].[vwRegistrations__events] WHERE [RegistrationID] = @RegistrationID
END
GO
GRANT EXECUTE ON [events].[spUpdateRegistration__events] TO [cdp_Developer], [cdp_Integration]
    


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Attendees
-- Item: vwAttendees
-- Generated: 3/16/2024, 12:11:21 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Attendees
-----               SCHEMA:      events
-----               BASE TABLE:  Attendee
-----               PRIMARY KEY: AttendeeID
------------------------------------------------------------
DROP VIEW IF EXISTS [events].[vwAttendees]
GO

CREATE VIEW [events].[vwAttendees]
AS
SELECT 
    a.*
FROM
    [events].[Attendee] AS a
GO
GRANT SELECT ON [events].[vwAttendees] TO [cdp_UI], [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Events
-- Item: vwEvents
-- Generated: 3/16/2024, 12:11:21 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Events
-----               SCHEMA:      events
-----               BASE TABLE:  Event
-----               PRIMARY KEY: EventID
------------------------------------------------------------
DROP VIEW IF EXISTS [events].[vwEvents]
GO

CREATE VIEW [events].[vwEvents]
AS
SELECT 
    e.*
FROM
    [events].[Event] AS e
GO
GRANT SELECT ON [events].[vwEvents] TO [cdp_UI], [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Organizations
-- Item: vwOrganizations
-- Generated: 3/16/2024, 12:11:20 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Organizations
-----               SCHEMA:      events
-----               BASE TABLE:  Organization
-----               PRIMARY KEY: OrganizationID
------------------------------------------------------------
DROP VIEW IF EXISTS [events].[vwOrganizations]
GO

CREATE VIEW [events].[vwOrganizations]
AS
SELECT 
    o.*
FROM
    [events].[Organization] AS o
GO
GRANT SELECT ON [events].[vwOrganizations] TO [cdp_UI], [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Registrations__events
-- Item: vwRegistrations__events
-- Generated: 3/16/2024, 12:11:21 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Registrations__events
-----               SCHEMA:      events
-----               BASE TABLE:  Registration
-----               PRIMARY KEY: RegistrationID
------------------------------------------------------------
DROP VIEW IF EXISTS [events].[vwRegistrations__events]
GO

CREATE VIEW [events].[vwRegistrations__events]
AS
SELECT 
    r.*
FROM
    [events].[Registration] AS r
GO
GRANT SELECT ON [events].[vwRegistrations__events] TO [cdp_UI], [cdp_Developer], [cdp_Integration]




GRANT EXECUTE ON [events].[spCreateAttendee] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [events].[spCreateEvent] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [events].[spCreateOrganization] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [events].[spCreateRegistration__events] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [events].[spUpdateAttendee] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [events].[spUpdateEvent] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [events].[spUpdateOrganization] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [events].[spUpdateRegistration__events] TO [cdp_Developer], [cdp_Integration]




-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Attendees
-- Item: Permissions for vwAttendees
-- Generated: 3/16/2024, 12:11:21 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [events].[vwAttendees] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Events
-- Item: Permissions for vwEvents
-- Generated: 3/16/2024, 12:11:21 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [events].[vwEvents] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Organizations
-- Item: Permissions for vwOrganizations
-- Generated: 3/16/2024, 12:11:20 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [events].[vwOrganizations] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Registrations__events
-- Item: Permissions for vwRegistrations__events
-- Generated: 3/16/2024, 12:11:21 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [events].[vwRegistrations__events] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


