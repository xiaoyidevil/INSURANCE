IF(EXISTS(SELECT * FROM sys.sysobjects WHERE name = 'SP_tbl_InstrancePolicy_Insert' AND xtype = 'P'))
BEGIN
	DROP PROCEDURE SP_tbl_InstrancePolicy_Insert
END
GO

CREATE PROCEDURE SP_tbl_InstrancePolicy_Insert 
(
	@varCompanyName					NVARCHAR(50),
	@varBoatNum						NVARCHAR(50),
	@varBoatOwnerName				NVARCHAR(50),
	@varEffectiveDateStart			DATETIME,
	@varEffectiveDateEnd			DATETIME,
	--@varPersonInsuranced			NVARCHAR(10),
	--@varIdentity					NVARCHAR(18),
	@varInsuranceTypeID				INT,
	@varIndustry					NVARCHAR(10),
	@varCreatedBy					NVARCHAR(20),
	@varLastUpdatedBy				NVARCHAR(20),
	@varResult						INT OUTPUT
)
AS	
BEGIN
	DECLARE @tmpID INT

	DECLARE @varInsuranceInjureAmount  AS MONEY
	DECLARE @varInsuranceMedicalAmount AS MONEY

	SELECT 
		@varInsuranceInjureAmount =  AccidentInjury,
		@varInsuranceMedicalAmount = AccidentMedical
	FROM 
		tbl_InsuranceType 
	WHERE
		ID = @varInsuranceTypeID

	SELECT 
		@tmpID = ISNULL([ID],0)
	FROM 
		dbo.tbl_InsurancePolicy
	WHERE 
		BoatNum = @varBoatNum
	AND BoatOwnerName = @varBoatOwnerName
	AND InsuranceInjureAmount = @varInsuranceInjureAmount
	
	IF(@tmpID <> 0)
	BEGIN
		SET @varResult = @tmpID
	END
	ELSE
	BEGIN
		INSERT INTO	dbo.tbl_InsurancePolicy
		(
			CompanyName,
			BoatNum,
			BoatOwnerName,
            EffectiveDateStartNum,
			EffectiveDateStart,
			EffectiveDateEnd,
			--PersonInsuranced,
			--[Identity],
			InsuranceInjureAmount,
			InsuranceMedicalAmount,
			Industry,
			DateCreated,
			CreatedBy,
			DateLastUpdated,
			LastUpdatedBy
		)
		--OUTPUT Inserted.ID
		VALUES
		(   @varCompanyName,		-- CompanyName - nvarchar(50)
			@varBoatNum,			-- BoatNum - nvarchar(20)
			@varBoatOwnerName,      -- BoatOwnerName - nvarchar(50)
			CONVERT(NVARCHAR(6),@varEffectiveDateStart,112),	--EffectiveDateStartNum -int
			@varEffectiveDateStart, -- EffectiveDateStart - datetime
			@varEffectiveDateEnd,	-- EffectiveDateEnd - datetime
			--@varPersonInsuranced,	-- PersonInsuranced - nvarchar(10)
			--@varIdentity,			-- Identity - nvarchar(18)
			@varInsuranceInjureAmount,      -- InsuranceInjureAmount - money
			@varInsuranceMedicalAmount,      -- InsuranceMedicalAmount - money
			@varIndustry,			-- Industry - nvarchar(10)
			GETDATE(),				-- DateCreated - datetime
			@varCreatedBy,			-- CreatedBy - nvarchar(20)
			GETDATE(),				-- DateLastUpdated - datetime
			@varLastUpdatedBy		-- LastUpdatedBy - nvarchar(50)
		)
		SET @varResult = @@IDENTITY
	END
	
END

GO
--============================================================================================

DECLARE @varResult INT;
EXEC dbo.SP_tbl_InstrancePolicy_Insert 
	@varCompanyName = N'大连智昊人力资源服务有限公司',                          -- nvarchar(50)
	@varBoatNum = N'辽瓦渔7524FAAF',                              -- nvarchar(50)
	@varBoatOwnerName = N'胡映强',                        -- nvarchar(50)
	@varEffectiveDateStart = '2021-04-12 14:07:37', -- datetime
	@varEffectiveDateEnd = '2021-05-12 14:07:37',   -- datetime
	--@varPersonInsuranced = N'陈方',                     -- nvarchar(10)
	--@varIdentity = N'522728199403240615',                             -- nvarchar(18)
	@varInsuranceTypeID = 1
	@varIndustry = N'渔业',                             -- nvarchar(10)
	@varCreatedBy = N'SYSTEM',                            -- nvarchar(20)
	@varLastUpdatedBy = N'SYSTEM',                        -- nvarchar(20)
	@varResult = @varResult OUTPUT                  -- int

	SELECT @varResult AS BB


	SELECT * FROM tbl_InstrancePolicy

	IF @varResult <> 0 
	BEGIN
		EXEC SP_tbl_InsurancePersionList_Insert
		@InsurancePolicyID	= @varResult
		,@InsurancePolicyName = N'XYYANG'
		,@InsurancePolicyIdentity = N'123456789123456789'
		,@CreatedBy = N'XYYANG'
	END


