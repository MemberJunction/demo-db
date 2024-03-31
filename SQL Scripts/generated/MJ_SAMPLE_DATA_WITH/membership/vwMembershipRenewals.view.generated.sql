-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Membership Renewals
-- Item: vwMembershipRenewals
-- Generated: 3/31/2024, 11:57:32 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Membership Renewals
-----               SCHEMA:      membership
-----               BASE TABLE:  MembershipRenewal
-----               PRIMARY KEY: RenewalID
------------------------------------------------------------
DROP VIEW IF EXISTS [membership].[vwMembershipRenewals]
GO

CREATE VIEW [membership].[vwMembershipRenewals]
AS
SELECT 
    m.*
FROM
    [membership].[MembershipRenewal] AS m
GO
GRANT SELECT ON [membership].[vwMembershipRenewals] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
