-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Entity Documents
-- Item: spUpdateEntityDocument
-- Generated: 3/10/2024, 9:38:24 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR EntityDocument  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateEntityDocument]
GO

CREATE PROCEDURE [__mj].[spUpdateEntityDocument]
    @ID int,
    @Name nvarchar(250),
    @EntityID int,
    @TypeID int,
    @Status nvarchar(15),
    @Template nvarchar(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[EntityDocument]
    SET 
        [Name] = @Name,
        [EntityID] = @EntityID,
        [TypeID] = @TypeID,
        [Status] = @Status,
        [Template] = @Template,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwEntityDocuments] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateEntityDocument] TO [cdp_Developer], [cdp_Integration]
    