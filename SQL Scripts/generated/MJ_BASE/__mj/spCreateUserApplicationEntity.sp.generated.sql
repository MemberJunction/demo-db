-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: User Application Entities
-- Item: spCreateUserApplicationEntity
-- Generated: 3/30/2024, 11:48:07 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR UserApplicationEntity
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateUserApplicationEntity]
GO

CREATE PROCEDURE [__mj].[spCreateUserApplicationEntity]
    @UserApplicationID int,
    @EntityID int,
    @Sequence int
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [__mj].[UserApplicationEntity]
        (
            [UserApplicationID],
            [EntityID],
            [Sequence]
        )
    VALUES
        (
            @UserApplicationID,
            @EntityID,
            @Sequence
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [__mj].[vwUserApplicationEntities] WHERE [ID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [__mj].[spCreateUserApplicationEntity] TO [cdp_Developer], [cdp_Integration]
