﻿
SELECT
  COUNT(c.nombre)
  FROM
  PUBLIC.ciclista c;

SELECT
  COUNT(c.nombre)
  FROM 
  PUBLIC.ciclista c
  WHERE c.nomequipo = 'Banesto';

SELECT
  round (AVG(c.edad))
  FROM
  PUBLIC.ciclista c;

SELECT
  round (AVG(c.edad))
  FROM
  PUBLIC.ciclista c
   WHERE c.nomequipo = 'Banesto';

SELECT
  round (AVG(c.edad),2), c.nomequipo
  FROM
  PUBLIC.ciclista c
  GROUP BY c.nomequipo;

SELECT
  COUNT(c.nombre),c.nomequipo
  FROM
  PUBLIC.ciclista c
  GROUP BY c.nomequipo;

  SELECT
    COUNT(p.nompuerto)
    FROM
    PUBLIC.puerto p;

SELECT
    COUNT(p.nompuerto)
    FROM
    PUBLIC.puerto p
  WHERE p.altura > 1500;

SELECT
  c.nomequipo, COUNT(c.nomequipo) 
  FROM
  PUBLIC.ciclista c
  GROUP BY c.nomequipo
  HAVING COUNT(c.nomequipo)>4;

SELECT
  c.nomequipo, COUNT(c.nomequipo) 
  FROM
  PUBLIC.ciclista c
  WHERE c.edad BETWEEN 28 AND 32
  GROUP BY c.nomequipo
  HAVING COUNT(c.nomequipo)>4;

  SELECT
     DISTINCT c.nombre, COUNT(e.numetapa) AS etapas_ganadas
    FROM
    public.ciclista c
    INNER JOIN
    public.etapa e
    ON c.dorsal = e.dorsal
    INNER JOIN
    public.lleva l
    ON c.dorsal = l.dorsal 
    INNER JOIN
    public.maillot m
    ON l.código = m.código
    GROUP BY c.nombre, e.numetapa
    ORDER BY c.nombre;

SELECT
    distinct c.dorsal
    FROM
    public.ciclista c
    INNER JOIN
    public.etapa e
    ON c.dorsal = e.dorsal
    INNER JOIN
    public.lleva l
    ON c.dorsal = l.dorsal 
    INNER JOIN
    public.maillot m
    ON l.código = m.código
    ORDER BY c.dorsal ASC;

--****1.1
SELECT 
DISTINCT  c.edad
  FROM
  PUBLIC.ciclista c
  WHERE c.nomequipo ='Banesto';
  ORDER BY c.edad ASC;
--11

--*****1.2
SELECT
 DISTINCT c.edad, c.nomequipo
  FROM
  PUBLIC.ciclista c
  WHERE c.nomequipo ='Banesto' OR c.nomequipo ='Navigare'
  ORDER BY c.edad ASC;
--16
  
--*****1.3
SELECT
  c.dorsal, c.nombre
  FROM
  PUBLIC.ciclista c
  WHERE c.nomequipo ='Banesto' AND c.edad BETWEEN 25 AND 32
  ORDER BY c.edad ASC;
--8

--*****1.5

SELECT
  distinct SUBSTRING(c.nomequipo,1,1) AS "Inicial_Nombre_Equipo"
  FROM
  PUBLIC.ciclista c
  WHERE c.nombre LIKE 'R%';
--5

--****1.6

SELECT
  e.numetapa
  FROM
  public.etapa e
  WHERE e.salida=e.llegada;
--16

--****1.7

SELECT
  e.numetapa
  FROM
  public.etapa e
  WHERE e.salida<>e.llegada AND e.dorsal IS NOT NULL;
  
  --7
  
  --******1.8
  

  SELECT
    p.nompuerto 
    FROM
    public.puerto p
    WHERE p.altura BETWEEN 1000 AND 2000 OR p.altura > 2400;
	
--11

--*******1.9

  SELECT
   DISTINCT p.dorsal 
    FROM
    public.puerto p
    WHERE p.altura BETWEEN 1000 AND 2000 OR p.altura > 2400
    ORDER BY p.dorsal ASC;
--11	

--******1.10

SELECT
  COUNT(DISTINCT c.dorsal) AS dorsal
 FROM
 puBLIC.etapa e
  
select 
count(*)
from
etapa

--******1.11

SELECT
  e.numetapa
  FROM
  PUBLIC.etapa e
  INNER JOIN
  PUBLIC.puerto p
  ON
  e.numetapa = p.numetapa;

  SELECT
   COUNT(distinct p.numetapa)
    FROM 
    PUBLIC.puerto p;

SELECT
  c.nombre
  FROM
  PUBLIC.ciclista c
  INNER JOIN
  PUBLIC.puerto p
  ON
  c.dorsal = p.dorsal;

SELECT
  p.numetapa, COUNT(*)AS nPuertos
  FROM
  PUBLIC.puerto p 
  GROUP BY p.numetapa
 
  SELECT
    l.código, COUNT(p.nompuerto)
    FROM
    PUBLIC.lleva l
    INNER JOIN
    PUBLIC.puerto p
    ON
    l.numetapa = p.numetapa 
   -- AND  l.dorsal = p.dorsal
    GROUP BY l.código;

SELECT
  round (AVG(p.altura))
  FROM
  PUBLIC.puerto p;

SELECT
  TRUNC (AVG(p.altura),2)
  FROM
  PUBLIC.puerto p;


SELECT
  SUM(p.altura)/COUNT(p.altura) 
  FROM
  PUBLIC.puerto p;

SELECT
  numetapa FROM puerto p
  GROUP BY p.numetapa
  HAVING AVG(altura)>1500

SELECT
  COUNT (*) AS retapa FROM numetapa FROM (SELECT numeroetapa FROM puerto p GROUP BY 
  p.numetapa
  HAVING AVG(altura)>1500

--.1.17
  SELECT l.dorsal, COUNT(*) AS numero
    FROM lleva l GROUP BY l.dorsal

--.1.18
  SELECT l.dorsal, l.código,
    COUNT(*) AS numero
    FROM lleva l GROUP BY l.dorsal, l.código

--1.19


SELECT l.dorsal, l.numetapa, COUNT(*) AS numero
  FROM lleva l
  GROUP BY l.dorsal, l.numetapa
