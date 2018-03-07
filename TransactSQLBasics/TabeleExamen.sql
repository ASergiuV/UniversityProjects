USE Examen
go

create table Customers(
	id int identity not null primary key,
	name varchar(30),
	address varchar(30),
	type varchar(30)
	);
go
ALTER TABLE Customers
--DROP chk_val
ADD CONSTRAINT chk_val2 CHECK (type in ('Person','Company'))

create table Items(
	id int identity not null primary key,
	serial_number int,
	model varchar(30),
	man_country varchar(30)

	);
go

create table Parts(
	id int identity not null primary key,
	name varchar(30),
	model varchar(30),
	price int
	);
go
ALTER TABLE Items
--DROP chk_val
ADD CONSTRAINT chk_val CHECK (man_country in ('Sweden','Norway','Poland'))
DROP chk_val
create table Orders(
	id int identity not null primary key,
	id_customer int foreign key references Customers(id),
	part_id INT NULL,
    FOREIGN KEY (part_id) REFERENCES Parts(id),
	item_id INT NULL,
    FOREIGN KEY (item_id) REFERENCES Items(id),
	order_date datetime,
	--delivery_id INT NULL,
    --FOREIGN KEY (delivery_id) REFERENCES Deliveries(id)
	);
go



create table PartsInItems(
	id_item int foreign key references Items(id),
	id_part int foreign key references Parts(id)
	);
go

--todo
create table Order_deliv(
	id_Order int foreign key references Orders(id),
	id_deliv int foreign key references Deliveries(id)
	)
create table Deliveries(
	id int identity not null primary key,
	id_customer int foreign key references Customers(id),
	Deliv_date datetime
	);
go