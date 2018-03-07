USE [PetTesting]
GO
/****** Object:  StoredProcedure [dbo].[AircraftsCRUD]    Script Date: 08/01/2018 17:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[EMPLOYES_CRUD]
@crudinstr varchar(25),
@EmployeeID varchar(25)=null,
@SalaryID varchar(25)=null

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
		
		IF @SalaryID=0 OR NOT EXISTS(SELECT SALARY_ID FROM SALARIES WHERE SALARY_ID=@SalaryID)
		BEGIN
			set @createOK = 0
			print('No such salary ID')
		END
		IF @EmployeeID=0 OR NOT EXISTS(SELECT Employee_ID FROM TRAINERS WHERE EMPLOYEE_ID=@EmployeeID)
		BEGIN
			set @createOK = 0
			print('No such Trainer ID')
		END

		IF @createOK = 1
		BEGIN
			INSERT INTO EMPLOYES
			VALUES(@EmployeeID,@SalaryID)
			PRINT 'Successfully inserted!'
		END
	END

	IF @crudinstr = 'READ'
	BEGIN
		IF NOT EXISTS(SELECT SALARY_ID FROM SALARIES WHERE SALARY_ID=@SalaryID)
		BEGIN
			set @readOK = 0
			print('No such Salary ID')
		END

		IF @readOK = 1
		BEGIN
			SELECT * FROM EMPLOYES WHERE EMPLOYES.SALARY_ID=@SalaryID
			PRINT 'Successfully read!'
		END
	END

	IF @crudinstr = 'UPDATE'
	BEGIN
		IF @EmployeeID=0
		BEGIN
			set @updateOK = 0
			print('Employee id cannot be null.')
		END
		
		IF @SalaryID=0 OR NOT EXISTS(SELECT SALARY_ID FROM SALARIES WHERE SALARY_ID=@SalaryID)
		BEGIN
			set @updateOK = 0
			print('No such Salary ID')
		END


		IF @updateOK = 1
		BEGIN
			UPDATE EMPLOYES
			SET SALARY_ID=@SalaryID
			WHERE EMPLOYEE_ID=@EmployeeID

			PRINT 'Successfully updated!'
		END
	END

	IF @crudinstr='DELETE'
	BEGIN
		IF NOT EXISTS(SELECT Employee_id FROM EMPLOYES WHERE EMPLOYEE_ID=@EmployeeID)
		BEGIN
			set @deleteOK = 0
			print('No such employee ID')
		END

		IF @deleteOK = 1

		BEGIN
			--DELETE FROM Aircraft WHERE AircraftID=@aircraftID
			set @command = 'DELETE FROM Employes WHERE Employee_ID='
			set @command = @command + @EmployeeID
			EXEC (@command)
			PRINT 'Successfully deleted!'
		END
	END
END