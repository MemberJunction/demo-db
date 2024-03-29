-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Employees
-- Item: spDeleteEmployee
-- Generated: 3/10/2024, 9:38:08 AM
--
-- This was generated by the Entity Generator.
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
