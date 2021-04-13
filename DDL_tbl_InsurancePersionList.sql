IF(EXISTS(SELECT * FROM sys.sysobjects WHERE NAME = 'tbl_InsurancePersionList' AND XTYPE = 'U'))
BEGIN
	DROP TABLE [tbl_InsurancePersionList]
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_InsurancePersionList](
	[ID]						INT IDENTITY(1,1) NOT NULL,
	[InsurancePolicyID]			INT NOT NULL,
	[InsurancePolicyName]		NVARCHAR(50) NOT NULL,
	[InsurancePolicyIdentity]	NVARCHAR(18) NOT NULL,
	[DateCreated]				DATETIME NULL,
	[CreatedBy]					NVARCHAR(50) NULL,
	[DateLastUpdated]			DATETIME NULL,
	[LastUpdatedBy]				NVARCHAR(50) NULL
 CONSTRAINT [PK_tbl_InsurancePersionList] PRIMARY KEY CLUSTERED 
(
	[InsurancePolicyID] ASC,
	[InsurancePolicyName] ASC,
	[InsurancePolicyIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
								@value=N'保险单ID' ,
								@level0type=N'SCHEMA',
								@level0name=N'dbo',
								@level1type=N'TABLE',
								@level1name=N'tbl_InsurancePersionList',
								@level2type=N'COLUMN',
								@level2name=N'InsurancePolicyID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
								@value=N'保险人姓名' ,
								@level0type=N'SCHEMA',
								@level0name=N'dbo',
								@level1type=N'TABLE',
								@level1name=N'tbl_InsurancePersionList',
								@level2type=N'COLUMN',
								@level2name=N'InsurancePolicyName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description',
								@value=N'保险人ID' ,
								@level0type=N'SCHEMA',
								@level0name=N'dbo',
								@level1type=N'TABLE',
								@level1name=N'tbl_InsurancePersionList',
								@level2type=N'COLUMN',
								@level2name=N'InsurancePolicyIdentity'
GO