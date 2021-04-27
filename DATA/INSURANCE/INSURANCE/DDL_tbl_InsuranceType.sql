IF(EXISTS(SELECT * FROM sys.sysobjects WHERE NAME = 'tbl_InsuranceType' AND XTYPE = 'U'))
BEGIN
	DROP TABLE [tbl_InsuranceType]
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_InsuranceType](
	[ID]				[INT] IDENTITY(1,1) NOT NULL,
	[InsuranceType]		NVARCHAR(50) NOT NULL,
	[AccidentInjury]	MONEY NOT NULL,
	[AccidentMedical]	MONEY NOT NULL,
	[DateCreated]		DATETIME NULL,
	[CreatedBy]			NVARCHAR(50) NULL,
	[DateLastUpdated]	DATETIME NULL,
	[LastUpdatedBy]		NVARCHAR(50) NULL
 CONSTRAINT [PK_tbl_InsuranceType] PRIMARY KEY CLUSTERED 
(
	[InsuranceType] ASC,
	[AccidentInjury] ASC,
	[AccidentMedical] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty 
			@name=N'MS_Description',
			@value=N'保险类型ID' ,
			@level0type=N'SCHEMA',
			@level0name=N'dbo',
			@level1type=N'TABLE',
			@level1name=N'tbl_InsuranceType',
			@level2type=N'COLUMN',
			@level2name=N'ID'
GO

EXEC sys.sp_addextendedproperty 
			@name=N'MS_Description',
			@value=N'意外伤害' ,
			@level0type=N'SCHEMA',
			@level0name=N'dbo',
			@level1type=N'TABLE',
			@level1name=N'tbl_InsuranceType',
			@level2type=N'COLUMN',
			@level2name=N'AccidentInjury'
GO

EXEC sys.sp_addextendedproperty 
			@name=N'MS_Description',
			@value=N'意外医疗' ,
			@level0type=N'SCHEMA',
			@level0name=N'dbo',
			@level1type=N'TABLE',
			@level1name=N'tbl_InsuranceType',
			@level2type=N'COLUMN',
			@level2name=N'AccidentMedical'
GO