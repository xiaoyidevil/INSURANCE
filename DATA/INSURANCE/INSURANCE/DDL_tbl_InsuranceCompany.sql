IF(EXISTS(SELECT * FROM sys.sysobjects WHERE NAME = 'tbl_InsuranceCompany' AND XTYPE = 'U'))
BEGIN
	DROP TABLE [tbl_InsuranceCompany]
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_InsuranceCompany](
	[ID]				[INT] IDENTITY(1,1) NOT NULL,
	[CompanyName]		NVARCHAR(20) NOT NULL,
	[DateCreated]		DATETIME NULL,
	[CreatedBy]			NVARCHAR(50) NULL,
	[DateLastUpdated]	DATETIME NULL,
	[LastUpdatedBy]		NVARCHAR(50) NULL
 CONSTRAINT [PK_tbl_InsuranceCompany] PRIMARY KEY CLUSTERED 
(
	CompanyName ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty 
@name=N'MS_Description',
 @value=N'CompanyID' ,
 @level0type=N'SCHEMA',
@level0name=N'dbo',
 @level1type=N'TABLE',
@level1name=N'tbl_InsuranceCompany',
 @level2type=N'COLUMN',
@level2name=N'ID'
GO

EXEC sys.sp_addextendedproperty 
@name=N'MS_Description',
 @value=N'公司名' ,
 @level0type=N'SCHEMA',
@level0name=N'dbo',
 @level1type=N'TABLE',
@level1name=N'tbl_InsuranceCompany',
 @level2type=N'COLUMN',
@level2name=N'CompanyName'
GO
