USE pc;

---Query 1---
SELECT DISTINCT p.maker 
FROM product AS p
WHERE p.model IN (
	SELECT pc.model
	FROM pc
	WHERE pc.speed > 500
);

---Query 2---
SELECT code, model, price
FROM printer
WHERE price >= ALL (
	SELECT price
	FROM printer
);

---Query 3---
SELECT *
FROM laptop AS l
WHERE l.speed < ALL (
	SELECT speed
	FROM pc
);

---Query 4---
SELECT DISTINCT model, price
FROM (
	SELECT model, price
	FROM laptop
	WHERE price >= ALL (
		SELECT price
		FROM laptop
	)
	UNION 
	SELECT model, price
	FROM pc
	WHERE price >= ALL (
		SELECT price
		FROM pc
	)
	UNION 
	SELECT model, price
	FROM printer
	WHERE price >= ALL (
		SELECT price
		FROM printer
	)
) AS all_products
WHERE price >= ALL (
	SELECT price
	FROM (
		SELECT model, price
		FROM laptop
		WHERE price >= ALL (
			SELECT price
			FROM laptop
		)
		UNION 
		SELECT model, price
		FROM pc
		WHERE price >= ALL (
			SELECT price
			FROM pc
		)
		UNION 
		SELECT model, price
		FROM printer
		WHERE price >= ALL (
			SELECT price
			FROM printer
		)
	) AS all_products
);

---Query 5---
SELECT maker
FROM product
WHERE model = (
	SELECT DISTINCT model 
	FROM printer
	WHERE color = 'y'
	AND price <= ALL (
		SELECT price
		FROM printer
		WHERE color = 'y'
	)
);

---Query 6---
SELECT product.maker 
FROM (
	SELECT *
	FROM pc
	WHERE ram <= ALL (
		SELECT ram
		FROM pc
	)
) AS lowest_ram_pcs
JOIN product ON product.model = lowest_ram_pcs.model
WHERE lowest_ram_pcs.speed >= ALL (
	SELECT speed 
	FROM (
		SELECT *
		FROM pc
		WHERE ram <= ALL (
			SELECT ram
			FROM pc
		)
	) AS lowest_ram_pcs
);
