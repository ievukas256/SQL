-- 1.Kiek skirtingų prekių buvo išnuomota?
SELECT count(inventory_id) FROM sakila.rental;
-- 2.Top 5 klientai, kurie daugiausia kartų naudojosi nuomos paslaugomis.
SELECT customer_id, count(customer_id)
FROM sakila.rental
GROUP BY customer_id
ORDER BY count(customer_id) desc
LIMIT 5;
-- 3.Išrinkti nuomos id, kurių nuomos ir grąžinimo datos sutampa. Rezultatas: nuomos id, nuomosdata, grąžinimo data. Pateikti mažėjimo tvarka pagal nuomos id (reikalinga papildoma date()funkcija).
SELECT rental_id, rental_date, return_date
FROM sakila.rental
WHERE date(rental_date) = date(return_date)
ORDER BY rental_id desc;
-- 4.Kuris klientas išleido daugiausia pinigų nuomos paslaugoms? Pateikti tik vieną klientą irišleistą pinigų sumą.
 SELECT customer_id, sum(amount)
FROM sakila.payment
GROUP BY customer_id
ORDER BY sum(amount) desc
LIMIT 1;
-- 5.Kiek klientų aptarnavo kiekvienas darbuotojas, kiek nuomos paslaugų pardavė ir už kokiąvertę?
SELECT staff_id, count(staff_id) as aptarnavimu, count(rental_id) as parduotu_paslaugu_kiekis, sum(amount) as sumine_pardavimu_verte
FROM sakila.payment
GROUP BY staff_id;
-- 6.Į ekraną išvesti visus nuomos id, kurie prasideda '9', suskaičiuoti jų vertę, pateikti nuomažiausio nuomos id.
SELECT * 
FROM sakila.payment
WHERE rental_id like '9%'
ORDER BY rental_id asc;
-- 6.2
SELECT sum(amount)
FROM sakila.payment
 WHERE rental_id like '9%';
SELECT SUM(sub.amount)
	FROM
	(
	SELECT *
	FROM sakila.payment
	WHERE rental_id like '9%'
	ORDER BY rental_id asc
	) as sub;
-- 7.Kurios kategorijos filmų yra mažiausiai?
SELECT category_id, count(category_id)
FROM sakila.film_category
GROUP BY category_id
ORDER BY count(category_id) asc
LIMIT 1;
-- 8.Į ekraną išvesti filmų aprašymus, kurių reitingas 'R' ir aprašyme yra žodis 'MySQL'.
SELECT description
FROM sakila.film
WHERE rating = 'R' and description like '%MySQL%';
-- 9.Surasti filmų id, kurių trukmė 46, 47, 48, 49, 50, 51 minutės. Rezultatas:pateikiamasdidėjančia tvarka pagal trukmę.
SELECT film_id
FROM film
WHERE length = 46 or length = 47 or length = 48 or length = 49 or length = 50 or length = 51
ORDER BY length asc;
-- 10.Į ekranąišvesti filmų pavadinimus, kurie prasideda raidė 'G' ir filmo trukmė mažesnė nei 70minučių.
SELECT title
FROM sakila.film
WHERE title like 'G%' and length < 70;
-- 11.Suskaičiuoti, kiek yra aktorių, kurių pirmoji vardo raidė yra 'A', o pirmoji pavardės raidė 'W'.
SELECT count(actor_id)
FROM sakila.actor
WHERE first_name like 'A%' and last_name like 'W%';
-- 12.Suskaičiuoti kiek yra klientų, kurių pavardėje yra dvi O raidės ('OO').
SELECT count(actor_id)
FROM sakila.actor
WHERE last_name like '%OO%';
-- 13.Kiek rajonuose skirtingų adresų? Pateikti tuos rajonus, kurių adresų skaičius didesnis arbalygus 9.
SELECT district, count(address)
FROM sakila.address
GROUP BY district
HAVING count(address) >= 9;
-- 14.Į ekraną išvesti visus unikalius rajonų pavadinimus, kurie baigiasi raide 'D'.
SELECT distinct district
FROM sakila.address
WHERE district like '%D';
-- 15.Į ekraną išvesti adresus ir rajonus, kurių telefono numeris prasideda ir baigiasi skaičiumi '9'.
SELECT address, district
FROM sakila.address
WHERE phone like '9%9';