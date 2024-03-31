-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Events
-- Item: spCreateEvent
-- Generated: 3/31/2024, 11:57:30 AM
--
-- This was generated by the MemberJunction CodeGen tool.
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
