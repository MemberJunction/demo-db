-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Output Trigger Types
-- Item: vwOutputTriggerTypes
-- Generated: 3/30/2024, 10:15:30 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Output Trigger Types
-----               SCHEMA:      __mj
-----               BASE TABLE:  OutputTriggerType
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwOutputTriggerTypes]
GO

CREATE VIEW [__mj].[vwOutputTriggerTypes]
AS
SELECT 
    o.*
FROM
    [__mj].[OutputTriggerType] AS o
GO
GRANT SELECT ON [__mj].[vwOutputTriggerTypes] TO [cdp_UI]
