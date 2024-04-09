
GRANT EXECUTE ON [events].[spCreateAttendee] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [events].[spCreateEvent] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [events].[spCreateOrganization] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [events].[spCreateRegistration__events] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [events].[spUpdateAttendee] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [events].[spUpdateEvent] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [events].[spUpdateOrganization] TO [cdp_Developer], [cdp_Integration]





GRANT EXECUTE ON [events].[spUpdateRegistration__events] TO [cdp_Developer], [cdp_Integration]




-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Attendees
-- Item: Permissions for vwAttendees
-- Generated: 4/8/2024, 8:01:18 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [events].[vwAttendees] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Events
-- Item: Permissions for vwEvents
-- Generated: 4/8/2024, 8:01:18 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [events].[vwEvents] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Organizations
-- Item: Permissions for vwOrganizations
-- Generated: 4/8/2024, 8:01:17 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [events].[vwOrganizations] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Registrations__events
-- Item: Permissions for vwRegistrations__events
-- Generated: 4/8/2024, 8:01:18 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

GRANT SELECT ON [events].[vwRegistrations__events] TO [cdp_UI], [cdp_Developer], [cdp_Integration]


