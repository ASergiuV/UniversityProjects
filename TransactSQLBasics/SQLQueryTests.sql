USE [PetTesting]
GO
/****** Object:  StoredProcedure [dbo].[RunTest]    Script Date: 19/12/2017 11:42:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[RunTest] 
@testName varchar(50)
AS
BEGIN
	DELETE FROM EMPLOYES
	DELETE FROM TRAINERS
	DELETE FROM SALARIES


	DECLARE @testID int
	DECLARE @position int
	DECLARE @tableID int
	DECLARE @rowsNo int
	DECLARE @objName varchar(50)
	DECLARE @endTime DATETIME
	DECLARE @startTime DATETIME
	DECLARE @command varchar(100)
	DECLARE @viewPos int
	DECLARE @viewID int
	DECLARE @testRunID int
	SELECT @testID = Tests.TestID FROM Tests WHERE Tests.Name = @testName

	SET @startTime = GETDATE()

	
	INSERT INTO TestRuns(Description,StartAt,EndAt)
	VALUES('descriere',@startTime,@startTime)
	SET @testRunID = @@IDENTITY

	SET @position = 1 

	--INSERTING PART
	WHILE EXISTS(SELECT TableID FROM TestTables WHERE TestTables.TestID = @testID AND TestTables.Position = @position)
	BEGIN

		SELECT @tableID = TableID, @rowsNo = NoOfRows
		FROM TestTables	
		WHERE TestTables.TestID=@testID AND TestTables.Position=@position

		SELECT @objName = [Name]
		FROM Tables
		WHERE Tables.TableID=@tableID

		SET @startTime = GETDATE()

		SET @command = 'EXEC load'+ @objName+' ' + cast(@rowsNo as varchar(4))
		EXEC (@command)

		SET @endTime = GETDATE()

		INSERT INTO TestRunTables(TestRunID,TableID,StartAt,EndAt)
		VALUES(@testRunID,@tableID,@startTime,@endTime)
		

		SET @position = @position + 1

	END

	--VIEWS PART
	SET @viewPos = 1
	WHILE EXISTS(SELECT  ViewID FROM DBO.TestViews T WHERE T.TestID = @testID AND T.ViewID = @viewPos )	
	BEGIN
		SELECT @viewID = ViewID FROM DBO.TestViews T WHERE T.TestID = @testID AND T.ViewID = @viewPos
		SELECT @objName = v.Name FROM DBO.Views v WHERE v.ViewID =  @viewID

		SET @startTime = GETDATE()
		SET @command = 'SELECT * FROM '+@objName
		EXEC (@command)

		SET @endTime = GETDATE()
		INSERT INTO TestRunView)s(TestRunID,ViewID,StartAt,EndAt)
		VALUES(@testRunID,@viewPos,@startTime,@endTime
		SET @viewPos = @viewPos + 1
	END

	--DELETE PART
	
	WHILE @position > 0
	BEGIN

		SET @position = @position - 1

		SELECT @tableID = TableID,@rowsNo = NoOfRows FROM DBO.TestTables T WHERE T.TestID = @testID AND T.Position = @position
		SELECT @objName = t.Name FROM DBO.Tables t where t.TableID = @tableID
		SET @rowsNo = @rowsNo + 1
		DECLARE @deleteCommand varchar(70)
		SET @deleteCommand = 'EXEC dbo.delete'+@objName+' '+cast(@rowsNo as varchar(4))
		EXEC (@deleteCommand)

		SET @endTime = GETDATE()
		UPDATE TestRunTables -- update testruntables endTime
		SET TestRunTables.EndAt = @endTime
		WHERE TestRunTables.TestRunID = @testID AND TestRunTables.TableID = @tableID

	END

	--Update test runs end time
	SET @endTime = GETDATE()
	UPDATE TestRuns
	SET TestRuns.EndAt = @endTime
	WHERE TestRuns.TestRunID = @testRunID

END

exec RunTest testNo1