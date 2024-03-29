-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Roles
-- Item: spUpdateRole
-- Generated: 3/10/2024, 9:38:11 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Role  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateRole]
GO

CREATE PROCEDURE [__mj].[spUpdateRole]
    @ID int,
    @Name nvarchar(50),
    @Description nvarchar(500),
    @AzureID nvarchar(50),
    @SQLName nvarchar(50)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[Role]
    SET 
        [Name] = @Name,
        [Description] = @Description,
        [AzureID] = @AzureID,
        [SQLName] = @SQLName,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwRoles] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateRole] TO [cdp_Developer], [cdp_Integration]
    