-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Employees
-- Item: spDeleteEmployee
-- Generated: 3/30/2024, 10:15:18 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- DELETE PROCEDURE FOR Employee
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spDeleteEmployee]
GO

CREATE PROCEDURE [__mj].[spDeleteEmployee]
    @ID int
AS  
BEGIN
    SET NOCOUNT ON;

    DELETE FROM 
        [__mj].[Employee]
    WHERE 
        [ID] = @ID

    SELECT @ID AS [ID] -- Return the primary key to indicate we successfully deleted the record
END
GO
GRANT EXECUTE ON [__mj].[spDeleteEmployee] TO [cdp_Developer], [cdp_Integration]
