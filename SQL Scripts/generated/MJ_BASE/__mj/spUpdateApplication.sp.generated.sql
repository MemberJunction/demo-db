-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Applications
-- Item: spUpdateApplication
-- Generated: 3/30/2024, 10:15:24 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Application  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateApplication]
GO

CREATE PROCEDURE [__mj].[spUpdateApplication]
    @ID int,
    @Name nvarchar(50),
    @Description nvarchar(500)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[Application]
    SET 
        [Name] = @Name,
        [Description] = @Description,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwApplications] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateApplication] TO [cdp_Developer], [cdp_Integration]
    