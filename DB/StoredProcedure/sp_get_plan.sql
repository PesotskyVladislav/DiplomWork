IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_plan]') AND type in (N'P', N'PC'))  
	EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_get_plan] AS' 
GO 
SET ANSI_NULLS ON  
GO 
SET QUOTED_IDENTIFIER ON  
GO 
 
ALTER PROCEDURE [dbo].[sp_get_plan]
	@id_plan int
AS
BEGIN
	DECLARE @_id_plan int = @id_plan
	SELECT 
		0 AS subject_type,
		d.discipline_name,
		dt.term_number,
		i.id_indicator, 
		i.indicator_description,
		dit.id_indicator_type
	FROM discipline_plan AS dp WITH (READUNCOMMITTED)
	JOIN discipline AS d WITH (READUNCOMMITTED) ON d.id_discipline = dp.id_discipline
	JOIN discipline_term AS dt WITH (READUNCOMMITTED) ON dt.id_discipline_plan = dp.id_discipline_plan
	JOIN discipline_indicator_type AS dit WITH (READUNCOMMITTED) ON dit.id_discipline_plan = dp.id_discipline_plan
	JOIN indicator AS i WITH (READUNCOMMITTED) ON i.id_indicator = dit.id_indicator
	WHERE dp.id_plan = @_id_plan
	UNION ALL
	SELECT 
		1 AS subject_type,
		ta.[description],
		cs.term,
		i.id_indicator,
		i.indicator_description,
		ics.id_indicator_type
	FROM calendar_schedule AS cs WITH (READUNCOMMITTED) 
	JOIN type_activity AS ta WITH (READUNCOMMITTED) ON ta.id_type_activity = cs.id_type_activity
	JOIN indicator_calendar_schedule AS ics WITH (READUNCOMMITTED) ON ics.id_calendar_schedule = cs.id_calendar_schedule
	JOIN indicator AS i WITH (READUNCOMMITTED) ON i.id_indicator = ics.id_indicator
	WHERE cs.id_plan = @_id_plan AND ta.is_practice = 1
END