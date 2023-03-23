create database eshop_db;
use eshop_db;

create table Customer(
customer_id int not null primary key auto_increment,
name varchar(255) not null,
surname varchar(255) not null,
phone int,
email varchar(255)
);

drop table Customer;

create table Cart(
cart_id int not null primary key auto_increment,
description varchar(255) not null,
price decimal(5,2) not null
);

create table Payment(
payment_id int not null primary key auto_increment,
customer_id int not null,
amount decimal(5,2) not null,
bank varchar(255) not null,
payment_status varchar(255) not null,
foreign key(customer_id) references	Customer(customer_id)
);

create table Orders(
order_id int not null primary key auto_increment,
customer_id int not null,
payment_id int not null,
cart_id int not null,
order_status varchar(255) not null,
date date not null,
foreign key(customer_id) references Customer(customer_id),
foreign key(payment_id) references Payment(payment_id),
foreign key(cart_id) references Cart(cart_id)
);

insert into Customer (name, surname, phone, email)
values ("Ieva", "Miknyte", 860324568, "ieva@gmail.com"),
		("Tomas", "Kalnys", 862598745, "tomasgmail.com"),
		("Lina", "Sakiniene", 864578523, "lina@gmail.com"),
        ("Linas", "Karalius", 862565412, "linas.k@gmail.com"),
        ("Jurgita", "Martiene", 865236589, "jurga@yahoo.com"),
        ("Maryte", "Daukaraite", 862545689, "mar@yahoo.com"),
        ("Andrius", "Kairys", 862378523, "andre@mega.lt"),
        ("Ieva", "Kaire", 864582367, "ieva.k@mega.lt"),
        ("Jurate", "Liepaite", 864523145, "jure@yahoo.com"),
        ("Mantas", "Karalius", 867825623, "mantas@mega.lt");
select*from customer;   

insert into Cart (description, price)
values ("virtuvinis komplektas", 900),
		("rasomasis stalas", 50.89),
        ("valgomojo komplektas", 700),
        ("kedes", 150),
        ("prieskambario baldai", 999),
        ("krosnele", 500),
        ("zidinys", 899),
        ("sofa", 902.50),
        ("lova", 490),
        ("lekste", 5.99),
        ("puodelis", 4.99),
        ("virdulys", 25),
        ("puodas", 30.99);
        
insert into Payment (customer_id, amount, bank, payment_status)
values (1, 500, "seb", "payed"),
		(1, 4.99, "seb", "canceled"),
        (2, 150, "swed", "payed"),
        (3, 500, "hansa", "waitting"),
        (3, 25, "seb", "canceled"),
        (3, 5.99, "seb", "payed"),
        (3, 899, "seb", "payed"),
        (3, 4.99, "hansa", "payed"),
        (3, 30.99, "hansa", "canceled"),
        (4, 899, "swed", "payed"),
        (4, 490, "swed", "canceled");
 select*from cart; 
 
insert into Orders (customer_id, payment_id, cart_id, order_status, date)
values (1, 1, 6, "done", "2010-01-25"),
		(1, 2, 11, "cancel", "2010-02-10"),
        (2, 3, 4, "done", "2010-02-28"),
        (3, 4, 6, "new", "2023-02-23"),
        (3, 5, 12, "cancel", "2022-12-25"),
        (3, 6, 10, "done", "2022-10-15"),
        (3, 7, 7, "processing", "2023-01-30"),
        (3, 8, 11, "processing", "2023-02-05"),
        (3, 9, 13, "cancel", "2023-02-15"),
        (4, 10, 7, "done", "2022-05-30"),
        (4, 11, 9, "cancel", "2022-08-25");