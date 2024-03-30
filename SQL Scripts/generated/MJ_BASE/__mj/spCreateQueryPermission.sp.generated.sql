-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Query Permissions
-- Item: spCreateQueryPermission
-- Generated: 3/30/2024, 11:48:17 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR QueryPermission
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateQueryPermission]
GO

CREATE PROCEDURE [__mj].[spCreateQueryPermission]
    @QueryID int,
    @RoleName nvarchar(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [__mj].[QueryPermission]
        (
            [QueryID],
            [RoleName]
        )
    VALUES
        (
            @QueryID,
            @RoleName
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [__mj].[vwQueryPermissions] WHERE [ID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [__mj].[spCreateQueryPermission] TO [cdp_Developer], [cdp_Integration]
