IF(EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME = 'aspnet_PersonalizationAllUsers' AND xtype = 'U'))
BEGIN
	DROP TABLE aspnet_PersonalizationAllUsers
END
GO

/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 2021/04/03 14:33:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO

