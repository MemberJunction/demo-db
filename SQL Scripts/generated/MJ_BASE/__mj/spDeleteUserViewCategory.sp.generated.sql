-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: User View Categories
-- Item: spDeleteUserViewCategory
-- Generated: 3/30/2024, 10:15:36 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- DELETE PROCEDURE FOR UserViewCategory
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spDeleteUserViewCategory]
GO

CREATE PROCEDURE [__mj].[spDeleteUserViewCategory]
    @ID int
AS  
BEGIN
    SET NOCOUNT ON;

    DELETE FROM 
        [__mj].[UserViewCategory]
    WHERE 
        [ID] = @ID

    SELECT @ID AS [ID] -- Return the primary key to indicate we successfully deleted the record
END
GO
GRANT EXECUTE ON [__mj].[spDeleteUserViewCategory] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
