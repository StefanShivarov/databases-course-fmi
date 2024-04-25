USE pc;

---Query 1---
SELECT ROUND(AVG(speed), 2) AS 'AvgSpeed'
FROM pc;

---Query 2---
SELECT product.maker, AVG(laptop.screen) AS 'AvgScreen'
FROM laptop
JOIN product ON laptop.model = product.model
GROUP BY product.maker;

---Query 3---
SELECT AVG(speed) AS 'AvgSpeed'
FROM laptop
WHERE price > 1000;

---Query 4---
SELECT product.maker, ROUND(AVG(pc.price), 2) AS 'AvgPrice'
FROM pc
JOIN product ON pc.model = product.model
GROUP BY product.maker
HAVING product.maker = 'A';

---Query 5---
SELECT product.maker, AVG(t.price) AS 'AvgPrice'
FROM (
	SELECT l.model, l.price
	FROM laptop AS l
	UNION ALL
	SELECT pc.model, pc.price
	FROM pc
) AS t
JOIN product ON product.model = t.model
GROUP BY product.maker
HAVING product.maker = 'B';

---Query 6---
SELECT pc.speed, AVG(pc.price) AS 'AvgPrice'
FROM pc
GROUP BY pc.speed;

---Query 7---
SELECT product.maker, COUNT(pc.code) AS 'number_of_pc'
FROM product
JOIN pc ON product.model = pc.model
GROUP BY product.maker
HAVING COUNT(pc.code) >= 3;

---Query 8---
SELECT product.maker, pc.price
FROM pc
JOIN product ON pc.model = product.model
WHERE pc.price = (
	SELECT MAX(price) FROM pc
);

---Query 9---
SELECT speed, AVG(price) AS 'AvgPrice'
FROM pc
GROUP BY speed
HAVING speed > 800;

---Query 10---
SELECT product.maker, AVG(pc.hd) AS 'AvgHDD'
FROM pc
JOIN product ON pc.model = product.model
GROUP BY product.maker
HAVING product.maker IN(
	(
		SELECT product.maker
		FROM product
		JOIN pc ON product.model = pc.model
	)
	INTERSECT
	(
		SELECT product.maker
		FROM product
		JOIN printer ON product.model = printer.model
	)
);