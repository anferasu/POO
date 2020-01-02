--1.1 Listar las edades de los ciclistas (sin repetidos)
SELECT
  DISTINCT edad
FROM public.ciclista ORDER BY edad ASC

--1.2 Listar las edades de los ciclistas de Artiach
  SELECT
   DISTINCT edad
FROM public.ciclista WHERE nomequipo = 'Artiach' ORDER BY edad ASC

--1.3 Listar las edades de los ciclistas de Artiach o de Amore Vita
SELECT
   DISTINCT edad
FROM public.ciclista WHERE nomequipo = 'Artiach' or nomequipo = 'Amore Vita' ORDER BY edad ASC

--1.4 listar los dorsales de los ciclistas cuya edad sea menor que 25 o mayor que 30
SELECT
  dorsal
FROM public.ciclista WHERE edad < 25 OR edad >30

--1.5
SELECT
  dorsal
FROM public.ciclista WHERE edad BETWEEN 28 AND 32 AND nomequipo='Banesto' 

--1.6

SELECT 
SUBSTR(nombre, 1, STRPOS(nombre, ' ')) AS nombre_ciclista
FROM public.ciclista WHERE LENGTH(nombre) > 8


