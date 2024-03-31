-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Entity Document Runs
-- Item: spCreateEntityDocumentRun
-- Generated: 3/30/2024, 10:15:35 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR EntityDocumentRun
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateEntityDocumentRun]
GO

CREATE PROCEDURE [__mj].[spCreateEntityDocumentRun]
    @EntityDocumentID int,
    @StartedAt datetime,
    @EndedAt datetime,
    @Status nvarchar(15)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [__mj].[EntityDocumentRun]
        (
            [EntityDocumentID],
            [StartedAt],
            [EndedAt],
            [Status]
        )
    VALUES
        (
            @EntityDocumentID,
            @StartedAt,
            @EndedAt,
            @Status
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [__mj].[vwEntityDocumentRuns] WHERE [ID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [__mj].[spCreateEntityDocumentRun] TO [cdp_Developer], [cdp_Integration]
