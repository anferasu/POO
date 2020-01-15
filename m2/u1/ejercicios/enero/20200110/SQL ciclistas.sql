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
SELECT DISTINCT l.dorsal 
FROM
public.lleva l
INNER JOIN
public.etapa e
ON l.dorsal = e.dorsal



--1.8

SELECT DISTINCT e.numetapa
FROM
public.etapa e
INNER JOIN
public.puerto p
ON e.numetapa = p.numetapa

--1.9
SELECT distinct e.kms,e.numetapa FROM
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
SELECT COUNT(DISTINCT e.dorsal) from
public.etapa e
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

SELECT DISTINCT e.numetapa 
FROM
public.puerto p
INNER JOIN
public.etapa e
ON e.numetapa = p.numetapa
INNER JOIN
public.ciclista c
ON e.dorsal = c.dorsal
WHERE c.nomequipo = 'Banesto' AND e.kms >= 200


-----------------------------------------------------------------
--1.1
SELECT c.nombre, c.edad
FROM PUBLIC.ciclista c 
WHERE c.dorsal NOT IN (SELECT e.dorsal FROM public.etapa e)

SELECT c.nombre, c.edad
FROM PUBLIC.ciclista c 
WHERE NOT exists (SELECT null FROM public.etapa e WHERE c.dorsal=e.dorsal)

SELECT c.nombre, c.edad
FROM PUBLIC.ciclista c
LEFT JOIN
public.etapa e
ON c.dorsal = e.dorsal       
WHERE e.dorsal IS null

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

SELECT distinct c.dorsal, c.nombre FROM PUBLIC.ciclista c 
INNER JOIN
public.lleva l
ON c.dorsal = l.dorsal
WHERE c.dorsal NOT IN (SELECT e.dorsal FROM PUBLIC.etapa e)


--1.5 
SELECT c.dorsal FROM PUBLIC.ciclista c EXCEPT
SELECT DISTINCT l.dorsal FROM public.maillot m INNER JOIN public.lleva l ON m.código = l.código WHERE m.color = 'amarillo'


--1.6

SELECT e.numetapa
FROM PUBLIC.etapa e 
WHERE NOT exists (SELECT null FROM public.puerto p WHERE e.numetapa=p.numetapa)

--1.7
SELECT trunc (AVG(e.kms),2)
FROM PUBLIC.etapa e 
WHERE NOT exists (SELECT null FROM public.puerto p WHERE e.numetapa=p.numetapa)

--1.8

SELECT COUNT(DISTINCT c.dorsal) FROM
public.ciclista c
WHERE c.dorsal NOT IN (SELECT e.dorsal FROM public.etapa e)

--1.9
SELECT DISTINCT e.dorsal from
public.etapa e
WHERE NOT exists (SELECT null FROM public.puerto p WHERE e.numetapa = p.numetapa)

--1.10



--equipos cuyos componentes halan ganados todos alguna etapa
SELECT DISTINCT e.nomequipo
   FROM PUBLIC.equipo e 
  WHERE NOT EXISTS (SELECT null FROM PUBLIC.ciclista c WHERE e.nomequipo = c.nomequipo)

SELECT * FROM equipo e LEFT JOIN ciclista c ON e.nomequipo = c.nomequipo
  WHERE c.nomequipo IS null
