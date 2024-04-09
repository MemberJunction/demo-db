-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Members
-- Item: spCreateMember
-- Generated: 4/8/2024, 8:01:20 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR Member
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [membership].[spCreateMember]
GO

CREATE PROCEDURE [membership].[spCreateMember]
    @CompanyID int,
    @Email nvarchar(255),
    @FirstName nvarchar(50),
    @LastName nvarchar(50),
    @JobTitle nvarchar(100),
    @JoinDate date,
    @MemberTypeID int
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [membership].[Member]
        (
            [CompanyID],
            [Email],
            [FirstName],
            [LastName],
            [JobTitle],
            [JoinDate],
            [MemberTypeID]
        )
    VALUES
        (
            @CompanyID,
            @Email,
            @FirstName,
            @LastName,
            @JobTitle,
            @JoinDate,
            @MemberTypeID
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [membership].[vwMembers] WHERE [MemberID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [membership].[spCreateMember] TO [cdp_Developer], [cdp_Integration]
