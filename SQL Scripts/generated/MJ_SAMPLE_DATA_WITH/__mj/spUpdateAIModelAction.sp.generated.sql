-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: AI Model Actions
-- Item: spUpdateAIModelAction
-- Generated: 3/10/2024, 9:38:17 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR AIModelAction  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateAIModelAction]
GO

CREATE PROCEDURE [__mj].[spUpdateAIModelAction]
    @ID int,
    @AIModelID int,
    @AIActionID int,
    @IsActive bit
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[AIModelAction]
    SET 
        [AIModelID] = @AIModelID,
        [AIActionID] = @AIActionID,
        [IsActive] = @IsActive,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwAIModelActions] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateAIModelAction] TO [cdp_Integration], [cdp_Developer]
    