-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Registrations__events
-- Item: spCreateRegistration__events
-- Generated: 4/8/2024, 8:01:18 PM
--
-- This was generated by the MemberJunction CodeGen tool.
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
