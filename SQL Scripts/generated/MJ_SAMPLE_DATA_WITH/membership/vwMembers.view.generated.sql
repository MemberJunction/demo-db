-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Members
-- Item: vwMembers
-- Generated: 4/8/2024, 8:01:20 PM
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
