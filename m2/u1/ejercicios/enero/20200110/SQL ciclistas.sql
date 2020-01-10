--1.1 Nombre y edad de los ciclistas que han ganado etapas
SELECT distinct c.nombre, c.edad 
  FROM public.ciclista c
  INNER JOIN public.etapa e 
  ON c.dorsal = e.dorsal;

SELECT c.nombre, c.edad 
  FROM public.ciclista c
  WHERE c.dorsal IN (SELECT e.dorsal FROM public.etapa e);


--1.2
SELECT distinct c.nombre, c.edad 
  FROM public.ciclista c
  INNER JOIN public.puerto p  
  ON c.dorsal = p.dorsal;

SELECT c.nombre, c.edad 
  FROM public.ciclista c WHERE c.dorsal IN (SELECT p.dorsal FROM public.puerto p )
  

--1.3
SELECT distinct c.nombre, c.edad 
  FROM public.ciclista c
  INNER JOIN public.etapa e  
  ON c.dorsal = e.dorsal
  INNER JOIN public.puerto p  
  ON c.dorsal = p.dorsal;

SELECT 
  c.nombre, c.edad 
  FROM 
  public.ciclista c 
  WHERE 
  c.dorsal IN (SELECT e.dorsal FROM public.etapa e) AND
  c.dorsal IN (SELECT p.dorsal FROM PUBLIC.puerto p) 


--1.4
SELECT DISTINCT e.director FROM 
public.equipo e
INNER JOIN   
public.ciclista c
ON e.nomequipo = c.nomequipo
INNER JOIN
public.etapa et
ON c.dorsal = et.dorsal


--1.5
SELECT DISTINCT c.dorsal, c.nombre
FROM
public.ciclista c
INNER JOIN 
public.lleva l
ON c.dorsal = l.dorsal
INNER JOIN
public.maillot m
ON l.código = m.código

--1.6
SELECT DISTINCT c.dorsal, c.nombre
FROM
public.ciclista c
INNER JOIN 
public.lleva l
ON c.dorsal = l.dorsal
INNER JOIN
public.maillot m
ON l.código = m.código
WHERE m.color = 'amarillo'


--1.7
SELECT DISTINCT e.dorsal 
FROM
public.lleva l
INNER JOIN
public.etapa e
ON l.numetapa = e.numetapa
INNER JOIN
public.maillot m
ON l.código = m.código


--1.8

SELECT DISTINCT e.numetapa
FROM
public.etapa e
INNER JOIN
public.puerto p
ON e.numetapa = p.numetapa

--1.9
SELECT distinct e.kms FROM
public.etapa e
INNER JOIN
public.ciclista c
ON
c.dorsal = e.dorsal
INNER JOIN
public.puerto p
ON 
e.numetapa= p.numetapa
WHERE c.nomequipo = 'Banesto'

--1.10
SELECT COUNT(*)
FROM public.ciclista c
INNER JOIN
public.etapa e
ON C.dorsal = e.dorsal
INNER JOIN
public.puerto p
ON
e.numetapa = p.numetapa

--1.11
SELECT p.nompuerto 
FROM
public.puerto p
INNER JOIN
public.ciclista c
ON p.dorsal = c.dorsal
WHERE c.nomequipo = 'Banesto'

--1.12

SELECT p.numetapa 
FROM
public.puerto p
INNER JOIN
public.ciclista c
ON p.dorsal = c.dorsal
INNER JOIN
public.etapa e
ON e.numetapa = p.numetapa
WHERE c.nomequipo = 'Banesto' AND e.kms > 200


-----------------------------------------------------------------
--1.1
SELECT c.nombre, c.edad
FROM PUBLIC.ciclista c 
WHERE c.dorsal NOT IN (SELECT e.dorsal FROM public.etapa e)

--1.2
SELECT c.nombre, c.edad
FROM PUBLIC.ciclista c 
WHERE c.dorsal NOT IN (SELECT p.dorsal FROM public.puerto p )

--1.3
SELECT DISTINCT e.director FROM PUBLIC.equipo e
INNER JOIN
public.ciclista c
ON e.nomequipo = c.nomequipo
WHERE c.dorsal NOT IN (SELECT e.dorsal FROM public.etapa e)

--1.4
SELECT DISTINCT c.dorsal, c.nombre
FROM
public.ciclista c
INNER JOIN 
public.lleva l
ON c.dorsal = l.dorsal
INNER JOIN
public.maillot m
ON l.código = m.código
WHERE l.código NOT IN (SELECT m.código FROM PUBLIC.maillot m)

