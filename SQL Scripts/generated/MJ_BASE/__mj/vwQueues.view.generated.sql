-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Queues
-- Item: vwQueues
-- Generated: 3/30/2024, 10:15:28 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Queues
-----               SCHEMA:      __mj
-----               BASE TABLE:  Queue
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwQueues]
GO

CREATE VIEW [__mj].[vwQueues]
AS
SELECT 
    q.*,
    QueueType_QueueTypeID.[Name] AS [QueueType]
FROM
    [__mj].[Queue] AS q
INNER JOIN
    [__mj].[QueueType] AS QueueType_QueueTypeID
  ON
    [q].[QueueTypeID] = QueueType_QueueTypeID.[ID]
GO
GRANT SELECT ON [__mj].[vwQueues] TO [cdp_UI]
