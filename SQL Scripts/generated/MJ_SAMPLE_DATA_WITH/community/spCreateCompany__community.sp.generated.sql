-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Companies__community
-- Item: spCreateCompany__community
-- Generated: 4/5/2024, 6:36:50 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR Company
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [community].[spCreateCompany__community]
GO

CREATE PROCEDURE [community].[spCreateCompany__community]
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
    
    INSERT INTO 
    [community].[Company]
        (
            [CompanyName],
            [Website],
            [Industry],
            [Size],
            [Address],
            [City],
            [State],
            [ZipCode],
            [Country]
        )
    VALUES
        (
            @CompanyName,
            @Website,
            @Industry,
            @Size,
            @Address,
            @City,
            @State,
            @ZipCode,
            @Country
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [community].[vwCompanies__community] WHERE [CompanyID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [community].[spCreateCompany__community] TO [cdp_Developer], [cdp_Integration]
