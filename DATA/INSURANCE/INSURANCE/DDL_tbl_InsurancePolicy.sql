IF (EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME = 'tbl_InsurancePolicy' AND XTYPE = 'U')) 
BEGIN
	DROP TABLE tbl_InsurancePolicy
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_InsurancePolicy](
	[ID]					[int],
	[CompanyID]				[int],
	[CompanyName]			[nvarchar](50),
	[EffectiveDateStart]	[datetime],
	[EffectiveDateEnd]		[datetime],
	[ShipOwnerID]			[int],
	[ShipOwnerName]			[nvarchar](50),
	[ShipID]				[int],
	[ShipNo]				[nvarchar](50),
	[ShipName]				[nvarchar](50),
	[DateCreated]			[datetime] NULL,
	[CreatedBy]				[nvarchar](20) NULL,
	[DateLastUpdated]		[datetime] NULL,
	[LastUpdatedBy]			[nvarchar](50) NULL,
CONSTRAINT [PK_tbl_InsuramcePolicy] PRIMARY KEY CLUSTERED
(
	ID ASC,
	CompanyID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投保单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_InsurancePolicy', @level2type=N'COLUMN',@level2name=N'CompanyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投保单位名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_InsurancePolicy', @level2type=N'COLUMN',@level2name=N'CompanyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'保单有效期开始日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_InsurancePolicy', @level2type=N'COLUMN',@level2name=N'EffectiveDateStart'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'保单有效期截止日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_InsurancePolicy', @level2type=N'COLUMN',@level2name=N'EffectiveDateEnd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'船主ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_InsurancePolicy', @level2type=N'COLUMN',@level2name=N'ShipOwnerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'船主名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_InsurancePolicy', @level2type=N'COLUMN',@level2name=N'ShipOwnerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'船只ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_InsurancePolicy', @level2type=N'COLUMN',@level2name=N'ShipID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'船只编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_InsurancePolicy', @level2type=N'COLUMN',@level2name=N'ShipNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'船只名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_InsurancePolicy', @level2type=N'COLUMN',@level2name=N'ShipName'
GO