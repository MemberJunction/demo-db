-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Data Contexts
-- Item: spUpdateDataContext
-- Generated: 3/30/2024, 10:15:36 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR DataContext  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateDataContext]
GO

CREATE PROCEDURE [__mj].[spUpdateDataContext]
    @ID int,
    @Name nvarchar(255),
    @UserID int,
    @Description nvarchar(MAX),
    @LastRefreshedAt datetime
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[DataContext]
    SET 
        [Name] = @Name,
        [UserID] = @UserID,
        [Description] = @Description,
        [LastRefreshedAt] = @LastRefreshedAt,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwDataContexts] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateDataContext] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
    