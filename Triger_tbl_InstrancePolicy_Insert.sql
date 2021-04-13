IF(EXISTS(SELECT * FROM SYS.sysobjects WHERE name = 'Triger_tbl_InstrancePolicy_Insert' AND xtype = 'TR'))
BEGIN
	DROP TRIGGER Triger_tbl_InstrancePolicy_Insert
END
GO

CREATE TRIGGER [dbo].[Triger_tbl_InstrancePolicy_Insert] ON [dbo].[tbl_InsurancePolicy]
FOR INSERT 
AS

DECLARE @tmpBoatNum NVARCHAR(20)
DECLARE @tmpBoatOwnerName NVARCHAR(50)
DECLARE @tmpCreatedBy	NVARCHAR(50)
DECLARE @tmpResult		INT 

SELECT @tmpBoatNum = [BoatNum], @tmpBoatOwnerName = [BoatOwnerName], @tmpCreatedBy = [CreatedBy] FROM inserted

DECLARE @Result INT
EXEC [dbo].[SP_tbl_BoatOwner_Insert]
	 @varBoatNum		= @tmpBoatNum
	,@varBoatOwnerName	= @tmpBoatOwnerName
	,@varCreatedBy		= @tmpCreatedBy
	,@varResult			= @Result OUTPUT

SET ANSI_NULLS ON
GO

