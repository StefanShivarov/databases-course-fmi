USE movies;

---Query 1---
(SELECT NAME FROM MOVIESTAR WHERE GENDER = 'M')
INTERSECT 
(SELECT STARNAME FROM STARSIN WHERE MOVIETITLE = 'The Usual Suspects');

---Query 2---
SELECT DISTINCT STARSIN.STARNAME 
FROM STARSIN, MOVIE
WHERE STARSIN.MOVIETITLE = MOVIE.TITLE
AND MOVIE.STUDIONAME = 'MGM'
AND STARSIN.MOVIEYEAR = 1995;

---Query 3---
SELECT DISTINCT p.NAME
FROM MOVIEEXEC as p, MOVIE as m
WHERE m.PRODUCERC# = p.CERT#
AND m.STUDIONAME = 'MGM';

---Query 4---
SELECT m2.TITLE 
FROM MOVIE as m1, MOVIE as m2
WHERE m1.TITLE = 'Star Wars'
AND m2.LENGTH > m1.LENGTH;

---Query 5---
SELECT p1.NAME
FROM MOVIEEXEC as p1, MOVIEEXEC as p2
WHERE p2.NAME = 'Stephen Spielberg'
AND p1.NETWORTH > p2.NETWORTH;