-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Reports
-- Item: spDeleteReport
-- Generated: 3/30/2024, 10:15:30 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- DELETE PROCEDURE FOR Report
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spDeleteReport]
GO

CREATE PROCEDURE [__mj].[spDeleteReport]
    @ID int
AS  
BEGIN
    SET NOCOUNT ON;

    DELETE FROM 
        [__mj].[Report]
    WHERE 
        [ID] = @ID

    SELECT @ID AS [ID] -- Return the primary key to indicate we successfully deleted the record
END
GO
GRANT EXECUTE ON [__mj].[spDeleteReport] TO [cdp_UI]
