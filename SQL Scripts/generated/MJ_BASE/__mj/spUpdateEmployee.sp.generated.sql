-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Employees
-- Item: spUpdateEmployee
-- Generated: 3/30/2024, 10:15:18 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Employee  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateEmployee]
GO

CREATE PROCEDURE [__mj].[spUpdateEmployee]
    @ID int,
    @FirstName nvarchar(30),
    @LastName nvarchar(50),
    @Title nvarchar(50),
    @Email nvarchar(100),
    @Phone nvarchar(20),
    @Active bit,
    @CompanyID int,
    @SupervisorID int
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[Employee]
    SET 
        [FirstName] = @FirstName,
        [LastName] = @LastName,
        [Title] = @Title,
        [Email] = @Email,
        [Phone] = @Phone,
        [Active] = @Active,
        [CompanyID] = @CompanyID,
        [SupervisorID] = @SupervisorID,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwEmployees] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateEmployee] TO [cdp_Developer], [cdp_Integration]
    