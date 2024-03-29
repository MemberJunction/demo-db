-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Attendees
-- Item: vwAttendees
-- Generated: 3/16/2024, 12:11:21 PM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Attendees
-----               SCHEMA:      events
-----               BASE TABLE:  Attendee
-----               PRIMARY KEY: AttendeeID
------------------------------------------------------------
DROP VIEW IF EXISTS [events].[vwAttendees]
GO

CREATE VIEW [events].[vwAttendees]
AS
SELECT 
    a.*
FROM
    [events].[Attendee] AS a
GO
GRANT SELECT ON [events].[vwAttendees] TO [cdp_UI], [cdp_Developer], [cdp_Integration]
