IF(EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME = 'SP_tbl_InsuranceCompany_Insert'))
BEGIN
	DROP PROCEDURE SP_tbl_InsuranceCompany_Insert
END
GO

CREATE PROCEDURE SP_tbl_InsuranceCompany_Insert
(
	@varCompanyName NVARCHAR(50),
	@varCreatedBy	NVARCHAR(50),
	@varResult		INT OUTPUT
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
				dbo.tbl_InsuranceCompany
			WHERE 
				CompanyName = @varCompanyName
		)
	)
	BEGIN
		SET @varResult = 1
	END
	ELSE
	BEGIN
		INSERT INTO dbo.tbl_InsuranceCompany
		(
		    CompanyName,
		    DateCreated,
		    CreatedBy,
		    DateLastUpdated,
		    LastUpdatedBy
		)
		VALUES
		(	@varCompanyName,			--CompanyName - nvarchar(20)
		    GETDATE(),					-- DateCreated - datetime
		    @varCreatedBy,       -- CreatedBy - nvarchar(50)
		    GETDATE(), -- DateLastUpdated - datetime
		    N''        -- LastUpdatedBy - nvarchar(50)
		    )

		SET @varResult = 0
	END
	RETURN @varResult
END

GO
--=======================================================================================================================

DECLARE @Result INT
EXEC dbo.SP_tbl_InsuranceCompany_Insert
	 @varCompanyName	= N'TEST1'
	,@varCreatedBy		= N'SYSTEM'
	,@varResult			= @Result OUTPUT
SELECT @Result

SELECT * FROM dbo.tbl_InsuranceCompany

