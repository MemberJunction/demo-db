-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Employee Company Integrations
-- Item: spUpdateEmployeeCompanyIntegration
-- Generated: 3/10/2024, 9:38:08 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR EmployeeCompanyIntegration  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateEmployeeCompanyIntegration]
GO

CREATE PROCEDURE [__mj].[spUpdateEmployeeCompanyIntegration]
    @ID int,
    @EmployeeID int,
    @CompanyIntegrationID int,
    @ExternalSystemRecordID nvarchar(100),
    @IsActive bit
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[EmployeeCompanyIntegration]
    SET 
        [EmployeeID] = @EmployeeID,
        [CompanyIntegrationID] = @CompanyIntegrationID,
        [ExternalSystemRecordID] = @ExternalSystemRecordID,
        [IsActive] = @IsActive,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwEmployeeCompanyIntegrations] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateEmployeeCompanyIntegration] TO [cdp_Developer], [cdp_Integration]
    