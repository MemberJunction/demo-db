-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Member Types
-- Item: vwMemberTypes
-- Generated: 3/13/2024, 8:19:44 PM
--
-- This was generated by the Entity Generator.
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
