
IF(EXISTS(SELECT * FROM sys.sysobjects WHERE NAME = 'SP_tbl_BoatOwner_BoatNum_Select' AND xtype = 'P'))
BEGIN
	DROP PROCEDURE SP_tbl_BoatOwner_BoatNum_Select
END
GO

CREATE PROCEDURE SP_tbl_BoatOwner_BoatNum_Select
(
	@varBoatOwnerName	NVARCHAR(50) = '',
	@varBoatNum			NVARCHAR(40) = ''
)
AS

BEGIN
	IF(@varBoatOwnerName = '' AND @varBoatNum = '')
	BEGIN
		SELECT 
			DISTINCT
			BoatNum 
		FROM 
			tbl_BoatOwner
	END

	IF(@varBoatOwnerName = '' AND @varBoatNum <> '')
	BEGIN
		SELECT 
			DISTINCT
			BoatNum 
		FROM 
			tbl_BoatOwner
		WHERE 
			BoatNum like @varBoatNum + '%'
	END

	IF(@varBoatOwnerName <> '' AND @varBoatNum = '')
	BEGIN
		SELECT 
			DISTINCT
			BoatNum 
		FROM 
			tbl_BoatOwner
		WHERE 
			BoatOwnerName	LIKE @varBoatOwnerName + '%'
	END

	IF(@varBoatOwnerName <> '' AND @varBoatNum <> '')
	BEGIN
		SELECT 
			DISTINCT
			BoatNum 
		FROM 
			tbl_BoatOwner
		WHERE 
			BoatNum			LIKE @varBoatNum + '%'
		AND BoatOwnerName	LIKE @varBoatOwnerName + '%'
	END

END
GO
--====================================================================================================================================

exec SP_tbl_BoatOwner_BoatNum_Select 't',''



select * from tbl_BoatOwner