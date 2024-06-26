-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: File Categories
-- Item: spDeleteFileCategory
-- Generated: 3/30/2024, 10:15:37 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- DELETE PROCEDURE FOR FileCategory
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spDeleteFileCategory]
GO

CREATE PROCEDURE [__mj].[spDeleteFileCategory]
    @ID int
AS  
BEGIN
    SET NOCOUNT ON;

    DELETE FROM 
        [__mj].[FileCategory]
    WHERE 
        [ID] = @ID

    SELECT @ID AS [ID] -- Return the primary key to indicate we successfully deleted the record
END
GO
GRANT EXECUTE ON [__mj].[spDeleteFileCategory] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
