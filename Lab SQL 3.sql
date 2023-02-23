USE sakila;
### Lab 3 SQL
### 1.How many distinct (different) actors' last names are there?

SELECT COUNT(DISTINCT last_name)
From actor;

### 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)

SELECT COUNT(DISTINCT language_id)
FROM film;

### 3. How many movies were released with "PG-13" rating?

SELECT rating
FROM film;

SELECT COUNT(*) from film
WHERE rating = 'PG-13';


### 4. Get 10 the longest movies from 2006.

SELECT * FROM film
WHERE release_year= 2006
ORDER BY length desc
LIMIT 10;

### 5.How many days has been the company operating (check DATEDIFF() function)?

SELECT min(rental_date) as minimum, max(rental_date) as maximum
FROM rental;

SELECT  datediff(max(rental_date), min(rental_date)) as daysinoperation from rental;

### 6. Show rental info with additional columns month and weekday. Get 20.

SELECT *, substring(rental_date, 6, 2) as month, DAYNAME(rental_date) AS dayoftheweek
FROM rental;

### 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *,  
CASE
	WHEN (DAYNAME(rental_date) = "Saturday" OR "Sunday") THEN 'Weekend'
	ELSE 'Weekday'
    END as day_type
from rental;

### 8. How many rentals were in the last month of activity?

### From the last rental date, we can determine the last month of activity

SELECT * 
FROM rental
ORDER by rental_date DESC;

### Therefore, last month of activity was in the month of February 2006 (%2006-02)


SELECT COUNT(rental_id) AS total_feb_rentals
FROM rental
WHERE MONTH(rental_date) =2 AND YEAR(rental_date) = 2006;