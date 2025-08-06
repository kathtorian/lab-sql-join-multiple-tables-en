-- Exercise 1:
SELECT
    s.store_id,
    c.city,
    co.country
FROM
    store s
JOIN
    address a ON s.address_id = a.address_id
JOIN
    city c ON a.city_id = c.city_id
JOIN
    country co ON c.country_id = co.country_id;

	
-- Exercise 2:
SELECT
    s.store_id,
    SUM(p.amount) AS total_revenue
FROM
    payment p
JOIN
    rental r ON p.rental_id = r.rental_id
JOIN
    inventory i ON r.inventory_id = i.inventory_id
JOIN
    store s ON i.store_id = s.store_id
GROUP BY
    s.store_id;
	
-- Exercise 3:
SELECT
    c.name AS category,
    AVG(f.length) AS average_length
FROM
    film f
JOIN
    film_category fc ON f.film_id = fc.film_id
JOIN
    category c ON fc.category_id = c.category_id
GROUP BY
    c.name
ORDER BY
    average_length DESC;

-- Exercise 4:
SELECT
    c.name AS category,
    AVG(f.length) AS average_length
FROM
    film f
JOIN
    film_category fc ON f.film_id = fc.film_id
JOIN
    category c ON fc.category_id = c.category_id
GROUP BY
    c.name
ORDER BY
    average_length DESC
LIMIT 5; --top 5


-- Exercise 5:
SELECT
    f.title,
    COUNT(r.rental_id) AS rental_count
FROM
    film f
JOIN
    inventory i ON f.film_id = i.film_id
JOIN
    rental r ON i.inventory_id = r.inventory_id
GROUP BY
    f.title
ORDER BY
    rental_count DESC;

	--Exercise 6:
	SELECT
    c.name AS category,
    SUM(p.amount) AS total_revenue
FROM
    payment p
JOIN
    rental r ON p.rental_id = r.rental_id
JOIN
    inventory i ON r.inventory_id = i.inventory_id
JOIN
    film f ON i.film_id = f.film_id
JOIN
    film_category fc ON f.film_id = fc.film_id
JOIN
    category c ON fc.category_id = c.category_id
GROUP BY
    c.name
ORDER BY
    total_revenue DESC
LIMIT 5;


--Exercise 7:
SELECT
    COUNT(*) AS available_copies
FROM
    inventory i
JOIN
    film f ON i.film_id = f.film_id
LEFT JOIN
    rental r ON i.inventory_id = r.inventory_id
            AND r.return_date IS NULL
WHERE
    f.title = 'Academy Dinosaur'
    AND i.store_id = 1
    AND r.rental_id IS NULL;
