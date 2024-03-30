-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: AI Models
-- Item: spUpdateAIModel
-- Generated: 3/30/2024, 11:48:11 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR AIModel  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateAIModel]
GO

CREATE PROCEDURE [__mj].[spUpdateAIModel]
    @ID int,
    @Name nvarchar(50),
    @Vendor nvarchar(50),
    @AIModelTypeID int,
    @Description nvarchar(MAX),
    @DriverClass nvarchar(100),
    @DriverImportPath nvarchar(255),
    @IsActive bit
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[AIModel]
    SET 
        [Name] = @Name,
        [Vendor] = @Vendor,
        [AIModelTypeID] = @AIModelTypeID,
        [Description] = @Description,
        [DriverClass] = @DriverClass,
        [DriverImportPath] = @DriverImportPath,
        [IsActive] = @IsActive,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwAIModels] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateAIModel] TO [cdp_Integration], [cdp_Developer]
    