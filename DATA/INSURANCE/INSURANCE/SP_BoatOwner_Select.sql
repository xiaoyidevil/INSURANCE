
IF(EXISTS(SELECT * FROM sys.sysobjects WHERE NAME = 'SP_BoatOwner_Select' AND xtype = 'P'))
BEGIN
	DROP PROCEDURE SP_BoatOwner_Select
END
GO

CREATE PROCEDURE SP_BoatOwner_Select
AS

BEGIN
	SELECT 
		ID,
		BoatOwnerName 
	FROM 
		tbl_BoatOwner
END
GO


exec SP_BoatOwner_Select