-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Vector Indexes
-- Item: spUpdateVectorIndex
-- Generated: 3/30/2024, 10:15:34 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR VectorIndex  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateVectorIndex]
GO

CREATE PROCEDURE [__mj].[spUpdateVectorIndex]
    @ID int,
    @Name nvarchar(255),
    @Description nvarchar(MAX),
    @VectorDatabaseID int,
    @EmbeddingModelID int
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[VectorIndex]
    SET 
        [Name] = @Name,
        [Description] = @Description,
        [VectorDatabaseID] = @VectorDatabaseID,
        [EmbeddingModelID] = @EmbeddingModelID,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwVectorIndexes] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateVectorIndex] TO [cdp_Developer], [cdp_Integration]
    