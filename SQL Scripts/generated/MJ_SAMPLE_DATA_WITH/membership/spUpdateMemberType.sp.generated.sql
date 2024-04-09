-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Member Types
-- Item: spUpdateMemberType
-- Generated: 4/8/2024, 8:01:20 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR MemberType  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [membership].[spUpdateMemberType]
GO

CREATE PROCEDURE [membership].[spUpdateMemberType]
    @MemberTypeID int,
    @TypeName nvarchar(100),
    @Description nvarchar(MAX),
    @AnnualDues money
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [membership].[MemberType]
    SET 
        [TypeName] = @TypeName,
        [Description] = @Description,
        [AnnualDues] = @AnnualDues
    WHERE 
        [MemberTypeID] = @MemberTypeID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [membership].[vwMemberTypes] WHERE [MemberTypeID] = @MemberTypeID
END
GO
GRANT EXECUTE ON [membership].[spUpdateMemberType] TO [cdp_Developer], [cdp_Integration]
    