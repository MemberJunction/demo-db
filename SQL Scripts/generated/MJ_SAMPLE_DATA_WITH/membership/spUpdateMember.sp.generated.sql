-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Members
-- Item: spUpdateMember
-- Generated: 3/16/2024, 12:11:23 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Member  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [membership].[spUpdateMember]
GO

CREATE PROCEDURE [membership].[spUpdateMember]
    @MemberID int,
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
    UPDATE 
        [membership].[Member]
    SET 
        [CompanyID] = @CompanyID,
        [Email] = @Email,
        [FirstName] = @FirstName,
        [LastName] = @LastName,
        [JobTitle] = @JobTitle,
        [JoinDate] = @JoinDate,
        [MemberTypeID] = @MemberTypeID
    WHERE 
        [MemberID] = @MemberID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [membership].[vwMembers] WHERE [MemberID] = @MemberID
END
GO
GRANT EXECUTE ON [membership].[spUpdateMember] TO [cdp_Developer], [cdp_Integration]
    