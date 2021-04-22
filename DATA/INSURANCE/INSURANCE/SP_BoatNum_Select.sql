
IF(EXISTS(SELECT * FROM sys.sysobjects WHERE NAME = 'SP_BoatNum_Select' AND xtype = 'P'))
BEGIN
	DROP PROCEDURE SP_BoatNum_Select
END
GO

CREATE PROCEDURE SP_BoatNum_Select
(
	@ID INT
)
AS

BEGIN
	SELECT 
		BoatNum 
	FROM 
		tbl_BoatOwner
	WHERE 
		ID = @ID
END
GO


exec SP_BoatNum_Select 1