-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: User Views
-- Item: spDeleteUserView
-- Generated: 3/30/2024, 10:15:23 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- DELETE PROCEDURE FOR UserView
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spDeleteUserView]
GO

CREATE PROCEDURE [__mj].[spDeleteUserView]
    @ID int
AS  
BEGIN
    SET NOCOUNT ON;

    DELETE FROM 
        [__mj].[UserView]
    WHERE 
        [ID] = @ID

    SELECT @ID AS [ID] -- Return the primary key to indicate we successfully deleted the record
END
GO
GRANT EXECUTE ON [__mj].[spDeleteUserView] TO [cdp_Developer], [cdp_Integration], [cdp_UI]