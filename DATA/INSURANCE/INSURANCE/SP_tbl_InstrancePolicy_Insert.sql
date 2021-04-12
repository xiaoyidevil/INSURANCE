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
	@varInsuranceInjureAmount		MONEY,
	@varInsuranceMedicalAmount		MONEY,
	@varIndustry					NVARCHAR(10),
	@varCreatedBy					NVARCHAR(20),
	@varLastUpdatedBy				NVARCHAR(20),
	@varResult						INT OUTPUT
)
AS	
BEGIN

	IF
	(
		EXISTS
		(
			SELECT 
				1 
			FROM 
				dbo.tbl_InsurancePolicy
			WHERE 
				BoatNum = @varBoatNum
			AND BoatOwnerName = @varBoatOwnerName
			AND InsuranceInjureAmount = @varInsuranceInjureAmount
		)
	)
	BEGIN
		SET @varResult = 0
	END
	ELSE
	BEGIN
		INSERT INTO	dbo.tbl_InsurancePolicy
		(
			CompanyName,
			BoatNum,
			BoatOwnerName,
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
	@varInsuranceInjureAmount = 700000,               -- money
	@varInsuranceMedicalAmount = 70000,              -- money
	@varIndustry = N'渔业',                             -- nvarchar(10)
	@varCreatedBy = N'杨晓轶',                            -- nvarchar(20)
	@varLastUpdatedBy = N'杨晓轶',                        -- nvarchar(20)
	@varResult = @varResult OUTPUT                  -- int

	SELECT @varResult

	


	SELECT * FROM tbl_InsurancePolicy