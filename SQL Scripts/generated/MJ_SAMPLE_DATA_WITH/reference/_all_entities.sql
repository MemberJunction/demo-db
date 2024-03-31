-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Job Title Seeds
-- Item: spCreateJobTitleSeed
-- Generated: 3/31/2024, 11:57:29 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR JobTitleSeed
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [reference].[spCreateJobTitleSeed]
GO

CREATE PROCEDURE [reference].[spCreateJobTitleSeed]
    @JobTitle nvarchar(100)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [reference].[JobTitleSeed]
        (
            [JobTitle]
        )
    VALUES
        (
            @JobTitle
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [reference].[vwJobTitleSeeds] WHERE [JobTitleID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [reference].[spCreateJobTitleSeed] TO [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Name Seeds
-- Item: spCreateNameSeed
-- Generated: 3/31/2024, 11:57:29 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR NameSeed
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [reference].[spCreateNameSeed]
GO

CREATE PROCEDURE [reference].[spCreateNameSeed]
    @Name nvarchar(50),
    @NameType nvarchar(10)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [reference].[NameSeed]
        (
            [Name],
            [NameType]
        )
    VALUES
        (
            @Name,
            @NameType
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [reference].[vwNameSeeds] WHERE [NameID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [reference].[spCreateNameSeed] TO [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Post Seeds
-- Item: spCreatePostSeed
-- Generated: 3/31/2024, 11:57:29 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR PostSeed
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [reference].[spCreatePostSeed]
GO

CREATE PROCEDURE [reference].[spCreatePostSeed]
    @Content nvarchar(MAX),
    @Type nvarchar(50)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [reference].[PostSeed]
        (
            [Content],
            [Type]
        )
    VALUES
        (
            @Content,
            @Type
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [reference].[vwPostSeeds] WHERE [PostSeedID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [reference].[spCreatePostSeed] TO [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Reply Seeds
-- Item: spCreateReplySeed
-- Generated: 3/31/2024, 11:57:29 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- CREATE PROCEDURE FOR ReplySeed
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [reference].[spCreateReplySeed]
GO

CREATE PROCEDURE [reference].[spCreateReplySeed]
    @Content nvarchar(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO 
    [reference].[ReplySeed]
        (
            [Content]
        )
    VALUES
        (
            @Content
        )
    -- return the new record from the base view, which might have some calculated fields
    SELECT * FROM [reference].[vwReplySeeds] WHERE [ReplySeedID] = SCOPE_IDENTITY()
END
GO
GRANT EXECUTE ON [reference].[spCreateReplySeed] TO [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Job Title Seeds
-- Item: spUpdateJobTitleSeed
-- Generated: 3/31/2024, 11:57:29 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR JobTitleSeed  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [reference].[spUpdateJobTitleSeed]
GO

CREATE PROCEDURE [reference].[spUpdateJobTitleSeed]
    @JobTitleID int,
    @JobTitle nvarchar(100)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [reference].[JobTitleSeed]
    SET 
        [JobTitle] = @JobTitle
    WHERE 
        [JobTitleID] = @JobTitleID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [reference].[vwJobTitleSeeds] WHERE [JobTitleID] = @JobTitleID
END
GO
GRANT EXECUTE ON [reference].[spUpdateJobTitleSeed] TO [cdp_Developer], [cdp_Integration]
    


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Name Seeds
-- Item: spUpdateNameSeed
-- Generated: 3/31/2024, 11:57:29 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR NameSeed  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [reference].[spUpdateNameSeed]
GO

CREATE PROCEDURE [reference].[spUpdateNameSeed]
    @NameID int,
    @Name nvarchar(50),
    @NameType nvarchar(10)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [reference].[NameSeed]
    SET 
        [Name] = @Name,
        [NameType] = @NameType
    WHERE 
        [NameID] = @NameID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [reference].[vwNameSeeds] WHERE [NameID] = @NameID
END
GO
GRANT EXECUTE ON [reference].[spUpdateNameSeed] TO [cdp_Developer], [cdp_Integration]
    


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Post Seeds
-- Item: spUpdatePostSeed
-- Generated: 3/31/2024, 11:57:29 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR PostSeed  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [reference].[spUpdatePostSeed]
GO

CREATE PROCEDURE [reference].[spUpdatePostSeed]
    @PostSeedID int,
    @Content nvarchar(MAX),
    @Type nvarchar(50)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [reference].[PostSeed]
    SET 
        [Content] = @Content,
        [Type] = @Type
    WHERE 
        [PostSeedID] = @PostSeedID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [reference].[vwPostSeeds] WHERE [PostSeedID] = @PostSeedID
END
GO
GRANT EXECUTE ON [reference].[spUpdatePostSeed] TO [cdp_Developer], [cdp_Integration]
    


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Reply Seeds
-- Item: spUpdateReplySeed
-- Generated: 3/31/2024, 11:57:29 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- UPDATE PROCEDURE FOR ReplySeed  
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [reference].[spUpdateReplySeed]
GO

CREATE PROCEDURE [reference].[spUpdateReplySeed]
    @ReplySeedID int,
    @Content nvarchar(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE 
        [reference].[ReplySeed]
    SET 
        [Content] = @Content
    WHERE 
        [ReplySeedID] = @ReplySeedID

    -- return the updated record so the caller can see the updated values and any calculated fields
    SELECT * FROM [reference].[vwReplySeeds] WHERE [ReplySeedID] = @ReplySeedID
END
GO
GRANT EXECUTE ON [reference].[spUpdateReplySeed] TO [cdp_Developer], [cdp_Integration]
    


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Job Title Seeds
-- Item: vwJobTitleSeeds
-- Generated: 3/31/2024, 11:57:29 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Job Title Seeds
-----               SCHEMA:      reference
-----               BASE TABLE:  JobTitleSeed
-----               PRIMARY KEY: JobTitleID
------------------------------------------------------------
DROP VIEW IF EXISTS [reference].[vwJobTitleSeeds]
GO

CREATE VIEW [reference].[vwJobTitleSeeds]
AS
SELECT 
    j.*
FROM
    [reference].[JobTitleSeed] AS j
GO
GRANT SELECT ON [reference].[vwJobTitleSeeds] TO [cdp_UI], [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Name Seeds
-- Item: vwNameSeeds
-- Generated: 3/31/2024, 11:57:29 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Name Seeds
-----               SCHEMA:      reference
-----               BASE TABLE:  NameSeed
-----               PRIMARY KEY: NameID
------------------------------------------------------------
DROP VIEW IF EXISTS [reference].[vwNameSeeds]
GO

CREATE VIEW [reference].[vwNameSeeds]
AS
SELECT 
    n.*
FROM
    [reference].[NameSeed] AS n
GO
GRANT SELECT ON [reference].[vwNameSeeds] TO [cdp_UI], [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Post Seeds
-- Item: vwPostSeeds
-- Generated: 3/31/2024, 11:57:29 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Post Seeds
-----               SCHEMA:      reference
-----               BASE TABLE:  PostSeed
-----               PRIMARY KEY: PostSeedID
------------------------------------------------------------
DROP VIEW IF EXISTS [reference].[vwPostSeeds]
GO

CREATE VIEW [reference].[vwPostSeeds]
AS
SELECT 
    p.*
FROM
    [reference].[PostSeed] AS p
GO
GRANT SELECT ON [reference].[vwPostSeeds] TO [cdp_UI], [cdp_Developer], [cdp_Integration]



-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Reply Seeds
-- Item: vwReplySeeds
-- Generated: 3/31/2024, 11:57:29 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Reply Seeds
-----               SCHEMA:      reference
-----               BASE TABLE:  ReplySeed
-----               PRIMARY KEY: ReplySeedID
------------------------------------------------------------
DROP VIEW IF EXISTS [reference].[vwReplySeeds]
GO

CREATE VIEW [reference].[vwReplySeeds]
AS
SELECT 
    r.*
FROM
    [reference].[ReplySeed] AS r
GO
GRANT SELECT ON [reference].[vwReplySeeds] TO [cdp_UI], [cdp_Developer], [cdp_Integration]




GRANT EXECUTE ON [reference].[spCreateJobTitleSeed] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [reference].[spCreateNameSeed] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [reference].[spCreatePostSeed] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [reference].[spCreateReplySeed] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [reference].[spUpdateJobTitleSeed] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [reference].[spUpdateNameSeed] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [reference].[spUpdatePostSeed] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [reference].[spUpdateReplySeed] TO [cdp_Developer], [cdp_Integration]




-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Job Title Seeds
-- Item: Permissions for vwJobTitleSeeds
-- Generated: 3/31/2024, 11:57:29 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [reference].[vwJobTitleSeeds] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Name Seeds
-- Item: Permissions for vwNameSeeds
-- Generated: 3/31/2024, 11:57:29 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [reference].[vwNameSeeds] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Post Seeds
-- Item: Permissions for vwPostSeeds
-- Generated: 3/31/2024, 11:57:29 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [reference].[vwPostSeeds] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Reply Seeds
-- Item: Permissions for vwReplySeeds
-- Generated: 3/31/2024, 11:57:29 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [reference].[vwReplySeeds] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


