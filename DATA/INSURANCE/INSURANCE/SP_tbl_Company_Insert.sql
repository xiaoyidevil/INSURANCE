IF(EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME = 'SP_tbl_Company_Insert'))
BEGIN
	DROP PROCEDURE SP_tbl_Company_Insert
END
GO

CREATE PROCEDURE SP_tbl_Company_Insert
(
	@varID			INT,
	@varCompanyCode NVARCHAR(20),
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
				tbl_Company 
			WHERE 
				ID = @varID
			AND CompanyCode = @varCompanyCode
			AND CompanyName = @varCompanyName
		)
	)
	BEGIN
		SET @varResult = 1
	END
	ELSE
	BEGIN
		INSERT INTO tbl_Company
		(
			ID
			,CompanyCode
			,CompanyName
			,DateCreated
			,CreatedBy
			,DateLastUpdated
			,LastUpdatedBy
		)
		VALUES
		(
			@varID			
			,@varCompanyCode 
			,@varCompanyName 
			,GETDATE()
			,@varCreatedBy	
			,NULL
			,NULL
		)
		SET @varResult = 0
	END
	RETURN @varResult
END

GO
--=======================================================================================================================

DECLARE @Result INT
EXEC SP_tbl_Company_Insert
	@varID				= 100000001
	,@varCompanyCode	= N'TEST'
	,@varCompanyName	= N'TEST COMPANY'
	,@varCreatedBy		= N'SYSTEM'
	,@varResult			= @Result OUTPUT
SELECT @Result

