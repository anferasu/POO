--
-- hoja 2 consultass de seleccion

--1.1.
SELECT
  COUNT(c.nombre)
  FROM
  PUBLIC.ciclista c
--101

--1.2.
SELECT
  COUNT(c.nombre)
  FROM 
  PUBLIC.ciclista c
  WHERE c.nomequipo = 'Banesto'

--11

--1.3.
SELECT
  round (AVG(c.edad))
  FROM
  PUBLIC.ciclista c
--30

--1.4.
SELECT
  round (AVG(c.edad))
  FROM
  PUBLIC.ciclista c
   WHERE c.nomequipo = 'Banesto'
--30

--1.5

SELECT
  round (AVG(c.edad),2), c.nomequipo
  FROM
  PUBLIC.ciclista c
  GROUP BY c.nomequipo

  /*
31	TVM
30	Telecom
28	Castorama
30	Motorola
29	Mercatone Uno
31	Kelme
31	Lotus Festina
30	Wordperfect
30	Navigare
32	Carrera
29	ONCE
30	Jolly Club
28	Gewiss
25	Euskadi
32	Gatorade
31	Bresciali-Refin
29	Amore Vita
31	Mapei-Clas
28	Artiach
30	Seguros Amaya
30	Banesto */

--1.6
SELECT
  COUNT(c.nombre),c.nomequipo
  FROM
  PUBLIC.ciclista c
  GROUP BY c.nomequipo

  /*
    6	TVM
4	Telecom
2	Castorama
3	Motorola
8	Mercatone Uno
7	Kelme
3	Lotus Festina
3	Wordperfect
5	Navigare
3	Carrera
5	ONCE
2	Jolly Club
8	Gewiss
2	Euskadi
4	Gatorade
4	Bresciali-Refin
4	Amore Vita
7	Mapei-Clas
7	Artiach
3	Seguros Amaya
11	Banesto*/

--1.7
  SELECT
    COUNT(p.nompuerto)
    FROM
    PUBLIC.puerto p
--14

--1.8
SELECT
    COUNT(p.nompuerto)
    FROM
    PUBLIC.puerto p
  WHERE p.altura > 1500
--9

--1.9
SELECT
  c.nomequipo, COUNT(c.nomequipo) 
  FROM
  PUBLIC.ciclista c
  GROUP BY c.nomequipo
  HAVING COUNT(c.nomequipo)>4

/*
TVM	          6
Mercatone Uno	8
Kelme	        7
Navigare	    5
ONCE	        5
Gewiss	      8
Mapei-Clas	  7
Artiach	      7
Banesto	      11*/

--1.10

SELECT
  c.nomequipo, COUNT(c.nomequipo) 
  FROM
  PUBLIC.ciclista c
  WHERE c.edad BETWEEN 28 AND 32
  GROUP BY c.nomequipo
  HAVING COUNT(c.nomequipo)>4

  /*
TVM	          5
Mercatone Uno	7
Kelme	        6
Banesto	      6*/

--1.11
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
    ORDER BY c.nombre
/*
Alessio Di Basco	3
Giorgio Furlan	  7
Jean Van Poppel	  2
Laurent Jalabert	5
Mario Cipollini	  1
Miguel Induráin	  14
Pedro Delgado	    4
Tony Rominger	    1*/

--1.12
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
    ORDER BY c.dorsal ASC
--2 12 1 27
/*    
1
2
4
8
10
12
22
27 */

--1.1
SELECT
  c.edad
  FROM
  PUBLIC.ciclista c
  WHERE c.nomequipo ='Banesto'
  ORDER BY c.edad ASC

--1.2
SELECT
  c.edad, c.nomequipo
  FROM
  PUBLIC.ciclista c
  WHERE c.nomequipo ='Banesto' OR c.nomequipo ='Navigare'
  ORDER BY c.edad ASC

