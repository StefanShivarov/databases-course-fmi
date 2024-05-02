USE pc;

---Query 1---
INSERT INTO product
VALUES('C', '1100', 'PC');

INSERT INTO pc
VALUES(12, '1100', 2400, 2048, 500, '52x', 299);

---Query 2---
DELETE FROM pc
WHERE model = '1100';

---Query 3---
DELETE FROM laptop
WHERE laptop.model IN (
	SELECT laptop.model FROM laptop
	JOIN product ON laptop.model = product.model
	WHERE product.maker NOT IN (
		SELECT DISTINCT product.maker FROM product
		WHERE product.maker IN (
			SELECT product.maker FROM product
			WHERE product.type = 'Printer'
		)
	)
);

---Query 4---
UPDATE product
SET product.maker = 'A'
WHERE product.maker = 'B';

---Query 5---
UPDATE pc
SET pc.price = pc.price / 2;

UPDATE pc
SET pc.hd = pc.hd + 20;
