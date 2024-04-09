-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Membership Renewals
-- Item: spUpdateMembershipRenewal
-- Generated: 4/8/2024, 7:45:31 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR MembershipRenewal  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [membership].[spUpdateMembershipRenewal]
GO

CREATE PROCEDURE [membership].[spUpdateMembershipRenewal]
    @RenewalID int,
    @MemberID int,
    @RenewalDate date,
    @PaymentAmount money,
    @PaymentStatus nvarchar(255)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [membership].[MembershipRenewal]
    SET 
        [MemberID] = @MemberID,
        [RenewalDate] = @RenewalDate,
        [PaymentAmount] = @PaymentAmount,
        [PaymentStatus] = @PaymentStatus
    WHERE 
        [RenewalID] = @RenewalID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [membership].[vwMembershipRenewals] WHERE [RenewalID] = @RenewalID
END
GO
GRANT EXECUTE ON [membership].[spUpdateMembershipRenewal] TO [cdp_Developer], [cdp_Integration]
    