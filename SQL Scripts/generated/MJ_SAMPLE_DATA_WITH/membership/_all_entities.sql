-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Companies__membership
-- Item: spCreateCompany__membership
-- Generated: 3/30/2024, 4:35:06 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR Company
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [membership].[spCreateCompany__membership]
GO

CREATE PROCEDURE [membership].[spCreateCompany__membership]
    @CompanyName nvarchar(255),
    @Website nvarchar(255),
    @Industry nvarchar(100),
    @Size nvarchar(50),
    @Address nvarchar(255),
    @City nvarchar(100),
    @State nvarchar(100),
    @ZipCode nvarchar(20),
    @Country nvarchar(100),
    @TaxID nvarchar(100),
    @Subsection int,
    @TotalRevenue money,
    @InformationTechnologyExpense money
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [membership].[Company]
        (
            [CompanyName],
            [Website],
            [Industry],
            [Size],
            [Address],
            [City],
            [State],
            [ZipCode],
            [Country],
            [TaxID],
            [Subsection],
            [TotalRevenue],
            [InformationTechnologyExpense]
        )
    VALUES
        (
            @CompanyName,
            @Website,
            @Industry,
            @Size,
            @Address,
            @City,
            @State,
            @ZipCode,
            @Country,
            @TaxID,
            @Subsection,
            @TotalRevenue,
            @InformationTechnologyExpense
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [membership].[vwCompanies__membership] WHERE [CompanyID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [membership].[spCreateCompany__membership] TO [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Members
-- Item: spCreateMember
-- Generated: 3/30/2024, 4:35:06 PM
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



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Membership Renewals
-- Item: spCreateMembershipRenewal
-- Generated: 3/30/2024, 4:35:06 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR MembershipRenewal
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [membership].[spCreateMembershipRenewal]
GO

CREATE PROCEDURE [membership].[spCreateMembershipRenewal]
    @MemberID int,
    @RenewalDate date,
    @PaymentAmount money,
    @PaymentStatus nvarchar(255)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [membership].[MembershipRenewal]
        (
            [MemberID],
            [RenewalDate],
            [PaymentAmount],
            [PaymentStatus]
        )
    VALUES
        (
            @MemberID,
            @RenewalDate,
            @PaymentAmount,
            @PaymentStatus
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [membership].[vwMembershipRenewals] WHERE [RenewalID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [membership].[spCreateMembershipRenewal] TO [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Member Types
-- Item: spCreateMemberType
-- Generated: 3/30/2024, 4:35:06 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR MemberType
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [membership].[spCreateMemberType]
GO

CREATE PROCEDURE [membership].[spCreateMemberType]
    @TypeName nvarchar(100),
    @Description nvarchar(MAX),
    @AnnualDues money
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [membership].[MemberType]
        (
            [TypeName],
            [Description],
            [AnnualDues]
        )
    VALUES
        (
            @TypeName,
            @Description,
            @AnnualDues
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [membership].[vwMemberTypes] WHERE [MemberTypeID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [membership].[spCreateMemberType] TO [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Companies__membership
-- Item: spUpdateCompany__membership
-- Generated: 3/30/2024, 4:35:06 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR Company  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [membership].[spUpdateCompany__membership]
GO

CREATE PROCEDURE [membership].[spUpdateCompany__membership]
    @CompanyID int,
    @CompanyName nvarchar(255),
    @Website nvarchar(255),
    @Industry nvarchar(100),
    @Size nvarchar(50),
    @Address nvarchar(255),
    @City nvarchar(100),
    @State nvarchar(100),
    @ZipCode nvarchar(20),
    @Country nvarchar(100),
    @TaxID nvarchar(100),
    @Subsection int,
    @TotalRevenue money,
    @InformationTechnologyExpense money
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [membership].[Company]
    SET 
        [CompanyName] = @CompanyName,
        [Website] = @Website,
        [Industry] = @Industry,
        [Size] = @Size,
        [Address] = @Address,
        [City] = @City,
        [State] = @State,
        [ZipCode] = @ZipCode,
        [Country] = @Country,
        [TaxID] = @TaxID,
        [Subsection] = @Subsection,
        [TotalRevenue] = @TotalRevenue,
        [InformationTechnologyExpense] = @InformationTechnologyExpense
    WHERE 
        [CompanyID] = @CompanyID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [membership].[vwCompanies__membership] WHERE [CompanyID] = @CompanyID
END
GO
GRANT EXECUTE ON [membership].[spUpdateCompany__membership] TO [cdp_Developer], [cdp_Integration]
    


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Members
-- Item: spUpdateMember
-- Generated: 3/30/2024, 4:35:06 PM
--
-- This was generated by the MemberJunction CodeGen tool.
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
    


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Membership Renewals
-- Item: spUpdateMembershipRenewal
-- Generated: 3/30/2024, 4:35:06 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR MembershipRenewal  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [membership].[spUpdateMembershipRenewal]
GO

CREATE PROCEDURE [membership].[spUpdateMembershipRenewal]
    @RenewalID int,
    @MemberID int,
    @RenewalDate date,
    @PaymentAmount money,
    @PaymentStatus nvarchar(255)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [membership].[MembershipRenewal]
    SET 
        [MemberID] = @MemberID,
        [RenewalDate] = @RenewalDate,
        [PaymentAmount] = @PaymentAmount,
        [PaymentStatus] = @PaymentStatus
    WHERE 
        [RenewalID] = @RenewalID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [membership].[vwMembershipRenewals] WHERE [RenewalID] = @RenewalID
END
GO
GRANT EXECUTE ON [membership].[spUpdateMembershipRenewal] TO [cdp_Developer], [cdp_Integration]
    


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Member Types
-- Item: spUpdateMemberType
-- Generated: 3/30/2024, 4:35:06 PM
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
    


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Companies__membership
-- Item: vwCompanies__membership
-- Generated: 3/30/2024, 4:35:06 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Companies__membership
-----               SCHEMA:      membership
-----               BASE TABLE:  Company
-----               PRIMARY KEY: CompanyID
------------------------------------------------------------
DROP VIEW IF EXISTS [membership].[vwCompanies__membership]
GO

CREATE VIEW [membership].[vwCompanies__membership]
AS
SELECT 
    c.*
FROM
    [membership].[Company] AS c
GO
GRANT SELECT ON [membership].[vwCompanies__membership] TO [cdp_UI], [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Members
-- Item: vwMembers
-- Generated: 3/30/2024, 4:35:06 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Members
-----               SCHEMA:      membership
-----               BASE TABLE:  Member
-----               PRIMARY KEY: MemberID
------------------------------------------------------------
DROP VIEW IF EXISTS [membership].[vwMembers]
GO

CREATE VIEW [membership].[vwMembers]
AS
SELECT 
    m.*
FROM
    [membership].[Member] AS m
GO
GRANT SELECT ON [membership].[vwMembers] TO [cdp_UI], [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Membership Renewals
-- Item: vwMembershipRenewals
-- Generated: 3/30/2024, 4:35:06 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Membership Renewals
-----               SCHEMA:      membership
-----               BASE TABLE:  MembershipRenewal
-----               PRIMARY KEY: RenewalID
------------------------------------------------------------
DROP VIEW IF EXISTS [membership].[vwMembershipRenewals]
GO

CREATE VIEW [membership].[vwMembershipRenewals]
AS
SELECT 
    m.*
FROM
    [membership].[MembershipRenewal] AS m
GO
GRANT SELECT ON [membership].[vwMembershipRenewals] TO [cdp_UI], [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Member Types
-- Item: vwMemberTypes
-- Generated: 3/30/2024, 4:35:06 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Member Types
-----               SCHEMA:      membership
-----               BASE TABLE:  MemberType
-----               PRIMARY KEY: MemberTypeID
------------------------------------------------------------
DROP VIEW IF EXISTS [membership].[vwMemberTypes]
GO

CREATE VIEW [membership].[vwMemberTypes]
AS
SELECT 
    m.*
FROM
    [membership].[MemberType] AS m
GO
GRANT SELECT ON [membership].[vwMemberTypes] TO [cdp_UI], [cdp_Developer], [cdp_Integration]




GRANT EXECUTE ON [membership].[spCreateCompany__membership] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [membership].[spCreateMember] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [membership].[spCreateMembershipRenewal] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [membership].[spCreateMemberType] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [membership].[spUpdateCompany__membership] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [membership].[spUpdateMember] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [membership].[spUpdateMembershipRenewal] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [membership].[spUpdateMemberType] TO [cdp_Developer], [cdp_Integration]




-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Companies__membership
-- Item: Permissions for vwCompanies__membership
-- Generated: 3/30/2024, 4:35:06 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [membership].[vwCompanies__membership] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Members
-- Item: Permissions for vwMembers
-- Generated: 3/30/2024, 4:35:06 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [membership].[vwMembers] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Membership Renewals
-- Item: Permissions for vwMembershipRenewals
-- Generated: 3/30/2024, 4:35:06 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [membership].[vwMembershipRenewals] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Member Types
-- Item: Permissions for vwMemberTypes
-- Generated: 3/30/2024, 4:35:06 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [membership].[vwMemberTypes] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


