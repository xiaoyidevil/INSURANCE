IF(EXISTS(SELECT * FROM SYS.SYSOBJECTS WHERE NAME = 'SP_tbl_InsurancePersionList_Insert' AND xtype='P'))
BEGIN
	DROP PROCEDURE SP_tbl_InsurancePersionList_Insert
END
GO

CREATE PROCEDURE SP_tbl_InsurancePersionList_Insert
(
	@InsurancePolicyID			INT,
	@InsurancePolicyName		NVARCHAR(50),
	@InsurancePolicyIdentity	NVARCHAR(18),
	@CreatedBy					NVARCHAR(50)
)
AS
BEGIN
	IF(
		NOT EXISTS
		(
			SELECT 
				* 
			FROM 
				[tbl_InsurancePersionList]
			WHERE 
				[InsurancePolicyID]			= @InsurancePolicyID
			AND [InsurancePolicyName]		= @InsurancePolicyName
			AND [InsurancePolicyIdentity]	= @InsurancePolicyIdentity
		)
	)
	BEGIN
		INSERT INTO [tbl_InsurancePersionList]
		(
			InsurancePolicyID
			,InsurancePolicyName
			,InsurancePolicyIdentity
			,DateCreated
			,CreatedBy
			,DateLastUpdated
			,LastUpdatedBy
		)
		VALUES
		(
			@InsurancePolicyID,
			@InsurancePolicyName,
			@InsurancePolicyIdentity,
			GETDATE(),
			@CreatedBy,
			GETDATE(),
			@CreatedBy
		)
	END
END