-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Companies__education
-- Item: spUpdateCompany__education
-- Generated: 3/31/2024, 11:57:31 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Company  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [education].[spUpdateCompany__education]
GO

CREATE PROCEDURE [education].[spUpdateCompany__education]
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
        [education].[Company]
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
    SELECT * FROM [education].[vwCompanies__education] WHERE [CompanyID] = @CompanyID
END
GO
GRANT EXECUTE ON [education].[spUpdateCompany__education] TO [cdp_Developer], [cdp_Integration]
    