-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: User Application Entities
-- Item: spDeleteUserApplicationEntity
-- Generated: 3/10/2024, 9:38:13 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- DELETE PROCEDURE FOR UserApplicationEntity
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spDeleteUserApplicationEntity]
GO

CREATE PROCEDURE [__mj].[spDeleteUserApplicationEntity]
    @ID int
AS  
BEGIN
    SET NOCOUNT ON;

    DELETE FROM 
        [__mj].[UserApplicationEntity]
    WHERE 
        [ID] = @ID

    SELECT @ID AS [ID] -- Return the primary key to indicate we successfully deleted the record
END
GO
GRANT EXECUTE ON [__mj].[spDeleteUserApplicationEntity] TO [cdp_Developer], [cdp_Integration]
