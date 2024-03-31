-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Queue Tasks
-- Item: vwQueueTasks
-- Generated: 3/30/2024, 10:15:28 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Queue Tasks
-----               SCHEMA:      __mj
-----               BASE TABLE:  QueueTask
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwQueueTasks]
GO

CREATE VIEW [__mj].[vwQueueTasks]
AS
SELECT 
    q.*
FROM
    [__mj].[QueueTask] AS q
GO
GRANT SELECT ON [__mj].[vwQueueTasks] TO [cdp_UI]
