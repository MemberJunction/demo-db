-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Data Contexts
-- Item: spCreateDataContext
-- Generated: 3/30/2024, 10:15:36 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR DataContext
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateDataContext]
GO

CREATE PROCEDURE [__mj].[spCreateDataContext]
    @Name nvarchar(255),
    @UserID int,
    @Description nvarchar(MAX),
    @LastRefreshedAt datetime
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [__mj].[DataContext]
        (
            [Name],
            [UserID],
            [Description],
            [LastRefreshedAt]
        )
    VALUES
        (
            @Name,
            @UserID,
            @Description,
            @LastRefreshedAt
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [__mj].[vwDataContexts] WHERE [ID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [__mj].[spCreateDataContext] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
