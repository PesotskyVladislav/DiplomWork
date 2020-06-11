IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_plan]')) 
	EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[v_plan] AS SELECT 1 AS A1' 
GO 
SET ANSI_NULLS ON  
GO 
SET QUOTED_IDENTIFIER ON  
GO 

ALTER VIEW v_plan
AS
SELECT id_plan, plan_name
FROM [plan]