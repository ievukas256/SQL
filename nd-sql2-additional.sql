-- 1.Pateikite klientus, kurie nuomai išleido 200 ir daugiau. Nuomai išleistą sumą pateikite stulpelyje „Išviso“.Užklausa(2 eilutės)
select p.customer_id,first_name, last_name, sum(amount) as islaidos 
from sakila.payment p
inner join sakila.customer c using(customer_id)
group by customer_id 
having sum(amount)>=200;
-- 2. Paskaičiuokite, kiek nuomai išleido klientas, kurio ID yra 15. Nuomai išleistą sumą pateikite stulpelyje „Išleido“.Užklausa(1 eilutė)
select p.customer_id, sum(amount) as isleido
from sakila.payment p
inner join sakila.customer c using(customer_id)
group by customer_id
having customer_id=15;
-- 3. Parašykite SQL užklausą, kuri suskirstytų klientus pagal jų pirmąją pavardės raidę į tokias kategorijas:Jei pirmoji pavardės raidė yra tarp A ir B, tuomet kategorija “A-B”Jei pirmoji pavardės raidė yra tarp C ir D, tuomet kategorija “C-D”Jei pirmoji pavardės raidė yra tarp E ir F, tuomet kategorija “E-F”Visas kitas pavardes priskirkite kategoriaji “Neaktualūs”.Pavardes atvaizduokite stulpelyje “Pavardė”, o kategorijas –stulpelyje “Pirmoji pavardės raidė”.Užklausa(599 eilutės)
SELECT last_name AS 'Pavarde',
CASE WHEN last_name LIKE 'A%' OR last_name LIKE 'B%' 
THEN 'A-B'
WHEN last_name LIKE 'C%' OR last_name LIKE 'd%' 
THEN 'C-D'WHEN last_name LIKE 'E%' OR last_name LIKE 'F%' 
THEN 'E-F'else 'neaktualūs'END 'Pirmoji pavardes raide'FROM sakila.customer;
-- 4. Parašykite SQL užklausą, pateikiančią, ką klientė, 'BARBARA JONES', išsinuomavo, išsinuomavimo datą (rental_date), grąžinimo datą (return_date), nuomos mokestį (amount). Rezultatą surūšiuokite pagal invetoriaus ID didėjimo tvarka.Užklausa(22 eilutės)
select inventory_id, rental_date, return_date, amount
from sakila.rental r
inner join sakila.payment p using(customer_id)
right join sakila.customer c using(customer_id)
group by inventory_id
having c.first_name="barbara" and c.last_name="jones";
-- 5. Pateikite klientų, kuriuos aptarnavo darbuotas Jon Stephens, vardus, pavardes ir email.Užklausa(599 eilutės)
select first_name, last_name, email 
from customer 
where customer_id in (select distinct(customer_id)
from rental where staff_id in (select staff_idfrom staff where first_name = 'Jon' and last_name = 'Stephens')) ;