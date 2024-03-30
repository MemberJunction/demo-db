-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Query Fields
-- Item: spUpdateQueryField
-- Generated: 3/30/2024, 11:48:16 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR QueryField  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spUpdateQueryField]
GO

CREATE PROCEDURE [__mj].[spUpdateQueryField]
    @ID int,
    @QueryID int,
    @Name nvarchar(255),
    @Description nvarchar(MAX),
    @Sequence int,
    @SQLBaseType nvarchar(50),
    @SQLFullType nvarchar(100),
    @SourceEntityID int,
    @SourceFieldName nvarchar(255),
    @IsComputed bit,
    @ComputationDescription nvarchar(MAX),
    @IsSummary bit,
    @SummaryDescription nvarchar(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [__mj].[QueryField]
    SET 
        [QueryID] = @QueryID,
        [Name] = @Name,
        [Description] = @Description,
        [Sequence] = @Sequence,
        [SQLBaseType] = @SQLBaseType,
        [SQLFullType] = @SQLFullType,
        [SourceEntityID] = @SourceEntityID,
        [SourceFieldName] = @SourceFieldName,
        [IsComputed] = @IsComputed,
        [ComputationDescription] = @ComputationDescription,
        [IsSummary] = @IsSummary,
        [SummaryDescription] = @SummaryDescription,
        [UpdatedAt] = GETDATE()
    WHERE 
        [ID] = @ID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [__mj].[vwQueryFields] WHERE [ID] = @ID
END
GO
GRANT EXECUTE ON [__mj].[spUpdateQueryField] TO [cdp_Developer], [cdp_Integration]
    