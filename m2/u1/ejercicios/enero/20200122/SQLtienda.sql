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

--1.1
SELECT f.nombre,p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

--1.2
SELECT f.nombre,p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE p.nombre IS NULL;

--1.1.1
SELECT  COUNT(*) AS total_productos FROM producto p1; 

--1.1.2
SELECT p1.codigo_fabricante, COUNT(p1.codigo_fabricante) AS total_productos FROM producto p1
GROUP BY p1.codigo_fabricante ORDER BY p1.codigo_fabricante ASC;

--1.1.3
SELECT  * FROM producto p1
WHERE p1.precio = (SELECT MIN(p1.precio)FROM producto p1);

--1.1.4
SELECT  * FROM producto p1
WHERE p1.precio = (SELECT Max(p1.precio)FROM producto p1);

--1.1.6
SELECT  SUM(p1.precio) FROM producto p1;

--1.1.7

SELECT f.nombre, MIN(p1.precio) FROM producto p1, fabricante f
WHERE f.codigo= p1.codigo_fabricante AND f.nombre = 'Asus' 
GROUP BY f.nombre;

--1.1.8
SELECT MAX(p.precio)AS Maximo, MIN(P.precio) AS precio, AVG(p.precio) AS Media, SUM(p.precio) AS Suma 
FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE f.nombre = 'Crucial';

--1.1.9
SELECT f.nombre, MAX(p.precio)AS Maximo, MIN(P.precio) AS precio, AVG(p.precio) AS Media, SUM(p.precio) AS Suma FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre;

--1.1.10
SELECT f.nombre, MAX(p.precio)AS Maximo, MIN(P.precio) AS precio, AVG(p.precio) AS Media, SUM(p.precio) AS Suma FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING AVG(p.precio) > 200;

--1.1.11
--la misma 1.1.10

--1.1.12

SELECT f.nombre, p1.codigo_fabricante, COUNT(p1.codigo_fabricante) AS total_productos FROM producto p1,fabricante f
WHERE f.codigo = p1.codigo_fabricante AND p1.precio >=180
GROUP BY f.nombre, p1.codigo_fabricante ORDER BY p1.codigo_fabricante ASC;

--1.1.13
SELECT f.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING AVG(p.precio) > 150;

--1.1.14
SELECT f.nombre, COUNT(p1.codigo_fabricante) AS total FROM producto p1,fabricante f
WHERE f.codigo = p1.codigo_fabricante 
GROUP BY f.nombre
HAVING COUNT(p1.codigo_fabricante) >= 2;

--1.1.15

SELECT f.nombre, count (p.nombre)  FROM fabricante f 
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
where  p.precio is null
or p.precio >=220 
group by f.nombre;

--1.1.16

SELECT f.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING sum(p.precio) > 1000;

--1.1.1.1
select f.nombre,p.nombre from fabricante f, producto p
where f.codigo = p.codigo_fabricante and f.nombre ='Lenovo';

--1.1.1.2
SELECT f.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING sum(p.precio) > 1000;








SELECT f.nombre, p.nombre FROM fabricante f, producto p 
WHERE f.codigo = p.codigo_fabricante AND
f.nombre = 'Asus' or f.nombre ='Hewlett-Packard' OR f.nombre ='Seagate';




SELECT * FROM public.producto;

SELECT * FROM public.fabricante;

