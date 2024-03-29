-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Employee Roles
-- Item: spUpdateEmployeeRole
-- Generated: 3/10/2024, 9:38:08 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR EmployeeRole  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateEmployeeRole]
GO

CREATE PROCEDURE [__mj].[spUpdateEmployeeRole]
    @ID int,
    @EmployeeID int,
    @RoleID int
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[EmployeeRole]
    SET 
        [EmployeeID] = @EmployeeID,
        [RoleID] = @RoleID,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwEmployeeRoles] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateEmployeeRole] TO [cdp_Developer], [cdp_Integration]
    