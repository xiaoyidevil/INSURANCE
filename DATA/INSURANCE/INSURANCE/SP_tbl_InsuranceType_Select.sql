
IF(EXISTS(SELECT * FROM sys.sysobjects WHERE NAME = 'SP_tbl_InsuranceType_Select' AND xtype = 'P'))
BEGIN
	DROP PROCEDURE SP_tbl_InsuranceType_Select
END
GO

CREATE PROCEDURE SP_tbl_InsuranceType_Select
(
	@varID INT = 0,
	@varInsuranceType NVARCHAR(40) = ''
)
AS

BEGIN

	IF(ISNULL(@varInsuranceType,'') = '' and @varID = 0)
	BEGIN
		SELECT
			*
		FROM
			tbl_InsuranceType
	END
	

	IF(ISNULL(@varInsuranceType,'') <> '' and @varID = 0)
	BEGIN
		SELECT 
			*
		FROM 
			tbl_InsuranceType
		WHERE 
			InsuranceType LIKE @varInsuranceType + '%'
	END

	IF(ISNULL(@varInsuranceType,'') = '' and @varID <> 0)
	BEGIN
		SELECT 
			*
		FROM 
			tbl_InsuranceType
		WHERE 
			ID = @varID
	END

END
GO
--=======================================================================================================================


exec SP_tbl_InsuranceType_Select 

