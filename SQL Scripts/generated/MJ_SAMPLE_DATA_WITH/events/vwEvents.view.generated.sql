-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Events
-- Item: vwEvents
-- Generated: 4/8/2024, 8:01:18 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Events
-----               SCHEMA:      events
-----               BASE TABLE:  Event
-----               PRIMARY KEY: EventID
------------------------------------------------------------
DROP VIEW IF EXISTS [events].[vwEvents]
GO

CREATE VIEW [events].[vwEvents]
AS
SELECT 
    e.*
FROM
    [events].[Event] AS e
GO
GRANT SELECT ON [events].[vwEvents] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
