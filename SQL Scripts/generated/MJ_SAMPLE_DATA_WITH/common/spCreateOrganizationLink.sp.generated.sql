-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Organization Links
-- Item: spCreateOrganizationLink
-- Generated: 4/8/2024, 8:01:19 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR OrganizationLink
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [common].[spCreateOrganizationLink]
GO

CREATE PROCEDURE [common].[spCreateOrganizationLink]
    @MembershipCompanyID int,
    @EventsOrganizationID int,
    @EducationCompanyID int,
    @CommunityCompanyID int
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [common].[OrganizationLink]
        (
            [MembershipCompanyID],
            [EventsOrganizationID],
            [EducationCompanyID],
            [CommunityCompanyID]
        )
    VALUES
        (
            @MembershipCompanyID,
            @EventsOrganizationID,
            @EducationCompanyID,
            @CommunityCompanyID
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [common].[vwOrganizationLinks] WHERE [OrganizationLinkID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [common].[spCreateOrganizationLink] TO [cdp_Developer], [cdp_Integration]
