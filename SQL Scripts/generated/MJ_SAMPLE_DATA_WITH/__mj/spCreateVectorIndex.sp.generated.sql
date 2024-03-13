-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Vector Indexes
-- Item: spCreateVectorIndex
-- Generated: 3/10/2024, 9:38:23 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR VectorIndex
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateVectorIndex]
GO

CREATE PROCEDURE [__mj].[spCreateVectorIndex]
    @Name nvarchar(255),
    @Description nvarchar(MAX),
    @VectorDatabaseID int,
    @EmbeddingModelID int
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [__mj].[VectorIndex]
        (
            [Name],
            [Description],
            [VectorDatabaseID],
            [EmbeddingModelID]
        )
    VALUES
        (
            @Name,
            @Description,
            @VectorDatabaseID,
            @EmbeddingModelID
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [__mj].[vwVectorIndexes] WHERE [ID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [__mj].[spCreateVectorIndex] TO [cdp_Developer], [cdp_Integration]
