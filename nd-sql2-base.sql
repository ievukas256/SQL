-- 1.Suskaičiuoti, kiek yra aktorių, kurių pavardės prasideda A ir B raidėmis. Rezultatas:aktorių skaičiusirpavardės pirmąją raidę.
select
  SUBSTRING(last_name, 1, 1) AS pirmoji_raide,
  COUNT(actor_id) AS skaicius
FROM sakila.actor
WHERE last_name LIKE 'A%' OR last_name LIKE 'B%'
GROUP BY pirmoji_raide;
-- 2.Suskaičiuoti kiek filmų yra nusifilmavę aktoriai. Rezultatas:filmų skaičius,  aktoriaus  vardasir  pavardė. Pateikti 10 aktorių, nusifilmavusių daugiausiai filmų(TOP 10).
SELECT
  count(film_id) AS filmu_skaicius,
  first_name,
  last_name
FROM sakila.film_actor 
JOIN actor USING(actor_id)
GROUP BY first_name, last_name
ORDER BY filmu_skaicius DESC
LIMIT 10;
-- 3.Nustatyti kokia yra minimali, maksimali ir vidutinė kaina, sumokama už filmą. Rezultatas: pateikti tik minimalią, maksimalią ir vidutinę kainas.
SELECT
  MIN(rental_rate),
  AVG(rental_rate),
  MAX(rental_rate)
FROM sakila.film;
-- 4.Suskaičiuoti, kiek kiekviena parduotuvė turi klientų. 
SELECT
   st.store_id,
   COUNT(customer_id) AS klientu_skaicius
FROM sakila.store AS st
JOIN sakila.customer AS c 
ON st.store_id = c.store_id
GROUP BY store_id;
-- 5.Suskaičiuoti kiek yra kiekvieno žanro filmų. Rezultatas: filmų  skaičius ir  žanro  pavadinimą.  Rezultatą  surikiuoti  pagal  filmų  skaičių mažėjimo tvarka.6.Sužinoti, kuriame filme vaidino daugiausiai aktorių. Rezultatas:filmo pavadinimasir aktorių skaičius.
SELECT
  name,
  count(film_id) AS filmu_skaicius
FROM sakila.film_category AS fc
JOIN category AS c
ON fc.category_id = c.category_id
GROUP BY name
ORDER BY filmu_skaicius DESC;
-- 6. Sužinoti, kuriame filme vaidino daugiausiai aktorių. Rezultatas:filmo pavadinimas ir aktorių skaičius.
SELECT
  title,
  count(actor_id) AS actor_count
FROM sakila.film AS f
JOIN sakila.film_actor AS fa
ON f.film_id = fa.film_id
ORDER BY actor_count DESC
LIMIT 1;
-- 7.Pateikti filmus ir juose vaidinusius aktorius. Rezultatas:filmo  pavadinimas, aktoriaus vardas ir pavardė. Rezultate turi būti rodomi tik filmai, kurių identifikatoriaus (film_id) reikšmė yra nuo 1 iki 2. Duomenys rūšiuojami pagal filmo pavadinimą, aktoriaus vardą ir pavardę didėjančia tvarka.
SELECT
    f.title,
    a.first_name,
    a.last_name
FROM sakila.film AS f
JOIN sakila.film_actor AS fa
    ON f.film_id = fa.film_id
JOIN sakila.actor AS a
    ON fa.actor_id = a.actor_id
WHERE f.film_id IN (1, 2);
-- 8.Suskaičiuoti, kiek filmų yra nusifilmavęs kiekvienas aktorius. Rezultatas:filmų skaičius, aktoriaus vardas, pavardė. Rezultatą surikiuoti pagal filmų skaičių mažėjančia tvarka ir pagal aktoriaus vardą didėjančia tvarka.
SELECT
  a.first_name,
  a.last_name,
  count(fa.film_id) AS filmu_skaicius
FROM sakila.actor a
JOIN sakila.film_actor fa ON a.actor_id = fa.actor_id
GROUP BY first_name, last_name
ORDER BY filmu_skaicius DESC, first_name ASC;
-- 9.Suskaičiuoti kiek miestų prasideda A, B, C ir D raidėmis. Rezultatas: miestų skaičiusir miesto pavadinimo pirmoji raidė.
SELECT 
  SUBSTRING(city, 1, 1) AS pirmoji_raide,
  COUNT(city_id)
