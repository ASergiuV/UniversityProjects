-- returneaza clientul care are mai multe orderuri  1
SELECT Name
FROM CLIENTS
Where CLIENT_ID IN
(
	Select CLIENT_ID
	From ORDERS
	Group by CLIENT_ID
	Having Count(*)>1
)

--cate animale sunt in fiecare shelter  2
Select SHELTER_ID as 'Temporary Home',Count(*) as 'Animals'
From ANIMALS
where SHELTER_ID between 1 and 3
group by SHELTER_ID
Having SHELTER_ID=1

--salariul angajatului si numele 3
Select s.amount ,e.Employee_id, t.name
From salaries s JOIN EMPLOYEES e
on s.Employee_id=e.Employee_id
JOIN TRAINERS t
On e.EMPLOYEE_ID=t.EMPLOYEE_ID

--ce mancare trebuie sa cumepre clientii pt animalele adoptate 4
select c.name,pf.NAME
from CLIENTS c 
JOIN ORDERS o
ON c.CLIENT_ID=o.client_id
join ANIMALS a
on o.PET_ID=a.PET_ID
join FOOD_CHOICES fc
on fc.PET_ID=a.PET_ID
join PET_FOOD pf
on fc.FOOD_ID=pf.FOOD_ID

--cu cate animale se intelege fiecare animal din shelter 1   5
select distinct( a.name),count(petfr.FRIEND_ID)
from ANIMALS a
Join PET_FRIENDS petfr
on a.PET_ID=petfr.PET_ID
join SHELTERS s
on s.SHELTER_ID=petfr.SHELTER_ID
where petfr.SHELTER_ID=1
group by a.name
--care sunt salariile antrenorilor care au grija de animalele cu mai mult de un friend 6
SELECT s.amount
FROM SALARIES s
join EMPLOYEES e
on s.EMPLOYEE_ID=e.EMPLOYEE_ID
join TRAINERS t
on t.EMPLOYEE_ID=e.EMPLOYEE_ID
join ANIMALS a
on a.TRAINER_ID=t.EMPLOYEE_ID
where a.NAME IN (
	select distinct( a.name)
	from ANIMALS a
	Join PET_FRIENDS petfr
	on a.PET_ID=petfr.PET_ID
	join SHELTERS s
	on s.SHELTER_ID=petfr.SHELTER_ID
	where petfr.SHELTER_ID=1
	group by a.NAME
	HAVING Count(*)>1
	)


--unde lucreaza antrenoorii care au grija de animale care se inteleg bine intre ele 7
select s.location,t.NAME
from SHELTERS s
join ANIMALS a
on a.SHELTER_ID=s.SHELTER_ID
join TRAINERS t
on t.EMPLOYEE_ID=a.TRAINER_ID
where a.NAME IN (
	select distinct( a.name)
	from ANIMALS a
	Join PET_FRIENDS petfr
	on a.PET_ID=petfr.PET_ID
	join SHELTERS s
	on s.SHELTER_ID=petfr.SHELTER_ID
	where petfr.SHELTER_ID=1
	group by a.NAME
	HAVING Count(*)>1
	)

--care este ingrijtorul animalului care este adoptat de clientul 1  8
select c.name,cl.name as 'client name',a.NAME as 'pet name'
from CARERS c
join ANIMALS a
on c.PET_ID=a.PET_ID
join ORDERS o
on o.PET_ID=a.PET_ID
join CLIENTS cl
on o.CLIENT_ID=cl.CLIENT_ID
where cl.CLIENT_ID=1


--care eswte antrenorul animalului adoptat de client 1    9
select distinct t.name,cl.name as 'client name'--,a.NAME as 'pet name'
from trainers t
join ANIMALS a
on t.EMPLOYEE_ID=a.TRAINER_ID
join ORDERS o
on o.PET_ID=a.PET_ID
join CLIENTS cl
on o.CLIENT_ID=cl.CLIENT_ID
where cl.CLIENT_ID=1


--ce mancare mananca animalul adoptat si ce animal ar putea fi adoptat ca sa se inteleaga 10
select distinct c.name,pfood.NAME,pf.FRIEND_ID
from CLIENTS c
join ORDERS o on o.CLIENT_ID=c.CLIENT_ID
join ANIMALS a on a.PET_ID=o.PET_ID
join PET_FRIENDS pf on pf.PET_ID=a.PET_ID
join FOOD_CHOICES fc on fc.PET_ID=a.PET_ID
join PET_FOOD pfood on pfood.FOOD_ID=fc.FOOD_ID

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
					where c.CLIENT_ID=1
					)
			group by fc.FOOD_ID
			order by count(fc.pet_id) Desc)


exec food_client_shelter @Param1=1