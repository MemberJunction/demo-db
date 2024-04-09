-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Organizations
-- Item: spUpdateOrganization
-- Generated: 4/8/2024, 7:45:28 PM
--
-- This was generated by the MemberJunction CodeGen tool.
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
    