IF(EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME = 'SP_tbl_BoatOwner_Insert'))
BEGIN
	DROP PROCEDURE SP_tbl_BoatOwner_Insert
END
GO

CREATE PROCEDURE SP_tbl_BoatOwner_Insert
(
	@varBoatNum NVARCHAR(20),
	@varBoatOwnerName NVARCHAR(50),
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
				dbo.tbl_BoatOwner
			WHERE 
				BoatNum = @varBoatNum
			AND BoatOwnerName = @varBoatOwnerName
		)
	)
	BEGIN
		SET @varResult = 1
	END
	ELSE
	BEGIN
		INSERT INTO dbo.tbl_BoatOwner
		(
		    BoatNum,
		    BoatOwnerName,
		    DateCreated,
		    CreatedBy,
		    DateLastUpdated,
		    LastUpdatedBy
		)
		VALUES
		(	@varBoatNum,			-- BoatNum - nvarchar(20)
		    @varBoatOwnerName,      -- BoatOwnerName - nvarchar(50)
		    GETDATE(), -- DateCreated - datetime
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
EXEC dbo.SP_tbl_BoatOwner_Insert
	 @varBoatNum		= N'TEST1'
	,@varBoatOwnerName	= N'TEST COMPANY'
	,@varCreatedBy		= N'SYSTEM'
	,@varResult			= @Result OUTPUT
SELECT @Result

SELECT * FROM dbo.tbl_BoatOwner