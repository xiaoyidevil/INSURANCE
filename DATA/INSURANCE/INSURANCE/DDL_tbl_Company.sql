IF(EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME = 'tbl_Company' AND XTYPE = 'U'))
BEGIN
	DROP TABLE tbl_Company
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_Company](
	[ID] [int] NOT NULL,
	[CompanyCode] [nvarchar](20) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[DateCreated] [datetime] NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[DateLastUpdated] [datetime] NULL,
	[LastUpdatedBy] [nvarchar](50) NULL
 CONSTRAINT [PK_tbl_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[CompanyCode] ASC,
	[CompanyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投保单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_InsurancePolicy', @level2type=N'COLUMN',@level2name=N'ID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投保单位编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_InsurancePolicy', @level2type=N'COLUMN',@level2name=N'CompanyCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投保单位名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_InsurancePolicy', @level2type=N'COLUMN',@level2name=N'CompanyName'
GO