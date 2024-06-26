-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: AI Model Types
-- Item: vwAIModelTypes
-- Generated: 3/30/2024, 10:15:28 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      AI Model Types
-----               SCHEMA:      __mj
-----               BASE TABLE:  AIModelType
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwAIModelTypes]
GO

CREATE VIEW [__mj].[vwAIModelTypes]
AS
SELECT 
    a.*
FROM
    [__mj].[AIModelType] AS a
GO
GRANT SELECT ON [__mj].[vwAIModelTypes] TO [cdp_UI], [cdp_Integration], [cdp_Developer]
