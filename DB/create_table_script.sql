USE [diplom_database]
GO
/****** Object:  Table [dbo].[calendar_schedule]    Script Date: 11.06.2020 21:59:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[calendar_schedule](
	[id_calendar_schedule] [int] NOT NULL,
	[id_plan] [int] NULL,
	[term] [int] NULL,
	[id_type_activity] [int] NULL,
 CONSTRAINT [PK_calendar_schedule] PRIMARY KEY CLUSTERED 
(
	[id_calendar_schedule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[competencies]    Script Date: 11.06.2020 21:59:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[competencies](
	[id_competencies] [int] NOT NULL,
	[description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_competencies] PRIMARY KEY CLUSTERED 
(
	[id_competencies] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[competencies_plan]    Script Date: 11.06.2020 21:59:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[competencies_plan](
	[id_competencies_plan] [int] NOT NULL,
	[id_plan] [int] NOT NULL,
	[id_competencies] [int] NOT NULL,
 CONSTRAINT [PK_competencies_plan] PRIMARY KEY CLUSTERED 
(
	[id_competencies_plan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discipline]    Script Date: 11.06.2020 21:59:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discipline](
	[id_discipline] [int] NOT NULL,
	[discipline_name] [varchar](250) NOT NULL,
 CONSTRAINT [PK_discipline] PRIMARY KEY CLUSTERED 
(
	[id_discipline] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discipline_indicator_type]    Script Date: 11.06.2020 21:59:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discipline_indicator_type](
	[id_discipline_indicator_type] [int] NOT NULL,
	[id_indicator] [int] NOT NULL,
	[id_indicator_type] [int] NOT NULL,
	[id_discipline_plan] [int] NOT NULL,
 CONSTRAINT [PK_discipline_indicator_type] PRIMARY KEY CLUSTERED 
(
	[id_discipline_indicator_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discipline_plan]    Script Date: 11.06.2020 21:59:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discipline_plan](
	[id_discipline_plan] [int] NOT NULL,
	[id_plan] [int] NOT NULL,
	[id_discipline] [int] NOT NULL,
 CONSTRAINT [PK_discipline_plan] PRIMARY KEY CLUSTERED 
(
	[id_discipline_plan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discipline_term]    Script Date: 11.06.2020 21:59:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discipline_term](
	[id_discipline_term] [int] NOT NULL,
	[id_discipline_plan] [int] NOT NULL,
	[term_number] [int] NOT NULL,
 CONSTRAINT [PK_discipline_term] PRIMARY KEY CLUSTERED 
(
	[id_discipline_term] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[indicator]    Script Date: 11.06.2020 21:59:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[indicator](
	[id_indicator] [int] NOT NULL,
	[indicator_description] [varchar](250) NOT NULL,
 CONSTRAINT [PK_indicator] PRIMARY KEY CLUSTERED 
(
	[id_indicator] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[indicator_calendar_schedule]    Script Date: 11.06.2020 21:59:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[indicator_calendar_schedule](
	[id_indicator_calendar_schedule] [int] NOT NULL,
	[id_calendar_schedule] [int] NOT NULL,
	[id_indicator] [int] NOT NULL,
	[id_indicator_type] [int] NOT NULL,
 CONSTRAINT [PK_indicator_calendar_schedule] PRIMARY KEY CLUSTERED 
(
	[id_indicator_calendar_schedule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[indicator_competencies]    Script Date: 11.06.2020 21:59:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[indicator_competencies](
	[id_indicator_competencies] [int] NOT NULL,
	[id_indicator] [int] NOT NULL,
	[id_competencies] [int] NOT NULL,
 CONSTRAINT [PK_indicator_competencies] PRIMARY KEY CLUSTERED 
(
	[id_indicator_competencies] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[indicator_type]    Script Date: 11.06.2020 21:59:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[indicator_type](
	[id_indicator_type] [int] NOT NULL,
	[description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_indicator_type] PRIMARY KEY CLUSTERED 
(
	[id_indicator_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plan]    Script Date: 11.06.2020 21:59:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plan](
	[id_plan] [int] NOT NULL,
	[plan_name] [varchar](250) NOT NULL,
 CONSTRAINT [PK_plan] PRIMARY KEY CLUSTERED 
(
	[id_plan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_activity]    Script Date: 11.06.2020 21:59:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_activity](
	[id_type_activity] [int] NOT NULL,
	[description] [varchar](250) NOT NULL,
	[is_practice] [int] NOT NULL,
 CONSTRAINT [PK_type_activity] PRIMARY KEY CLUSTERED 
(
	[id_type_activity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[calendar_schedule]  WITH CHECK ADD  CONSTRAINT [FK_calendar_schedule_plan] FOREIGN KEY([id_plan])
REFERENCES [dbo].[plan] ([id_plan])
GO
ALTER TABLE [dbo].[calendar_schedule] CHECK CONSTRAINT [FK_calendar_schedule_plan]
GO
ALTER TABLE [dbo].[calendar_schedule]  WITH CHECK ADD  CONSTRAINT [FK_calendar_schedule_type_activity] FOREIGN KEY([id_type_activity])
REFERENCES [dbo].[type_activity] ([id_type_activity])
GO
ALTER TABLE [dbo].[calendar_schedule] CHECK CONSTRAINT [FK_calendar_schedule_type_activity]
GO
ALTER TABLE [dbo].[competencies_plan]  WITH CHECK ADD  CONSTRAINT [FK_competencies_plan_competencies] FOREIGN KEY([id_competencies])
REFERENCES [dbo].[competencies] ([id_competencies])
GO
ALTER TABLE [dbo].[competencies_plan] CHECK CONSTRAINT [FK_competencies_plan_competencies]
GO
ALTER TABLE [dbo].[competencies_plan]  WITH CHECK ADD  CONSTRAINT [FK_competencies_plan_plan] FOREIGN KEY([id_plan])
REFERENCES [dbo].[plan] ([id_plan])
GO
ALTER TABLE [dbo].[competencies_plan] CHECK CONSTRAINT [FK_competencies_plan_plan]
GO
ALTER TABLE [dbo].[discipline_indicator_type]  WITH CHECK ADD  CONSTRAINT [FK_discipline_indicator_type_discipline_plan] FOREIGN KEY([id_discipline_plan])
REFERENCES [dbo].[discipline_plan] ([id_discipline_plan])
GO
ALTER TABLE [dbo].[discipline_indicator_type] CHECK CONSTRAINT [FK_discipline_indicator_type_discipline_plan]
GO
ALTER TABLE [dbo].[discipline_indicator_type]  WITH CHECK ADD  CONSTRAINT [FK_discipline_indicator_type_indicator] FOREIGN KEY([id_indicator])
REFERENCES [dbo].[indicator] ([id_indicator])
GO
ALTER TABLE [dbo].[discipline_indicator_type] CHECK CONSTRAINT [FK_discipline_indicator_type_indicator]
GO
ALTER TABLE [dbo].[discipline_indicator_type]  WITH CHECK ADD  CONSTRAINT [FK_discipline_indicator_type_indicator_type] FOREIGN KEY([id_indicator_type])
REFERENCES [dbo].[indicator_type] ([id_indicator_type])
GO
ALTER TABLE [dbo].[discipline_indicator_type] CHECK CONSTRAINT [FK_discipline_indicator_type_indicator_type]
GO
ALTER TABLE [dbo].[discipline_plan]  WITH CHECK ADD  CONSTRAINT [FK_discipline_plan_discipline] FOREIGN KEY([id_discipline])
REFERENCES [dbo].[discipline] ([id_discipline])
GO
ALTER TABLE [dbo].[discipline_plan] CHECK CONSTRAINT [FK_discipline_plan_discipline]
GO
ALTER TABLE [dbo].[discipline_plan]  WITH CHECK ADD  CONSTRAINT [FK_discipline_plan_plan] FOREIGN KEY([id_plan])
REFERENCES [dbo].[plan] ([id_plan])
GO
ALTER TABLE [dbo].[discipline_plan] CHECK CONSTRAINT [FK_discipline_plan_plan]
GO
ALTER TABLE [dbo].[discipline_term]  WITH CHECK ADD  CONSTRAINT [FK_discipline_term_discipline_plan] FOREIGN KEY([id_discipline_plan])
REFERENCES [dbo].[discipline_plan] ([id_discipline_plan])
GO
ALTER TABLE [dbo].[discipline_term] CHECK CONSTRAINT [FK_discipline_term_discipline_plan]
GO
ALTER TABLE [dbo].[indicator_calendar_schedule]  WITH CHECK ADD  CONSTRAINT [FK_indicator_calendar_schedule_calendar_schedule] FOREIGN KEY([id_calendar_schedule])
REFERENCES [dbo].[calendar_schedule] ([id_calendar_schedule])
GO
ALTER TABLE [dbo].[indicator_calendar_schedule] CHECK CONSTRAINT [FK_indicator_calendar_schedule_calendar_schedule]
GO
ALTER TABLE [dbo].[indicator_calendar_schedule]  WITH CHECK ADD  CONSTRAINT [FK_indicator_calendar_schedule_indicator] FOREIGN KEY([id_indicator])
REFERENCES [dbo].[indicator] ([id_indicator])
GO
ALTER TABLE [dbo].[indicator_calendar_schedule] CHECK CONSTRAINT [FK_indicator_calendar_schedule_indicator]
GO
ALTER TABLE [dbo].[indicator_calendar_schedule]  WITH CHECK ADD  CONSTRAINT [FK_indicator_calendar_schedule_indicator_type] FOREIGN KEY([id_indicator_type])
REFERENCES [dbo].[indicator_type] ([id_indicator_type])
GO
ALTER TABLE [dbo].[indicator_calendar_schedule] CHECK CONSTRAINT [FK_indicator_calendar_schedule_indicator_type]
GO
ALTER TABLE [dbo].[indicator_competencies]  WITH CHECK ADD  CONSTRAINT [FK_indicator_competencies_competencies] FOREIGN KEY([id_competencies])
REFERENCES [dbo].[competencies] ([id_competencies])
GO
ALTER TABLE [dbo].[indicator_competencies] CHECK CONSTRAINT [FK_indicator_competencies_competencies]
GO
ALTER TABLE [dbo].[indicator_competencies]  WITH CHECK ADD  CONSTRAINT [FK_indicator_competencies_indicator] FOREIGN KEY([id_indicator])
REFERENCES [dbo].[indicator] ([id_indicator])
GO
ALTER TABLE [dbo].[indicator_competencies] CHECK CONSTRAINT [FK_indicator_competencies_indicator]
GO
