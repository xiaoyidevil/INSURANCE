
IF(EXISTS(SELECT * FROM sys.sysobjects WHERE NAME = 'SP_tbl_InsuranceCompany_Select' AND xtype = 'P'))
BEGIN
	DROP PROCEDURE SP_tbl_InsuranceCompany_Select
END
GO

CREATE PROCEDURE SP_tbl_InsuranceCompany_Select
(
	@varCompanyName NVARCHAR(40) = ''
)
AS

BEGIN

	IF(ISNULL(@varCompanyName,'') = '')
	BEGIN
		SELECT
			*
		FROM
			tbl_InsuranceCompany
	END
	ELSE
	BEGIN
		SELECT 
			ID,
			CompanyName
		FROM 
			tbl_InsuranceCompany
		WHERE 
			CompanyName LIKE @varCompanyName + '%'
	END
END
GO
--=======================================================================================================================


exec SP_tbl_InsuranceCompany_Select

