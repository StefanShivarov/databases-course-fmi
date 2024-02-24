USE ships;

---Query 1---
SELECT CLASS, COUNTRY
FROM CLASSES
WHERE NUMGUNS < 10;

---Query 2---
SELECT NAME AS 'SHIPNAME'
FROM SHIPS
WHERE LAUNCHED < 1918;

---Query 3---
SELECT SHIP, BATTLE
FROM OUTCOMES
WHERE RESULT = 'sunk';

---Query 4---
SELECT NAME
FROM SHIPS
WHERE NAME = CLASS;

---Query 5---
SELECT NAME
FROM SHIPS
WHERE NAME LIKE 'R%';

---Query 6---
SELECT NAME
FROM SHIPS
WHERE NAME LIKE '% %';