-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Application Entities
-- Item: spDeleteApplicationEntity
-- Generated: 3/30/2024, 10:15:24 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- DELETE PROCEDURE FOR ApplicationEntity
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spDeleteApplicationEntity]
GO

CREATE PROCEDURE [__mj].[spDeleteApplicationEntity]
    @ID int
AS  
BEGIN
    SET NOCOUNT ON;

    DELETE FROM 
        [__mj].[ApplicationEntity]
    WHERE 
        [ID] = @ID

    SELECT @ID AS [ID] -- Return the primary key to indicate we successfully deleted the record
END
GO
GRANT EXECUTE ON [__mj].[spDeleteApplicationEntity] TO [cdp_Developer], [cdp_Integration]