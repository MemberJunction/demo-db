-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Application Entities
-- Item: spUpdateApplicationEntity
-- Generated: 3/30/2024, 10:15:24 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR ApplicationEntity  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateApplicationEntity]
GO

CREATE PROCEDURE [__mj].[spUpdateApplicationEntity]
    @ID int,
    @ApplicationName nvarchar(50),
    @EntityID int,
    @Sequence int,
    @DefaultForNewUser bit
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[ApplicationEntity]
    SET 
        [ApplicationName] = @ApplicationName,
        [EntityID] = @EntityID,
        [Sequence] = @Sequence,
        [DefaultForNewUser] = @DefaultForNewUser,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwApplicationEntities] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateApplicationEntity] TO [cdp_Developer], [cdp_Integration]
    