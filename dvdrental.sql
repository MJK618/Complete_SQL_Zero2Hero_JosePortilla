SELECT COUNT(*) FROM payment WHERE amount > 5;
SELECT COUNT(first_name) FROM actor WHERE first_name LIKE 'P%';
SELECT COUNT(DISTINCT district) FROM address;
SELECT DISTINCT district FROM address;
SELECT COUNT(title) FROM film WHERE (rating='R') and (replacement_cost BETWEEN 5 AND 15);
SELECT COUNT(title) FROM film WHERE title LIKE '%Truman%';
SELECT AVG(replacement_cost) FROM film;
SELECT customer_id, SUM(amount), COUNT(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount) DESC;
SELECT staff_id, COUNT(*) FROM payment GROUP BY staff_id;
SELECT rating,AVG(replacement_cost) FROM film GROUP BY rating;
SELECT customer_id,SUM(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount) DESC LIMIT 5;
SELECT customer_id,COUNT(*) FROM payment GROUP BY customer_id HAVING COUNT(*)>=40;
SELECT customer_id,SUM(amount) FROM payment WHERE staff_id=2 GROUP BY customer_id HAVING SUM(amount)>=100;
SELECT customer_id,SUM(amount) FROM payment WHERE staff_id=2 GROUP BY customer_id HAVING SUM(amount)>=110;
SELECT COUNT(*) FROM film WHERE title LIKE 'J%';
SELECT first_name, last_name FROM customer WHERE first_name like 'E%' AND address_id<500
                                            ORDER BY customer_id DESC LIMIT 1;
SELECT first_name, last_name, email, SUM(amount) FROM customer
    INNER JOIN payment on customer.customer_id = payment.customer_id
        GROUP BY first_name, last_name, email ORDER BY sum(amount) DESC;
SELECT * FROM customer FULL OUTER JOIN payment on customer.customer_id = payment.customer_id
            WHERE payment.customer_id IS NULL OR customer.customer_id IS NULL;
SELECT COUNT(DISTINCT payment.customer_id),COUNT(DISTINCT customer.customer_id) FROM payment, customer;
SELECT email, district FROM customer INNER JOIN address on customer.address_id = address.address_id
             WHERE address.district = 'California';
SELECT title,first_name,last_name FROM film INNER JOIN film_actor on film.film_id = film_actor.film_id
    INNER JOIN actor on film_actor.actor_id = actor.actor_id WHERE first_name='Nick' AND last_name='Wahlberg';
SHOW ALL;
SHOW TIMEZONE;
SELECT NOW();
SELECT TIMEOFDAY();
SELECT EXTRACT(YEAR FROM payment_date) as Payment_Year FROM payment;
SELECT AGE(payment_date) as Payment_AGE FROM payment;
SELECT DISTINCT(to_char(payment_date,'MONTH')) FROM payment;
SELECT COUNT(*) FROM payment WHERE to_char(payment_date,'DAY') = 'MONDAY   ';
SELECT DISTINCT(to_char(payment_date,'DAY')) FROM payment;
SELECT COUNT(*) FROM payment WHERE EXTRACT(dow FROM payment_date)=1;
SELECT customer_id,
       CASE WHEN customer_id <=100 THEN 'Premium'
        WHEN customer_id BETWEEN 100 AND 200 THEN 'Plus'
    ELSE 'Normal'
END AS Customer_Plan
FROM customer;
SELECT customer_id,
       CASE customer_id WHEN 2 THEN 'Winner'
        WHEN 5 THEN ''
END AS Raffle_results
FROM customer;

SELECT
    SUM(CASE rental_rate WHEN 0.99 THEN 1
        ELSE 0
END) AS bargain,
    SUM(CASE rental_rate WHEN 2.99 THEN 1
        ELSE 0
END) AS regular,
    SUM(CASE rental_rate WHEN 4.99 THEN 1
        ELSE 0
END) AS premium
FROM film;

SELECT
    SUM(CASE rating WHEN 'R' THEN 1
        ELSE 0
END) AS bargain,
    SUM(CASE rating WHEN 'PG' THEN 1
        ELSE 0
END) AS regular,
    SUM(CASE rating WHEN 'PG-13' THEN 1
        ELSE 0
END) AS premium
FROM film;

SELECT CAST('5' AS INTEGER);
SELECT '5'::INTEGER;
SELECT now()::DATE;

CREATE VIEW customer_info AS SELECT first_name, last_name, address FROM customer
    INNER JOIN address ON customer.address_id=address.address_id;
SELECT * FROM customer_info;