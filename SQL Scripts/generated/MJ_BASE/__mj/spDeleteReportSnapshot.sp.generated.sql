-----------------------------------------------------------------
-- SQL Code Generation
-- Entity: Report Snapshots
-- Item: spDeleteReportSnapshot
-- Generated: 3/30/2024, 10:15:30 PM
--
-- This was generated by the MemberJunction CodeGen tool.
-- This file should NOT be edited by hand.
-----------------------------------------------------------------

------------------------------------------------------------
----- DELETE PROCEDURE FOR ReportSnapshot
------------------------------------------------------------
DROP PROCEDURE IF EXISTS [__mj].[spDeleteReportSnapshot]
GO

CREATE PROCEDURE [__mj].[spDeleteReportSnapshot]
    @ID int
AS  
BEGIN
    SET NOCOUNT ON;

    DELETE FROM 
        [__mj].[ReportSnapshot]
    WHERE 
        [ID] = @ID

    SELECT @ID AS [ID] -- Return the primary key to indicate we successfully deleted the record
END
GO
GRANT EXECUTE ON [__mj].[spDeleteReportSnapshot] TO [cdp_UI]
