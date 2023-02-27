-- 1. Susumuoti filmų nuomos trukmes.
select SUM(rental_duration) as suma from sakila.film;
-- 2. Suskaičiuoti, kiek yra skirtingu rating reikšmių.
select count(distinct rating) as rating_sum from sakila.film;
-- 3. Išrinkti unikalias rating reikšmes.
select distinct rating from sakila.film;
-- 4. Susumuoti filmų nuomos trukmes pagal rating dimensiją.
select sum(rental_duration) as suma, rating from sakila.film group by rating;
-- 5. Pateikti trumpiausią ir ilgiausią nuomos trukmes.
select min(length), max(length) from sakila.film;
-- 6. Išrinkti visus filmus, kurių nuomos trukmė didesnė arba lygi 6.
select film_id, title, description, rental_duration from sakila.film where rental_duration>=6;
-- 7. Kiek yra tokių filmų, kurių nuomos trukmė didesnė arba lygi 6?
select count(film_id) from sakila.film where rental_duration>=6;
-- 8. Suskaičiuoti vidutinę nuomos trukmę, pagal dimensijas rating ir special_features.
select avg(rental_duration), rating, special_features from sakila.film group by rating, special_features;
-- 9. Susumuoti replacement_cost pagal dimensiją special_features ir rezultatą pateikti mažėjimo tvarka.
select sum(replacement_cost) as suma, special_features from sakila.film group by special_features order by suma desc;
-- 10. Išrinkti filmus, kurių pavadinimai prasideda raide 'U'. 
select title, film_id, description, rating from sakila.film where title like "U%";
-- 11. Išrinkti filmus, kur special_features turi reikšmę 'Deleted Scenes'.
select title, special_features from sakila.film where special_features="Deleted Scenes";
-- 12. Išrinkti filmus, kai nuomos trukmė yra 3 ir reitingas NC-17.
select film_id, rental_duration, rating from sakila.film where rental_duration=3 and rating="NC-17";
-- 13. Išrinkti filmus, kai nuomos trukmė yra 4 arba 5, ir pavadinimas prasideda raide 'V'.
select title, rental_duration from sakila.film where title like "V%" and (rental_duration=4 or rental_duration=5);
-- advance sujungti dvi lenteles first_name ir last_name
select first_name, last_name, concat(first_name ," ", last_name) as fullname from sakila.actor;