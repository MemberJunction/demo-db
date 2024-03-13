-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: User Application Entities
-- Item: spUpdateUserApplicationEntity
-- Generated: 3/10/2024, 9:38:13 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR UserApplicationEntity  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateUserApplicationEntity]
GO

CREATE PROCEDURE [__mj].[spUpdateUserApplicationEntity]
    @ID int,
    @UserApplicationID int,
    @EntityID int,
    @Sequence int
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[UserApplicationEntity]
    SET 
        [UserApplicationID] = @UserApplicationID,
        [EntityID] = @EntityID,
        [Sequence] = @Sequence
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwUserApplicationEntities] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateUserApplicationEntity] TO [cdp_Developer], [cdp_Integration]
    