-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Integration URL Formats
-- Item: spUpdateIntegrationURLFormat
-- Generated: 3/30/2024, 10:15:21 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR IntegrationURLFormat  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateIntegrationURLFormat]
GO

CREATE PROCEDURE [__mj].[spUpdateIntegrationURLFormat]
    @ID int,
    @IntegrationName nvarchar(100),
    @EntityID int,
    @URLFormat nvarchar(500)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[IntegrationURLFormat]
    SET 
        [IntegrationName] = @IntegrationName,
        [EntityID] = @EntityID,
        [URLFormat] = @URLFormat
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwIntegrationURLFormats] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateIntegrationURLFormat] TO [cdp_Developer], [cdp_Integration]
    