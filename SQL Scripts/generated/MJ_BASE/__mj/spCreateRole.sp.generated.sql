-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Roles
-- Item: spCreateRole
-- Generated: 3/30/2024, 10:15:21 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR Role
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateRole]
GO

CREATE PROCEDURE [__mj].[spCreateRole]
    @Name nvarchar(50),
    @Description nvarchar(MAX),
    @DirectoryID nvarchar(250),
    @SQLName nvarchar(250)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [__mj].[Role]
        (
            [Name],
            [Description],
            [DirectoryID],
            [SQLName]
        )
    VALUES
        (
            @Name,
            @Description,
            @DirectoryID,
            @SQLName
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [__mj].[vwRoles] WHERE [ID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [__mj].[spCreateRole] TO [cdp_Developer], [cdp_Integration]
