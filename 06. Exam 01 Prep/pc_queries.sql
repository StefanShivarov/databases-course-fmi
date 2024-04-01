USE pc;

---Query 1---
SELECT l.model, l.code, l.screen
FROM laptop AS l
WHERE screen IN (11, 15);

---Query 2---
SELECT DISTINCT pc.model
FROM pc
JOIN product AS p ON p.model = pc.model
WHERE pc.price < (
	SELECT MIN(price)
	FROM laptop AS l
	JOIN product AS p2 ON p2.model = l.model
	WHERE p2.maker = p.maker
);

---Query 3---
SELECT pc.model, AVG(pc.price) AS avg_price
FROM pc
JOIN product AS p ON p.model = pc.model
GROUP BY pc.model, p.maker
HAVING AVG(pc.price) < (
	SELECT MIN(l.price)
	FROM laptop AS l
	JOIN product AS pr ON pr.model = l.model
	WHERE pr.maker = p.maker
);

---Query 4---
SELECT pc.code, product.maker, (
	SELECT COUNT(pc2.code)
	FROM pc AS pc2
	WHERE pc2.price >= pc.price
) AS num_pc_higher_price 
FROM pc
JOIN product ON pc.model = product.model
GROUP BY pc.code, product.maker, pc.price;
