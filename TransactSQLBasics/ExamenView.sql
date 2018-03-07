CREATE VIEW MostBought
AS
Select top(3) model
from Items i
group by model
Order by (Select Count(*)
			from Items i2
			inner join Orders o
			ON i2.id=o.item_id
			where i.model=i2.model) DESC

