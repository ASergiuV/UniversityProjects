USE [Pet_Shelter]
GO
/****** Object:  StoredProcedure [dbo].[sp_test]    Script Date: 10/31/2017 1:26:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_test]
	-- Add the parameters for the stored procedure here
	@Param1 int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--mancarea cea mai mancata in shelterul unde sta animalul adoptat de client
select pfood.name
from PET_FOOD pfood
where pfood.FOOD_ID =
			(select top 1 fc.FOOD_ID
			from FOOD_CHOICES fc
			join ANIMALS a on fc.PET_ID=a.PET_ID
			where a.SHELTER_ID =
					(select a.SHELTER_ID
					from ANIMALS a
					join ORDERS o on o.PET_ID=a.PET_ID
					join CLIENTS c on c.CLIENT_ID=o.ORDER_Id
					where c.CLIENT_ID=@Param1
					)
			group by fc.FOOD_ID
			order by count(fc.pet_id) Desc)
END
