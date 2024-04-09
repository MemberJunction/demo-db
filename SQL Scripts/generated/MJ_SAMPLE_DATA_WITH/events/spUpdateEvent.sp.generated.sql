-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Events
-- Item: spUpdateEvent
-- Generated: 4/8/2024, 8:01:18 PM
--
-- This was generated by the MemberJunction CodeGen tool.
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
    