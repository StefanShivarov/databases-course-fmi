USE pc;

---Query 1---
SELECT model AS 'MODEL', speed AS 'MHZ', hd AS 'GB'
FROM pc
WHERE price < 1200;

---Query 2---
SELECT DISTINCT maker
FROM product
WHERE type = 'Printer';

---Query 3---
SELECT model, ram, screen
FROM laptop
WHERE price > 1000;

---Query 4---
SELECT * 
FROM printer
WHERE color = 'y';

---Query 5---
SELECT model, speed, hd
FROM pc
WHERE cd IN ('12x', '16x') AND price < 2000;
