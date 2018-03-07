use Examen
USE [examen]
GO
/****** Object:  StoredProcedure [dbo].[proc1]    Script Date: 1/31/2016 11:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

alter procedure [dbo].[proc3]
	@item_id2 varchar(30),
	@part_id2 varchar(30),
	@customer_name varchar(30),
	@customer_addr varchar(30),
	@type varchar(30)
as
BEGIN


	if(isnumeric(@item_id2)=0 and isnumeric(@part_id2)=0)
	BEGIN 
	print 'item id or part id is not numeric exiting procedure'
	goto ending1
	END
	declare @item_id int
	set @item_id = CAST(@item_id2 as int)
	declare @part_id int
	set @part_id = CAST(@part_id2 as int)

	declare @id_customer int
	select @id_customer = c.id from Customers c where name = @customer_name

	declare @id_part int
	select @id_part = m.id from Parts m where m.id = @part_id

	declare @id_item int
	select @id_item = m.id from Items m where m.id = @item_id

	if(@type !='Person' and @type !='Company')
	BEGIN
	print 'customer cannot be added ,wrong type'
	goto ending1
	END

	if(@id_customer is NULL)
	BEGIN
		INSERT INTO Customers (name, address, type)
		VALUES (@customer_name, @customer_addr,@type);
		select @id_customer = c.id from Customers c where name = @customer_name
		print 'customer was not in databese and has been added'
	END

	if(@id_part is not null)
	BEGIN
		insert into Orders(id_customer,part_id,item_id,order_date)
		values(@id_customer,@id_part,null,GETDATE())
		print 'part order has been added'
		goto ending1
	END

	if(@id_item is not null)
	BEGIN
		insert into Orders(id_customer,part_id,item_id,order_date)
		values(@id_customer,null,@id_item,GETDATE())
		print 'item order has been added'
		goto ending1
	END
	print 'no order added'
	ending1:
END



EXEC proc3 '5',null,'nutavi','acasa','Person'--item id,part id, customer name,customer add,cust type
--items 3-6
--parts 1-4
--clients 1-2 dar se adauga singuri 