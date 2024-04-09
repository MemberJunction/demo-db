-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Organization Links
-- Item: spUpdateOrganizationLink
-- Generated: 4/8/2024, 8:01:19 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR OrganizationLink  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [common].[spUpdateOrganizationLink]
GO

CREATE PROCEDURE [common].[spUpdateOrganizationLink]
    @OrganizationLinkID int,
    @MembershipCompanyID int,
    @EventsOrganizationID int,
    @EducationCompanyID int,
    @CommunityCompanyID int
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [common].[OrganizationLink]
    SET 
        [MembershipCompanyID] = @MembershipCompanyID,
        [EventsOrganizationID] = @EventsOrganizationID,
        [EducationCompanyID] = @EducationCompanyID,
        [CommunityCompanyID] = @CommunityCompanyID,
        [UpdatedAt] = GETDATE()
    WHERE 
        [OrganizationLinkID] = @OrganizationLinkID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [common].[vwOrganizationLinks] WHERE [OrganizationLinkID] = @OrganizationLinkID
END
GO
GRANT EXECUTE ON [common].[spUpdateOrganizationLink] TO [cdp_Developer], [cdp_Integration]
    