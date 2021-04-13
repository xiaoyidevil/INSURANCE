IF (EXISTS(SELECT * FROM sys.sysobjects WHERE NAME = 'tbl_InsurancePolicy' AND XTYPE = 'U')) 
BEGIN
	DROP TABLE dbo.tbl_InsurancePolicy
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_InsurancePolicy](
	[ID]						INT IDENTITY(1,1) NOT NULL,
	[CompanyName]				NVARCHAR(50) NOT NULL,
	[BoatNum]					NVARCHAR(50) NOT NULL,
	[BoatOwnerName]				NVARCHAR(50) NOT NULL,
	[EffectiveDateStart]		DATETIME NULL,
	[EffectiveDateEnd]			DATETIME NULL,
	[InsuranceInjureAmount]		MONEY NOT NULL,
	[InsuranceMedicalAmount]	MONEY NOT NULL,
	[Industry]					NVARCHAR(10) NOT NULL,
	[DateCreated]				DATETIME NULL,
	[CreatedBy]					NVARCHAR(20) NULL,
	[DateLastUpdated]			DATETIME NULL,
	[LastUpdatedBy]				NVARCHAR(50) NULL,
CONSTRAINT [PK_tbl_InsuramcePolicy] PRIMARY KEY CLUSTERED
(
	[BoatNum]	ASC,	
	[BoatOwnerName]	ASC,
	[InsuranceInjureAmount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'投保单位名称',
                                @level0type = N'SCHEMA',
                                @level0name = N'dbo',
                                @level1type = N'TABLE',
                                @level1name = N'tbl_InsurancePolicy',
                                @level2type = N'COLUMN',
                                @level2name = N'CompanyName';
GO
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'船号',
                                @level0type = N'SCHEMA',
                                @level0name = N'dbo',
                                @level1type = N'TABLE',
                                @level1name = N'tbl_InsurancePolicy',
                                @level2type = N'COLUMN',
                                @level2name = N'BoatNum';
GO
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'船主姓名',
                                @level0type = N'SCHEMA',
                                @level0name = N'dbo',
                                @level1type = N'TABLE',
                                @level1name = N'tbl_InsurancePolicy',
                                @level2type = N'COLUMN',
                                @level2name = N'BoatOwnerName';
GO
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'保单有效期开始日',
                                @level0type = N'SCHEMA',
                                @level0name = N'dbo',
                                @level1type = N'TABLE',
                                @level1name = N'tbl_InsurancePolicy',
                                @level2type = N'COLUMN',
                                @level2name = N'EffectiveDateStart';
GO
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'保单有效期截止日',
                                @level0type = N'SCHEMA',
                                @level0name = N'dbo',
                                @level1type = N'TABLE',
                                @level1name = N'tbl_InsurancePolicy',
                                @level2type = N'COLUMN',
                                @level2name = N'EffectiveDateEnd';
GO
--EXEC sys.sp_addextendedproperty @name = N'MS_Description',
--                                @value = N'被保险人姓名',
--                                @level0type = N'SCHEMA',
--                                @level0name = N'dbo',
--                                @level1type = N'TABLE',
--                                @level1name = N'tbl_InsurancePolicy',
--                                @level2type = N'COLUMN',
--                                @level2name = N'PersonInsuranced';
--GO
--EXEC sys.sp_addextendedproperty @name = N'MS_Description',
--                                @value = N'身份证号',
--                                @level0type = N'SCHEMA',
--                                @level0name = N'dbo',
--                                @level1type = N'TABLE',
--                                @level1name = N'tbl_InsurancePolicy',
--                                @level2type = N'COLUMN',
--                                @level2name = N'Identity';
--GO
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'意外伤害保额',
                                @level0type = N'SCHEMA',
                                @level0name = N'dbo',
                                @level1type = N'TABLE',
                                @level1name = N'tbl_InsurancePolicy',
                                @level2type = N'COLUMN',
                                @level2name = N'InsuranceInjureAmount';
GO
EXEC sys.sp_addextendedproperty @name = N'MS_Description',
                                @value = N'意外医疗保额',
                                @level0type = N'SCHEMA',
                                @level0name = N'dbo',
                                @level1type = N'TABLE',
                                @level1name = N'tbl_InsurancePolicy',
                                @level2type = N'COLUMN',
                                @level2name = N'InsuranceMedicalAmount';
GO