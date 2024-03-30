-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Queue Types
-- Item: vwQueueTypes
-- Generated: 3/30/2024, 11:48:11 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Queue Types
-----               SCHEMA:      __mj
-----               BASE TABLE:  QueueType
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwQueueTypes]
GO

CREATE VIEW [__mj].[vwQueueTypes]
AS
SELECT 
    q.*
FROM
    [__mj].[QueueType] AS q
GO
GRANT SELECT ON [__mj].[vwQueueTypes] TO [cdp_Developer], [cdp_UI]
