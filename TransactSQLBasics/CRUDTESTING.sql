EXEC SALARY_CRUD 'DELETE','6','321321'-- salaryid amount
DECLARE @result varchar(25)
EXEC AGE_CRUD 'DELETE','Cristi','321321', @NAMEo = @result output--name age
print(@result)
EXEC EMPLOYES_CRUD 'DELETE','6','321321'--employeeID salaryID
EXEC TRAINERS_CRUD 'DELETE','6','321321'--emplyeeid name
EXEC CompanyName_CRUD 'DELETE','6','321321'--NAME locul

--testare pt functiile de validare
EXEC AGE_CRUD 'DELETE','Cristi2','321321'--name age
EXEC AGE_CRUD 'CREATE','Cristi','32132a1'--name age