-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: User Favorites
-- Item: spDeleteUserFavorite
-- Generated: 3/30/2024, 11:48:01 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- DELETE PROCEDURE FOR UserFavorite
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spDeleteUserFavorite]
GO

CREATE PROCEDURE [__mj].[spDeleteUserFavorite]
    @ID int
AS  
BEGIN
    SET NOCOUNT ON;

    DELETE FROM 
        [__mj].[UserFavorite]
    WHERE 
        [ID] = @ID

    SELECT @ID AS [ID] -- Return the primary key to indicate we successfully deleted the record
END
GO
GRANT EXECUTE ON [__mj].[spDeleteUserFavorite] TO [cdp_Developer], [cdp_Integration], [cdp_UI]
