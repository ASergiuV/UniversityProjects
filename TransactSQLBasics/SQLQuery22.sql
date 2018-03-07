USE [PetTesting]
GO
/****** Object:  StoredProcedure [dbo].[AGE_CRUD]    Script Date: 1/16/2018 12:05:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[AGE_CRUD]
@crudinstr varchar(25),
@NAME varchar(25)=null,
@AGE varchar(25)=null

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
	IF dbo.checkString(@NAME)=0
	begin
	set @createOK = 0
	print('Not a proper name')
	GOTO FailValidare
	end
	IF dbo.checkNumber(@AGE)=0
	begin
	set @createOK = 0
	print('Age is not numeric only')
	GOTO FailValidare
	end

	IF @crudinstr = 'CREATE'
	BEGIN
		
		
		IF @AGE=0
		BEGIN
			set @createOK = 0
			print('Too young')
		END

		IF @createOK = 1
		BEGIN
			INSERT INTO AGE
			VALUES(@NAME,@AGE)
			PRINT 'Successfully inserted!'
		END
	END

	IF @crudinstr = 'READ'
	BEGIN
		IF @AGE=0
		BEGIN
			set @readOK = 0
			print('Too young')
		END

		IF @readOK = 1
		BEGIN
			SELECT * FROM Age WHERE Age=@AGE
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

		IF @updateOK = 1
		BEGIN
			UPDATE Age
			SET AGE=@AGE
			WHERE NAME=@NAME

			PRINT 'Successfully updated!'
		END
	END

	IF @crudinstr='DELETE'
	BEGIN
		IF NOT EXISTS(SELECT NAME FROM AGE WHERE NAME=@NAME)
		BEGIN
			set @deleteOK = 0
			print('No such employee')
		END

		IF @deleteOK = 1
		BEGIN
			DELETE FROM AGE WHERE NAME=@NAME
			--set @command = 'DELETE FROM AGE WHERE NAME='
			--set @command = @command + @NAME
			--EXEC (@command)
			PRINT 'Successfully deleted!'
		END

	END
	FailValidare:
END