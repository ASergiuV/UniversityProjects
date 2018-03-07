USE [PetTesting]
GO

/****** Object:  Index [TRAINER_index]    Script Date: 1/16/2018 12:12:03 PM ******/
CREATE NONCLUSTERED INDEX [TRAINER_index] ON [dbo].[TRAINERS]
(
	[NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


select * from sys.dm_db_index_usage_stats