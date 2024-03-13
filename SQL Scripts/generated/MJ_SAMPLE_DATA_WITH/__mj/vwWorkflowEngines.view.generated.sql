-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Workflow Engines
-- Item: vwWorkflowEngines
-- Generated: 3/10/2024, 9:38:15 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Workflow Engines
-----               SCHEMA:      __mj
-----               BASE TABLE:  WorkflowEngine
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwWorkflowEngines]
GO

CREATE VIEW [__mj].[vwWorkflowEngines]
AS
SELECT 
    w.*
FROM
    [__mj].[WorkflowEngine] AS w
GO
GRANT SELECT ON [__mj].[vwWorkflowEngines] TO [cdp_Developer], [cdp_Integration], [cdp_UI]
