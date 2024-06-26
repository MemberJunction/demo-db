-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Vector Databases
-- Item: spUpdateVectorDatabase
-- Generated: 3/30/2024, 10:15:35 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR VectorDatabase  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateVectorDatabase]
GO

CREATE PROCEDURE [__mj].[spUpdateVectorDatabase]
    @ID int,
    @Name nvarchar(100),
    @Description nvarchar(MAX),
    @DefaultURL nvarchar(255),
    @ClassKey nvarchar(100)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[VectorDatabase]
    SET 
        [Name] = @Name,
        [Description] = @Description,
        [DefaultURL] = @DefaultURL,
        [ClassKey] = @ClassKey,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwVectorDatabases] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateVectorDatabase] TO [cdp_Developer], [cdp_Integration]
    