--1.3
SELECT
  c.dorsal, c.nombre
  FROM
  PUBLIC.ciclista c
  WHERE c.nomequipo ='Banesto' AND c.edad BETWEEN 25 AND 32
  ORDER BY c.edad ASC


--1.5
SELECT
  SUBSTRING(c.nomequipo,1,1) AS "Inicial_Nombre_Equipo"
  FROM
  PUBLIC.ciclista c
  WHERE c.nombre LIKE 'R%'

--*/
/*    
N
T
L
T
M
  */  
--1.6
SELECT
  e.numetapa
  FROM
  public.etapa e
  WHERE e.salida=e.llegada

/*
1
8
18*/

--1.7

SELECT
  DISTINCT e.dorsal, e.numetapa
  FROM
  PUBLIC.etapa e
  INNER JOIN 
  public.lleva l
  ON
  e.dorsal=l.dorsal
  INNER JOIN
  public.maillot m
  ON
  l.código = m.código 
  WHERE e.salida <> e.llegada
  ORDER BY e.dorsal ASC

  /*

2	  10
2	  19
2	  20
4	  17
10	15
12	3
12	12
22	7
27	5
27	21

    */

--1.8

  SELECT
    * 
    FROM
    public.puerto p
    WHERE p.altura BETWEEN 1000 AND 2000 OR p.altura > 2400

/*
Cerler-Circo de Ampriu	  2500	E	5,87	11	9
Coll de la Comella	      1362	1	8,07	10	2
Coll de Ordino	          1980	E	5,3	  10	7
Cruz de la Demanda	      1850	E	7	11	20
Lagos de Covadonga	      1134	E	6,86	16	42
Navacerrada	              1860	1	7,5	  19	2
Puerto de la Morcuera	    1760	2	6,5	  19	2
Puerto de Mijares	        1525	1	4,9	  18	24
Puerto de Navalmoral	    1521	2	4,3	  18	2
Puerto de Pedro Bernardo	1250	1	4,2	  18	25
Sierra Nevada	            2500	E	6	2	  26
  */

--1.9
  SELECT
    c.dorsal 
    FROM
    public.ciclista c
    INNER JOIN
    public.puerto p
    ON
    c.dorsal=p.dorsal
    WHERE p.altura BETWEEN 1000 AND 2000 OR p.altura > 2400
    ORDER BY c.dorsal ASC

/*
2
2
2
2
7
9
20
24
25
26
42*/

--1.10

SELECT
  COUNT(c.nombre)
  FROM
  PUBLIC.ciclista c
  INNER JOIN 
  PUBLIC.etapa e
  ON
  c.dorsal=e.dorsal

--respuesta 21

--1.11

SELECT
  e.numetapa
  FROM
  PUBLIC.etapa e
  INNER JOIN
  PUBLIC.puerto p
  ON
  e.numetapa = p.numetapa

  SELECT
    p.numetapa
    FROM 
    PUBLIC.puerto p

/*
10
11
10
10
11
16
19
15
19
18
18
18
2 */

--1.12

SELECT
  c.nombre
  FROM
  PUBLIC.ciclista c
  INNER JOIN
  PUBLIC.puerto p
  ON
  c.dorsal = p.dorsal


--1.13
SELECT
  l.código
  FROM
  PUBLIC.lleva l
  INNER JOIN
  PUBLIC.puerto p
  ON
  l.numetapa = p.numetapa

--1.14
  SELECT
    l.código, COUNT(p.nompuerto)
    FROM
    PUBLIC.lleva l
    INNER JOIN
    PUBLIC.puerto p
    ON
    l.numetapa = p.numetapa 
   -- AND  l.dorsal = p.dorsal
    GROUP BY l.código
/*
MMS	1
MMV	14
MMO	14
MGE	14
MRE	14
MSE	14
*/

--1.15
SELECT
  round (AVG(p.altura))
  FROM
  PUBLIC.puerto p

SELECT
  SUM(p.altura)/COUNT(p.altura) 
  FROM
  PUBLIC.puerto p




