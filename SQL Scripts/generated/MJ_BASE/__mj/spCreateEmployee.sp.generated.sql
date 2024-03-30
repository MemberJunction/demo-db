-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Employees
-- Item: spCreateEmployee
-- Generated: 3/30/2024, 11:48:01 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR Employee
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateEmployee]
GO

CREATE PROCEDURE [__mj].[spCreateEmployee]
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
    
    INSERT INTO 
    [__mj].[Employee]
        (
            [FirstName],
            [LastName],
            [Title],
            [Email],
            [Phone],
            [Active],
            [CompanyID],
            [SupervisorID]
        )
    VALUES
        (
            @FirstName,
            @LastName,
            @Title,
            @Email,
            @Phone,
            @Active,
            @CompanyID,
            @SupervisorID
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [__mj].[vwEmployees] WHERE [ID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [__mj].[spCreateEmployee] TO [cdp_Developer], [cdp_Integration]
