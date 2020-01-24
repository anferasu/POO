--************************************Consultas Multitablas (Composicion interna)*************************************

--1



--2

SELECT f.nombre, p.nombre FROM fabricante f, producto p 
WHERE f.codigo = p.codigo_fabricante AND
f.nombre in ('Asus','Hewlett-Packard','Seagate');

--3
SELECT f.nombre,p.nombre, p.precio FROM fabricante f, producto p 
WHERE f.codigo = p.codigo_fabricante AND 
RIGHT(f.nombre,1)= 'e';

--4
SELECT f.nombre,p.nombre, p.precio FROM fabricante f, producto p 
WHERE f.codigo = p.codigo_fabricante AND 
f.nombre LIKE '%w%';

--5
SELECT f.nombre,p.nombre, p.precio FROM fabricante f, producto p 
WHERE f.codigo = p.codigo_fabricante AND 
p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;

--************************************Consultas Multitablas (Composicion externa)*************************************
--1
SELECT f.nombre,p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

--2
SELECT f.nombre,p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE p.nombre IS NULL;

--************************************Consultas Resumen*************************************
--1
SELECT  COUNT(*) AS total_productos FROM producto p1; 

--2
SELECT p1.codigo_fabricante, COUNT(p1.codigo_fabricante) AS total_productos FROM producto p1
GROUP BY p1.codigo_fabricante ORDER BY p1.codigo_fabricante ASC;

--3
SELECT  * FROM producto p1
WHERE p1.precio = (SELECT MIN(p1.precio)FROM producto p1);

--4
SELECT  * FROM producto p1
WHERE p1.precio = (SELECT Max(p1.precio)FROM producto p1);

--6
SELECT  SUM(p1.precio) FROM producto p1;

--7

SELECT f.nombre, MIN(p1.precio) FROM producto p1, fabricante f
WHERE f.codigo= p1.codigo_fabricante AND f.nombre = 'Asus' 
GROUP BY f.nombre;

--8
SELECT MAX(p.precio)AS Maximo, MIN(P.precio) AS precio, AVG(p.precio) AS Media, SUM(p.precio) AS Suma 
FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE f.nombre = 'Crucial';

--9
SELECT f.nombre, MAX(p.precio)AS Maximo, MIN(P.precio) AS precio, AVG(p.precio) AS Media, SUM(p.precio) AS Suma FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre;

--10
SELECT f.nombre, MAX(p.precio)AS Maximo, MIN(P.precio) AS precio, AVG(p.precio) AS Media, SUM(p.precio) AS Suma FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING AVG(p.precio) > 200;

--11
--la misma 1.1.10

--12

SELECT f.nombre, p1.codigo_fabricante, COUNT(p1.codigo_fabricante) AS total_productos FROM producto p1,fabricante f
WHERE f.codigo = p1.codigo_fabricante AND p1.precio >=180
GROUP BY f.nombre, p1.codigo_fabricante ORDER BY p1.codigo_fabricante ASC;

--13
SELECT f.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING AVG(p.precio) > 150;

--14
SELECT f.nombre, COUNT(p1.codigo_fabricante) AS total FROM producto p1,fabricante f
WHERE f.codigo = p1.codigo_fabricante 
GROUP BY f.nombre
HAVING COUNT(p1.codigo_fabricante) >= 2;

--15

SELECT f.nombre, count (p.nombre)  FROM fabricante f 
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
where  p.precio is null
or p.precio >=220 
group by f.nombre;

--16

SELECT f.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING sum(p.precio) > 1000;


--************************************subconsultas (Where)*************************************

--1
select * from producto p 
where p.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre ='Lenovo');

--2
SELECT * FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE p.precio = (SELECT MAX(p.precio) FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Lenovo');

--3
SELECT * FROM producto p1 
WHERE p1.precio = (SELECT MAX(p.precio) FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Lenovo');

--4
SELECT * FROM producto p1 
WHERE p1.precio = (SELECT MIN(p.precio) FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Hewlett-Packard');

--5
SELECT * FROM producto p1 
WHERE p1.precio >= (SELECT MAX(p.precio) FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Lenovo');

SELECT p.nombre FROM producto p WHERE p.precio >= 
  (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre ='Lenovo'))

--6
SELECT * FROM producto p1
WHERE p1.precio > (SELECT AVG(p1.precio) FROM producto p1); 

--************************************subconsultas (ALL y ANY)*************************************

--1

SELECT * FROM  producto p 
WHERE p.precio >= All (
SELECT  p.precio FROM  producto p); 


SELECT * FROM  producto p 
WHERE p.precio >= ANY (SELECT MAX(p.precio) FROM producto p);


SELECT  * FROM  producto p 
ORDER BY p.precio DESC
LIMIT 1;

--2
SELECT * FROM  producto p 
WHERE p.precio <= All (
SELECT  p.precio FROM  producto p); 

--3

SELECT * FROM  fabricante f 
WHERE f.codigo = Any (SELECT p.codigo_fabricante  FROM producto p);   

--4
SELECT * FROM  fabricante f 
WHERE f.codigo <> ALL (SELECT p.codigo_fabricante  FROM producto p); 

--************************************subconsultas (in, not in)*************************************

--1
SELECT * FROM  fabricante f
WHERE f.codigo IN (SELECT p.codigo_fabricante  FROM producto p);

--************************************exists y not exists*************************************

--1
SELECT * FROM  fabricante f 
WHERE EXISTS (SELECT p.codigo_fabricante  FROM producto p, fabricante f1 WHERE f.codigo = p.codigo_fabricante); 

--2
SELECT * FROM  fabricante f 
WHERE NOT EXISTS (SELECT p.codigo_fabricante  FROM producto p, fabricante f1 WHERE f.codigo = p.codigo_fabricante); 


--************************************subconsultas corelacionadas*************************************

--1

SELECT c2.preciomax, c2.nombre, f.nombre FROM
  (SELECT preciomax, p.nombre, c1.codigo_fabricante FROM
    (SELECT MAX(precio) AS preciomax, codigo_fabricante FROM producto 
      GROUP BY codigo_fabricante) c1
    JOIN producto p ON c1.codigo_fabricante = p.codigo_fabricante
    WHERE p.precio=c1.preciomax) c2
    JOIN fabricante f ON f.codigo = c2.codigo_fabricante;


SELECT f.nombre, p.precio FROM producto p, fabricante f 
WHERE p.precio IN (SELECT MAX(p.precio) FROM producto p WHERE p.codigo_fabricante= f.codigo );

--2




--3
SELECT p.nombre FROM producto p
WHERE p.precio in (SELECT MAX(p.precio) FROM producto p, fabricante f WHERE p.codigo_fabricante= f.codigo AND f.nombre = 'Lenovo')





SELECT * FROM public.producto;

SELECT * FROM public.fabricante;

