use eshop_db;
SET SQL_SAFE_UPDATES = 0;

-- lenteles payment tvarkymas
alter table payment add column payed boolean;

update payment 
set payed = true
where payment_status="payed";
select*from payment;

-- atrenkami klientai, kuriu uzsakymai yra uzbaigti 2010 metais
select name, surname, order_status, date
from customer
join orders using (customer_id)
where order_status = "done" and date like "2010%";

-- duomenys is visu lenteliu
select order_id, name, description, order_status, amount, bank
from orders
join customer using(customer_id)
join payment using(payment_id)
join cart using(cart_id)
where order_status="done";

-- klientai nupirke daugiau nei uz 200
select sum(amount) suma, name klientas
from orders
join customer using(customer_id)
join payment on customer.customer_id=payment.customer_id
where payment_status="payed"
group by name
having suma>200
order by suma desc;

-- kiek klientu pirko uz didesne suma nei pirkimo vidurkis
select count(payment_id), amount
from payment
where amount>(
	select avg(amount)
	from payment
)
group by amount
order by amount asc;

-- nustatyti emailu serverius
select email,
case when email like "%gmail.com" then "gmail"
	 when email like "%yahoo.com" then "yahoo"
     when email like "%mega.lt" then "mega"
     else "no identity" end "server"
from customer;

-- unikalus banku pavadinimai
select distinct bank
from payment;

-- kokius mokejimus padare klientas id3 sukuriant laikinaja lentele
create temporary table client3
select *
from customer
left join payment using (customer_id)
where customer_id=3
order by payment_status;
select * from client3;

-- sukurti view
create view canceledPayments as
select sum(amount) canceledSum
from orders
join payment using(payment_id)
where order_status="cancel";
select * from canceledPayments;

-- atnaujinti kliento nr8 telefona
update customer
set phone = null
where customer_id=8;

-- istrinti nr10 klienta
delete from customer
where customer_id=10;

-- prideti nauja klienta
insert into customer(name, surname, phone, email)
values ("Jurgis", "Antanaitis", null, null);
