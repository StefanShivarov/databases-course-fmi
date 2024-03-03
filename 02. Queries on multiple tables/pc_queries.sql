USE pc;

---Query 1---
SELECT product.maker, laptop.speed
FROM product, laptop
WHERE product.model = laptop.model
AND laptop.hd >= 9;

---Query 2---
(SELECT DISTINCT l.model, l.price
FROM laptop AS l, product AS p
WHERE p.model = l.model
AND p.maker = 'B')

UNION

(SELECT DISTINCT pc.model, pc.price
FROM pc, product AS p
WHERE pc.model = p.model
AND p.maker = 'B')

UNION

(SELECT DISTINCT printer.model, printer.price
FROM printer, product
WHERE printer.model = product.model
AND product.maker = 'B')

---Query 3---
(SELECT DISTINCT p.maker
FROM product AS p
WHERE p.type = 'Laptop')

EXCEPT

(SELECT DISTINCT p.maker
FROM product AS p
WHERE p.type = 'PC')

---Query 4---
SELECT DISTINCT pc1.hd 
FROM pc AS pc1, pc AS pc2
WHERE pc1.hd = pc2.hd
AND pc1.code != pc2.code;

---Query 5---
SELECT DISTINCT pc1.model, pc2.model
FROM pc AS pc1, pc as pc2
WHERE pc1.ram = pc2.ram
AND pc1.speed = pc2.speed
AND pc1.model != pc2.model
AND pc1.code < pc2.code;

---Query 6---
SELECT DISTINCT product.maker 
FROM pc AS pc1, pc AS pc2, product
WHERE product.model = pc1.model
AND product.model = pc2.model
AND pc1.code != pc2.code
AND pc1.speed > 400
AND pc2.speed > 400;
