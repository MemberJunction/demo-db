-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: User Applications
-- Item: spDeleteUserApplication
-- Generated: 3/30/2024, 10:15:24 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- DELETE PROCEDURE FOR UserApplication
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spDeleteUserApplication]
GO

CREATE PROCEDURE [__mj].[spDeleteUserApplication]
    @ID int
AS  
BEGIN
    SET NOCOUNT ON;

    DELETE FROM 
        [__mj].[UserApplication]
    WHERE 
        [ID] = @ID

    SELECT @ID AS [ID] -- Return the primary key to indicate we successfully deleted the record
END
GO
GRANT EXECUTE ON [__mj].[spDeleteUserApplication] TO [cdp_Developer], [cdp_Integration]