-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Companies__membership
-- Item: spUpdateCompany__membership
-- Generated: 3/31/2024, 11:57:32 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Company  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [membership].[spUpdateCompany__membership]
GO

CREATE PROCEDURE [membership].[spUpdateCompany__membership]
    @CompanyID int,
    @CompanyName nvarchar(255),
    @Website nvarchar(255),
    @Industry nvarchar(100),
    @Size nvarchar(50),
    @Address nvarchar(255),
    @City nvarchar(100),
    @State nvarchar(100),
    @ZipCode nvarchar(20),
    @Country nvarchar(100),
    @TaxID nvarchar(100),
    @Subsection int,
    @TotalRevenue money,
    @InformationTechnologyExpense money
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [membership].[Company]
    SET 
        [CompanyName] = @CompanyName,
        [Website] = @Website,
        [Industry] = @Industry,
        [Size] = @Size,
        [Address] = @Address,
        [City] = @City,
        [State] = @State,
        [ZipCode] = @ZipCode,
        [Country] = @Country,
        [TaxID] = @TaxID,
        [Subsection] = @Subsection,
        [TotalRevenue] = @TotalRevenue,
        [InformationTechnologyExpense] = @InformationTechnologyExpense
    WHERE 
        [CompanyID] = @CompanyID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [membership].[vwCompanies__membership] WHERE [CompanyID] = @CompanyID
END
GO
GRANT EXECUTE ON [membership].[spUpdateCompany__membership] TO [cdp_Developer], [cdp_Integration]
    