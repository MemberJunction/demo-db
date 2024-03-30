-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: AI Actions
-- Item: vwAIActions
-- Generated: 3/30/2024, 11:48:11 AM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      AI Actions
-----               SCHEMA:      __mj
-----               BASE TABLE:  AIAction
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwAIActions]
GO

CREATE VIEW [__mj].[vwAIActions]
AS
SELECT 
    a.*,
    AIModel_DefaultModelID.[Name] AS [DefaultModel]
FROM
    [__mj].[AIAction] AS a
LEFT OUTER JOIN
    [__mj].[AIModel] AS AIModel_DefaultModelID
  ON
    [a].[DefaultModelID] = AIModel_DefaultModelID.[ID]
GO
GRANT SELECT ON [__mj].[vwAIActions] TO [cdp_UI], [cdp_Integration], [cdp_Developer]
