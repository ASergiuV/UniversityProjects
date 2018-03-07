CREATE PROCEDURE usp_v1_upgrade
AS
BEGIN
ALTER TABLE Animals
	ALTER COLUMN Name nvarchar(50)
END
GO

CREATE PROCEDURE usp_v1_revert
AS
BEGIN
ALTER TABLE Animals
	ALTER COLUMN name varchar(50)
END
GO

--proc 2: add default constraint
CREATE PROCEDURE usp_v2_upgrade
AS
BEGIN
ALTER TABLE Food_choices
	ADD CONSTRAINT Constraint1
		DEFAULT 1 FOR FOOD_ID
END
GO

CREATE PROCEDURE usp_v2_revert
AS
BEGIN
ALTER TABLE Food_choices
	DROP CONSTRAINT Constraint1
END
GO

--proc 3: add table(s)

CREATE PROCEDURE usp_v3_upgrade
AS
BEGIN
CREATE TABLE newTable
(
	id int not null 
)
END
GO

CREATE PROCEDURE usp_v3_revert
AS
BEGIN
DROP TABLE newTable
END
GO

--proc 4: add a column
CREATE PROCEDURE usp_v4_upgrade
AS
BEGIN
alter table newTable
add newColumn int not null
END
GO


CREATE PROCEDURE usp_v4_revert
AS
BEGIN
alter table newTable
drop column newColumn
END
GO

--proc 5: create/remove a foreign key constraint
CREATE PROCEDURE usp_v5_upgrade
AS
BEGIN
	ALTER TABLE Animals
		ADD CONSTRAINT fk_ptype FOREIGN KEY (SHELTER_ID) REFERENCES SHELTERS(SHELTER_ID)
END
GO

CREATE PROCEDURE usp_v5_revert
AS
BEGIN
	ALTER TABLE Animals
		DROP CONSTRAINT fk_ptype
END
GO

--main
ALTER PROCEDURE usp_main
@version int
AS
BEGIN
	DECLARE @current int 
	SET @current = (SELECT value FROM version);
	DECLARE @stmt nvarchar(100);
	IF @current<@version
		WHILE @current<@version
			BEGIN
				SET @stmt = 'EXEC usp_v'+CAST(@current AS varchar(2))+'_upgrade'
				EXEC sp_executesql @stmt
				SET @current=@current+1
			END
	ELSE
		WHILE @current>@version
			BEGIN
				SET @current=@current-1
				SET @stmt = 'EXEC usp_v'+CAST(@current AS varchar(2))+'_revert'
				EXEC sp_executesql @stmt
				
			END
	UPDATE version
	SET value=@version;

END

exec usp_v1_upgrade
exec usp_v1_revert

exec usp_v2_upgrade
exec usp_v2_revert

exec usp_v3_upgrade
exec usp_v4_upgrade

exec usp_v4_revert
exec usp_v3_revert

exec usp_v5_upgrade
exec usp_v5_revert



exec usp_main 2