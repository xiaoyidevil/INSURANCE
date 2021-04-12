IF(EXISTS(SELECT * FROM sys.sysobjects WHERE NAME = 'tblBoatOwner' AND XTYPE = 'U'))
BEGIN
	DROP TABLE [tblBoatOwner]
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblBoatOwner](
	[ID]				[int] NOT NULL,
	[BoatNum]			[nvarchar](20) NOT NULL,
	[BoatOwnerName]		[nvarchar](50) NOT NULL,
	[DateCreated]		[datetime] NULL,
	[CreatedBy]			[nvarchar](50) NULL,
	[DateLastUpdated]	[datetime] NULL,
	[LastUpdatedBy]		[nvarchar](50) NULL
 CONSTRAINT [PK_tbl_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[BoatNum] ASC,
	[BoatOwnerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'船主ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblBoatOwner', @level2type=N'COLUMN',@level2name=N'ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'船号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblBoatOwner', @level2type=N'COLUMN',@level2name=N'BoatNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'船主姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblBoatOwner', @level2type=N'COLUMN',@level2name=N'BoatOwnerName'
GO