-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Application Entities
-- Item: spCreateApplicationEntity
-- Generated: 3/10/2024, 9:38:13 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR ApplicationEntity
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateApplicationEntity]
GO

CREATE PROCEDURE [__mj].[spCreateApplicationEntity]
    @ApplicationName nvarchar(50),
    @EntityID int,
    @Sequence int,
    @DefaultForNewUser bit
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [__mj].[ApplicationEntity]
        (
            [ApplicationName],
            [EntityID],
            [Sequence],
            [DefaultForNewUser]
        )
    VALUES
        (
            @ApplicationName,
            @EntityID,
            @Sequence,
            @DefaultForNewUser
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [__mj].[vwApplicationEntities] WHERE [ID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [__mj].[spCreateApplicationEntity] TO [cdp_Developer], [cdp_Integration]
