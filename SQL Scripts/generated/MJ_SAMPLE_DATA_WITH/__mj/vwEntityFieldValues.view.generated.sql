-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Entity Field Values
-- Item: vwEntityFieldValues
-- Generated: 3/10/2024, 9:38:17 AM
--
-- This was generated by the Entity Generator.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- BASE VIEW FOR ENTITY:      Entity Field Values
-----               SCHEMA:      __mj
-----               BASE TABLE:  EntityFieldValue
-----               PRIMARY KEY: ID
------------------------------------------------------------
DROP VIEW IF EXISTS [__mj].[vwEntityFieldValues]
GO

CREATE VIEW [__mj].[vwEntityFieldValues]
AS
SELECT 
    e.*,
    EntityField_EntityID.[Name] AS [Entity]
FROM
    [__mj].[EntityFieldValue] AS e
INNER JOIN
    [__mj].[EntityField] AS EntityField_EntityID
  ON
    [e].[EntityID] = EntityField_EntityID.[EntityID]
GO
GRANT SELECT ON [__mj].[vwEntityFieldValues] TO [cdp_Developer], [cdp_Integration], [cdp_UI]
