-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: List Details
-- Item: spDeleteListDetail
-- Generated: 3/30/2024, 10:15:25 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- DELETE PROCEDURE FOR ListDetail
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spDeleteListDetail]
GO

CREATE PROCEDURE [__mj].[spDeleteListDetail]
    @ID int
AS  
BEGIN
    SET NOCOUNT ON;

    DELETE FROM 
        [__mj].[ListDetail]
    WHERE 
        [ID] = @ID

    SELECT @ID AS [ID] -- Return the primary key to indicate we successfully deleted the record
END
GO
GRANT EXECUTE ON [__mj].[spDeleteListDetail] TO [cdp_Developer], [cdp_Integration]
