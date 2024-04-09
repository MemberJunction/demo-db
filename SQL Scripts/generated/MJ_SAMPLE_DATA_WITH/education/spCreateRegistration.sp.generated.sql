-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Registrations
-- Item: spCreateRegistration
-- Generated: 4/8/2024, 8:01:18 PM
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
