USE [PetTesting]
GO
/****** Object:  StoredProcedure [dbo].[AircraftsCRUD]    Script Date: 08/01/2018 17:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dbo].[TRAINERS_CRUD]
@crudinstr varchar(25),
@EmployeeID varchar(25)=null,
@NAME varchar(25)=null

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
		
		
		IF @EmployeeID=0
		BEGIN
			set @createOK = 0
			print('Employee Id must not be null')
		END

		IF @createOK = 1
		BEGIN
			INSERT INTO TRAINERS
			VALUES(@EmployeeID,@NAME)
			PRINT 'Successfully inserted!'
		END
	END

	IF @crudinstr = 'READ'
	BEGIN
		IF @EmployeeID=0
		BEGIN
			set @readOK = 0
			print('Employee Id must not be null')
		END


		IF @readOK = 1
		BEGIN
			SELECT * FROM TRAINERS WHERE EMPLOYEE_ID=@EmployeeID
			PRINT 'Successfully read!'
		END
	END

	IF @crudinstr = 'UPDATE'
	BEGIN
		IF @NAME is null
		BEGIN
			set @updateOK = 0
			print('NAME cannot be null.')
		END
		IF @EmployeeID=0
		BEGIN
			set @updateOK = 0
			print('Employee Id must not be null')
		END

		IF @updateOK = 1
		BEGIN
			UPDATE TRAINERS
			SET NAME=@NAME
			WHERE EMPLOYEE_ID=@EmployeeID

			PRINT 'Successfully updated!'
		END
	END

	IF @crudinstr='DELETE'
	BEGIN
		IF NOT EXISTS(SELECT NAME FROM TRAINERS WHERE EMPLOYEE_ID=@EmployeeID)
		BEGIN
			set @deleteOK = 0
			print('No such employee')
		END

		IF @deleteOK = 1
		BEGIN
			DELETE FROM TRAINERS where EMPLOYEE_ID=@EmployeeID
			--set @command = 'DELETE FROM AGE WHERE NAME='
			--set @command = @command + @NAME
			--EXEC (@command)
			PRINT 'Successfully deleted!'
		END
	END
END