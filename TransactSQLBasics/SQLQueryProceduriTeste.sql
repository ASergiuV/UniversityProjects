CREATE VIEW TrainerView AS SELECT * FROM TRAINERS
GO

CREATE VIEW EmployeeView AS SELECT Trainers.EMPLOYEE_ID, EMPLOYES.SALARY_ID FROM TRAINERS
	INNER JOIN EMPLOYES ON Trainers.EMPLOYEE_ID = EMPLOYES.EMPLOYEE_ID
GO

CREATE VIEW SalaryView AS Select SALARIES.SALARY_ID,SALARIES.AMOUNT From SALARIES
GO


CREATE PROCEDURE loadTrainers
@NrOfRows int 
AS
BEGIN
	
	DECLARE @Id int 
	SET @Id = 1

	while @NrOfRows != 0
	BEGIN
		INSERT INTO TRAINERS VALUES (@Id, 'Test')
		SET @Id = @Id + 1
		SET @NrOfRows = @NrOfRows - 1
	END 

END
Go

CREATE PROCEDURE loadSalaries
@NrOfRows int 
AS
BEGIN
	
	DECLARE @Id int 
	SET @Id = 1

	while @NrOfRows != 0
	BEGIN
		INSERT INTO SALARIES VALUES (@Id, 4000)
		SET @Id = @Id + 1
		SET @NrOfRows = @NrOfRows - 1
	END 

END
Go
ALTER PROCEDURE loadEmployees
@NrOfRows int 
AS
BEGIN
	
	DECLARE @Id int 
	SET @Id = 1

	while @NrOfRows != 0
	BEGIN
		INSERT INTO EMPLOYES VALUES (@Id, @Id)
		SET @Id = @Id + 1
		SET @NrOfRows = @NrOfRows - 1
	END 

END
Go

CREATE PROCEDURE deleteEmployees
@number int 
AS
BEGIN
	while @number != 0
	BEGIN
		SET @number = @number - 1
		DELETE FROM EMPLOYEES
		WHERE EMPLOYEE_ID=@number
		
	END 

END
Go

CREATE PROCEDURE deleteTrainers
@number int 
AS
BEGIN
	while @number != 0
	BEGIN
		SET @number = @number - 1
		DELETE FROM EMPLOYEES
		WHERE EMPLOYEE_ID=@number
		
	END 


END
Go

CREATE PROCEDURE deleteSalaries
@number int 
AS
BEGIN
	while @number != 0
	BEGIN
		SET @number = @number - 1
		DELETE FROM EMPLOYES
		WHERE EMPLOYEE_ID=@number
		
	END 


END
Go