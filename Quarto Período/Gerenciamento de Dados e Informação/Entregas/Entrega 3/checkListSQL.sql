-- Update
UPDATE Telefone SET phone = '11992456787' WHERE id = '58460798062';

-- Delete
DELETE FROM Telefone WHERE id = '58460798062';

-- Select From Where
SELECT * FROM Telefone WHERE id = '58460798062';

-- Between
SELECT * FROM Endereco WHERE Numero BETWEEN 50 AND 200;

-- In
SELECT * FROM Endereco WHERE Numero IN (10, 20, 30, 40, 50, 60, 70, 80);

-- Like
SELECT * FROM Telefone WHERE phone LIKE '81%';

-- Not null
SELECT * FROM Endereco WHERE Numero IS NOT NULL;

-- Inner Join
SELECT * FROM Endereco INNER JOIN Telefone ON Endereco.Id = Telefone.id;

-- Max
SELECT MAX(Numero) AS MaxNum FROM Endereco;

-- Min
SELECT MIN(Numero) AS MinNum FROM Endereco;

-- Avg
SELECT AVG(Numero) FROM Endereco;

-- Count
SELECT COUNT(Numero) FROM Endereco;

-- Left
SELECT Endereco.Id FROM Endereco LEFT OUTER JOIN Telefone ON Endereco.Id = Telefone.id;

-- Subconsulta com operador relacional
SELECT * FROM Endereco WHERE Endereco.Id = (SELECT id FROM Telefone WHERE phone = '81992456787' AND ROWNUM = 1);

-- Subconsulta com In
SELECT * FROM Endereco WHERE Endereco.Id IN (SELECT id FROM Telefone WHERE phone IN ('81992456787', '11992456787'));

-- Subconsulta com Any
SELECT * FROM Endereco WHERE Endereco.Id = ANY(SELECT id FROM Telefone WHERE phone = ANY('81992456787', '11992456787'));

-- Subconsulta com All
SELECT * FROM Endereco WHERE Endereco.Id = ALL(SELECT id FROM Telefone WHERE phone = ALL('81992456787'));

-- Order By
SELECT * FROM Endereco ORDER BY Numero ASC;

-- Group By
SELECT Endereco.Estado FROM Endereco GROUP BY Endereco.Estado;

-- Having
SELECT Endereco.Estado, Endereco.Numero FROM Endereco GROUP BY Endereco.Estado, Endereco.Numero HAVING Endereco.Numero > 60;

-- Union
SELECT Endereco.Estado FROM Endereco UNION ALL SELECT Telefone.phone FROM Telefone;

-- Create View
CREATE VIEW Pernambuco AS SELECT * FROM Endereco WHERE Estado = 'Pernambuco';

-- Grant
GRANT CREATE SESSION TO PUBLIC;


