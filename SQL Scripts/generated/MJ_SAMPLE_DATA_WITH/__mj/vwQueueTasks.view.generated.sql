-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Queue Tasks
-- Item: vwQueueTasks
-- Generated: 3/10/2024, 9:38:18 AM
--
-- This was generated by the Entity Generator.
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
GRANT SELECT ON [__mj].[vwQueueTasks] TO [cdp_Developer], [cdp_Developer], [cdp_UI]
