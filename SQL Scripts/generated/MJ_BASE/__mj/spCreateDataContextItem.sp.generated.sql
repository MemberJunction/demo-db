-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Data Context Items
-- Item: spCreateDataContextItem
-- Generated: 3/30/2024, 11:48:18 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR DataContextItem
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spCreateDataContextItem]
GO

CREATE PROCEDURE [__mj].[spCreateDataContextItem]
    @DataContextID int,
    @Type nvarchar(50),
    @ViewID int,
    @QueryID int,
    @EntityID int,
    @RecordID nvarchar(255),
    @SQL nvarchar(MAX),
    @DataJSON nvarchar(MAX),
    @LastRefreshedAt datetime
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [__mj].[DataContextItem]
        (
            [DataContextID],
            [Type],
            [ViewID],
            [QueryID],
            [EntityID],
            [RecordID],
            [SQL],
            [DataJSON],
            [LastRefreshedAt]
        )
    VALUES
        (
            @DataContextID,
            @Type,
            @ViewID,
            @QueryID,
            @EntityID,
            @RecordID,
            @SQL,
            @DataJSON,
            @LastRefreshedAt
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [__mj].[vwDataContextItems] WHERE [ID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [__mj].[spCreateDataContextItem] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
