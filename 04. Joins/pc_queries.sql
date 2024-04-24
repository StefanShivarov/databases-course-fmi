USE pc;

---Query 1---
SELECT p.* FROM product AS p
FULL JOIN pc ON p.model = pc.model
FULL JOIN laptop ON p.model = laptop.model
FULL JOIN printer ON p.model = printer.model
WHERE pc.model IS NULL AND laptop.model IS NULL AND printer.model IS NULL;

---Query 2---
SELECT DISTINCT p.maker
FROM product AS p
JOIN laptop ON p.model = laptop.model
INNER JOIN (
	SELECT p2.MAKER
	FROM product AS p2
	JOIN printer ON p2.model = printer.model
) AS m2 ON m2.maker = p.maker;

---Query 3---
SELECT DISTINCT l1.hd 
FROM laptop AS l1
JOIN laptop AS l2 ON l1.hd = l2.hd
WHERE l1.hd = l2.hd AND l1.code != l2.code;

---Query 4---
SELECT *
FROM product AS p
LEFT JOIN pc ON p.model = pc.model
WHERE pc.model = NULL;
