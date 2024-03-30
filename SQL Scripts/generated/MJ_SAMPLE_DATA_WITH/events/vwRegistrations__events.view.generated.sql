-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Registrations__events
-- Item: vwRegistrations__events
-- Generated: 3/30/2024, 4:35:04 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Registrations__events
-----               SCHEMA:      events
-----               BASE TABLE:  Registration
-----               PRIMARY KEY: RegistrationID
------------------------------------------------------------
DROP VIEW IF EXISTS [events].[vwRegistrations__events]
GO

CREATE VIEW [events].[vwRegistrations__events]
AS
SELECT 
    r.*
FROM
    [events].[Registration] AS r
GO
GRANT SELECT ON [events].[vwRegistrations__events] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
