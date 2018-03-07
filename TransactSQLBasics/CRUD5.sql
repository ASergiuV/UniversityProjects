USE [PetTesting]
GO
/****** Object:  StoredProcedure [dbo].[AircraftsCRUD]    Script Date: 08/01/2018 17:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[SALARY_CRUD]
@crudinstr varchar(25),
@SalaryID varchar(25)=null,
@AMOUNT varchar(25)=null

AS
BEGIN
	DECLARE @command varchar(300)
	DECLARE @createOK int
	DECLARE @readOK int
	DECLARE @updateOK int
	DECLARE @deleteOK int

	set @createOK = 1
	set @readOK = 1
	set @updateOK = 1
	set @deleteOK = 1


	IF @crudinstr = 'CREATE'
	BEGIN
		
		
		IF @SalaryID=0
		BEGIN
			set @createOK = 0
			print('Salary Id must not be null')
		END

		IF @createOK = 1
		BEGIN
			INSERT INTO SALARIES
			VALUES(@SalaryID,@AMOUNT)
			PRINT 'Successfully inserted!'
		END
	END

	IF @crudinstr = 'READ'
	BEGIN
	IF @SalaryID=0
		BEGIN
			set @readOK = 0
			print('Salary Id must not be null')
		END


		IF @readOK = 1
		BEGIN
			SELECT * FROM SALARIES WHERE SALARY_ID=@SalaryID
			PRINT 'Successfully read!'
		END
	END

	IF @crudinstr = 'UPDATE'
	BEGIN
		IF @SalaryID=0
		BEGIN
			set @updateOK = 0
			print('Salary Id must not be null')
		END
		IF @AMOUNT=0
		BEGIN
			set @updateOK = 0
			print('Amount must not be null')
		END

		IF @updateOK = 1
		BEGIN
			UPDATE SALARIES
			SET AMOUNT=@AMOUNT
			WHERE SALARY_ID=@SalaryID

			PRINT 'Successfully updated!'
		END
	END

	IF @crudinstr='DELETE'
	BEGIN
		IF NOT EXISTS(SELECT SALARY_ID FROM SALARIES WHERE SALARY_ID=@SalaryID)
		BEGIN
			set @deleteOK = 0
			print('No such employee')
		END
		IF EXISTS(SELECT Employee_id FROM EMPLOYES WHERE SALARY_ID=@SalaryID)
		BEGIN
			set @deleteOK = 0
			print('Employes table depends on this value')
		END

		IF @deleteOK = 1
		BEGIN
			DELETE FROM SALARIES where SALARY_ID=@SalaryID
			--set @command = 'DELETE FROM AGE WHERE NAME='
			--set @command = @command + @NAME
			--EXEC (@command)
			PRINT 'Successfully deleted!'
		END
	END
END

CREATE NONCLUSTERED INDEX TRAINER_index
ON [dbo].TRAINERS(NAME);