-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Lists
-- Item: spUpdateList
-- Generated: 3/30/2024, 11:48:08 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR List  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateList]
GO

CREATE PROCEDURE [__mj].[spUpdateList]
    @ID int,
    @Name nvarchar(100),
    @Description nvarchar(MAX),
    @EntityID int,
    @UserID int,
    @ExternalSystemRecordID nvarchar(100),
    @CompanyIntegrationID int
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[List]
    SET 
        [Name] = @Name,
        [Description] = @Description,
        [EntityID] = @EntityID,
        [UserID] = @UserID,
        [ExternalSystemRecordID] = @ExternalSystemRecordID,
        [CompanyIntegrationID] = @CompanyIntegrationID,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwLists] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateList] TO [cdp_Developer], [cdp_Integration]
    