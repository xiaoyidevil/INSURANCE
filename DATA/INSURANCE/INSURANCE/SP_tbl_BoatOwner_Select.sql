
IF(EXISTS(SELECT * FROM sys.sysobjects WHERE NAME = 'SP_tbl_BoatOwner_Select' AND xtype = 'P'))
BEGIN
	DROP PROCEDURE SP_tbl_BoatOwner_Select
END
GO

CREATE PROCEDURE SP_tbl_BoatOwner_Select
(
	@varBoatOwner NVARCHAR(100) = ''
)
AS

BEGIN

	IF(ISNULL(@varBoatOwner,'') = '') 
	BEGIN
		SELECT 
			ID,
			BoatOwnerName 
		FROM 
			tbl_BoatOwner
	END
	ELSE
	BEGIN
		SELECT 
			DISTINCT
			ID,
			BoatOwnerName 
		FROM 
			tbl_BoatOwner
		WHERE 
			BoatOwnerName LIKE @varBoatOwner + '%'
	END

END
GO


exec SP_tbl_BoatOwner_Select 'test'

exec SP_tbl_BoatOwner_INSERT
	@varBoatNum			='liaoaaa12345'
	,@varBoatOwnerName	='test owner'
	,@varCreatedBy		='system'
	,@varResult			=0

	BoatOwnerName
test owner