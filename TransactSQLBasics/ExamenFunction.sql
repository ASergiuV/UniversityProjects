use Examen

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION AvgPrice3
(	
	@PartName varchar(30)
)
RETURNS int
AS
BEGIN
	--declare @returnval int

	--@returnval=
	RETURN(
		SELECT TOP(1) Parts.price
		FROM Parts
		CROSS JOIN (SELECT AVG(price) AS averageA FROM Parts) AS averageA
		Where Parts.name=@PartName
		ORDER BY ABS(averageA.averageA - Parts.price)
	)
	--return @returnval
END

GO
--exec AvgPrice2 --'Picior'
declare @value int
select @value = dbo.AvgPrice2() --'Picior'
print @value

declare @value int
select @value = dbo.AvgPrice3('Picior')
print @value
