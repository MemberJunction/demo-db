-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Membership Renewals
-- Item: spCreateMembershipRenewal
-- Generated: 4/8/2024, 8:01:20 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR MembershipRenewal
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [membership].[spCreateMembershipRenewal]
GO

CREATE PROCEDURE [membership].[spCreateMembershipRenewal]
    @MemberID int,
    @RenewalDate date,
    @PaymentAmount money,
    @PaymentStatus nvarchar(255)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [membership].[MembershipRenewal]
        (
            [MemberID],
            [RenewalDate],
            [PaymentAmount],
            [PaymentStatus]
        )
    VALUES
        (
            @MemberID,
            @RenewalDate,
            @PaymentAmount,
            @PaymentStatus
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [membership].[vwMembershipRenewals] WHERE [RenewalID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [membership].[spCreateMembershipRenewal] TO [cdp_Developer], [cdp_Integration]
