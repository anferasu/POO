
-- hoja 1 consultass de seleccion
--1.1 Listar las edades de los ciclistas (sin repetidos)
SELECT
  DISTINCT edad
FROM public.ciclista ORDER BY edad ASC
/******************--
18
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
--******************/

--1.2 Listar las edades de los ciclistas de Artiach
 SELECT
   DISTINCT edad
FROM public.ciclista WHERE nomequipo = 'Artiach' ORDER BY edad ASC

/******************--
25
26
27
29
31
32
--******************/

--1.3 Listar las edades de los ciclistas de Artiach o de Amore Vita
SELECT
   DISTINCT edad
FROM public.ciclista WHERE nomequipo = 'Artiach' or nomequipo = 'Amore Vita' ORDER BY edad ASC

/******************--
18
25
26
27
29
31
32
36
--******************/

--1.4 listar los dorsales de los ciclistas cuya edad sea menor que 25 o mayor que 30
SELECT
  dorsal
FROM public.ciclista WHERE edad < 25 OR edad >30


/******************--
1
2
5
6
8
9
11
12
14
15
17
18
19
21
22
25
28
36
40
46
47
49
58
63
66
73
74
75
76
77
78
79
80
81
83
84
86
87
89
95
1000
--******************/

--1.5
SELECT
  dorsal
FROM public.ciclista WHERE edad BETWEEN 28 AND 32 AND nomequipo='Banesto' 

--******************--
--1
--30
--31
--56
--70
--94
--******************/

--1.6

SELECT 
nombre
FROM public.ciclista WHERE CHAR_LENGTH (nombre) > 8


--******************--

--******************--

--1.7
 

--1.8

SELECT
DISTINCT c.nombre
FROM 
public.ciclista c 
INNER JOIN
public.lleva l ON
c.dorsal = l.dorsal 
INNER JOIN 
public.maillot m ON 
l.código= m.código
WHERE m.código ='MGE'
ORDER BY c.nombre
--******************--
--Alex Zulle
--Melchor Mauri
--Miguel Induráin
--Mikel Zarrabeitia
--Pedro Delgado
--Tony Rominger
--******************--

--1.9

SELECT
nompuerto
FROM
public.puerto
WHERE altura > 1500

--1.10

SELECT
c.dorsal
FROM
public.ciclista c
INNER JOIN
public.puerto p
ON c.dorsal = p.dorsal
WHERE p.pendiente > 8 AND
p.altura BETWEEN 1800 AND 3000

/* respuesta 0 */



