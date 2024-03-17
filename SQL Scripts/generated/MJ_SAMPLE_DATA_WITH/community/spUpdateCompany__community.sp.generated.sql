-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Companies__community
-- Item: spUpdateCompany__community
-- Generated: 3/16/2024, 12:11:17 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Company  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [community].[spUpdateCompany__community]
GO

CREATE PROCEDURE [community].[spUpdateCompany__community]
    @CompanyID int,
    @CompanyName nvarchar(255),
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
        [community].[Company]
    SET 
        [CompanyName] = @CompanyName,
        [Website] = @Website,
        [Industry] = @Industry,
        [Size] = @Size,
        [Address] = @Address,
        [City] = @City,
        [State] = @State,
        [ZipCode] = @ZipCode,
        [Country] = @Country
    WHERE 
        [CompanyID] = @CompanyID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [community].[vwCompanies__community] WHERE [CompanyID] = @CompanyID
END
GO
GRANT EXECUTE ON [community].[spUpdateCompany__community] TO [cdp_Developer], [cdp_Integration]
    