FROM city
WHERE SUBSTRING(city, 1, 1) in ('A', 'B', 'C','D')
GROUP BY SUBSTRING(city, 1, 1);
-- 10.Suskaičiuoti, kiek kiekvienas klientas yra sumokėjęs pinigų už filmų nuomą. Rezultatas:kliento vardas, pavardė, adresas, apygarda (district) ir sumokėtapinigų suma. Turi būti pateikiami tiktie klientai, kurie yra sumokėję 170 ar didesnę pinigų sumą.
SELECT
    first_name,
    last_name,
    a.address,
    a.district,
    SUM(p.amount) AS sumoketa_suma
FROM sakila.customer AS c
JOIN sakila.address AS a ON c.address_id = a.address_id
JOIN sakila.payment AS p ON c.customer_id = p.customer_id
GROUP BY first_name,
        last_name,
        address, 
        district
HAVING SUM(p.amount) >= 170;
-- 11.Suskaičiuoti, kiek pinigų už filmus yra sumokėję kiekvienos apygardos klientai kartu. Rezultatas: apygardą (district) ir išleistapinigų suma. Pateiktitik  tas  apygardas,  kurios  yra išleidusiosdaugiau nei 700 pinigų. Duomenis surūšiuoti pagal apygardą didėjančia tvarka.
SELECT
    a.district,
    SUM(p.amount) AS sumoketa_suma
FROM sakila.customer AS c
JOIN sakila.address AS a ON c.address_id = a.address_id
JOIN sakila.payment AS p ON c.customer_id = p.customer_id
GROUP BY district
HAVING SUM(p.amount) >= 700
ORDER BY sumoketa_suma;
-- 12.Suskaičiuoti,  kiek  filmų  nusifilmavo  kiekvienas  aktorius  priklausomai  nuo  filmo  žanro (kategorijos). Rezultatas:filmų skaičius,  aktoriaus  vardasir  pavardė, filmo žanras(kategorija). Rezultatą surūšiuoti pagal aktoriaus vardą, pavardę, filmo žanrą didėjančia tvarka.
SELECT 
COUNT(category_id), 
name,
first_name,
 last_name 
 FROM sakila.film_actor fa 
 JOIN sakila.actor a 
 USING (actor_id)
 JOIN sakila.film_category fc 
 USING (film_id)
 JOIN sakila.category c 
 USING (category_id)
 GROUP BY actor_id, category_id
 ORDER BY first_name, last_name, name ASC;
-- 13.Suskaičiuoti kiek filmų savo filmo aprašyme turi žodį „drama“. (Kiek kartų žodis pasikartoja nėra svarbu). Rezultatas: tik filmų skaičiusir filmo žanras. Pateikti tik tuos filmų žanrus, kurie turi 7 ir daugiau filmų, kuriuose yra žodis „drama“ (filmo aprašymui naudoti lauką iš lentos film_text).
SELECT 
COUNT(category_id), 
c.name
FROM sakila.film_text ft
JOIN sakila.film_category fc 
USING (film_id)
JOIN sakila.category c 
USING (category_id)
WHERE description like '%drama%'
GROUP BY c.name
having count(category_id) >=7
ORDER BY c.name ASC;
-- 14.Suskaičiuoti kiek klientų yra kiekvienoje šalyje. Rezultatas:klientų skaičiusir šalis.  Duomenis  surikiuoti  pagal klientų skaičių mažėjančia tvarka. Pateikti tik 5 šalis, turinčias daugiausiai klientų.
SELECT COUNT(customer_id), 
cn.country
FROM sakila.customer c
JOIN sakila.address a USING(address_id)
JOIN sakila.city ct USING(city_id)
JOIN sakila.country cn USING(country_id)
GROUP BY cn.country
ORDER BY COUNT(customer_id) DESC
limit 5;
-- 15.Suskaičiuoti kiekvienoje parduotuvėje bendrai visų klientų sumokėtą sumą. Rezultatas:parduotuvės identifikatorius (store_id), parduotuvės adresas, miestas ir šalis, 
SELECT sum(p.amount),
s.store_id, 
a.address, 
c.city, 
cn.country
FROM sakila.rental r
JOIN sakila.inventory i USING(inventory_id)
JOIN sakila.payment p USING(rental_id)
JOIN sakila.store s USING(store_id)
JOIN sakila.address a USING(address_id)
JOIN sakila.city c USING(city_id)
JOIN sakila.country cn USING(country_id)
GROUP BY s.store_id;