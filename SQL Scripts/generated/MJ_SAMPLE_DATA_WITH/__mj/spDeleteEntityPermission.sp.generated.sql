-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Entity Permissions
-- Item: spDeleteEntityPermission
-- Generated: 3/10/2024, 9:38:13 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- DELETE PROCEDURE FOR EntityPermission
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spDeleteEntityPermission]
GO

CREATE PROCEDURE [__mj].[spDeleteEntityPermission]
    @ID int
AS  
BEGIN
    SET NOCOUNT ON;

    DELETE FROM 
        [__mj].[EntityPermission]
    WHERE 
        [ID] = @ID

    SELECT @ID AS [ID] -- Return the primary key to indicate we successfully deleted the record
END
GO
GRANT EXECUTE ON [__mj].[spDeleteEntityPermission] TO [cdp_Developer], [cdp_Integration]
