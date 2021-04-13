IF(EXISTS(SELECT * FROM sys.sysobjects WHERE NAME = 'SP_InsurancePolicyDetail_Select' AND xtype = 'P'))
BEGIN
	DROP PROCEDURE SP_InsurancePolicyDetail_Select
END
GO

CREATE PROCEDURE SP_InsurancePolicyDetail_Select
(
	
)