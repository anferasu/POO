--1
WITH libro
(SELECT
   a.nombre_al, a.edad_al
FROM public.alumnos a
INNER JOIN public.estudian e
  ON a.dni_al = e.dni_al
INNER JOIN public.asignaturas a1
  ON e.cod_as = a1.cod_as
WHERE a1.nombre_as like 'D%';)

/* 
Trainer/Consultant                                
Sales Representative                              
Secretary                                         
Design Engineer                                   
Commercial Manager                                
Credit Specialist 
*/

--2
SELECT
   DISTINCT a.edad_al,COUNT(a.edad_al) AS cantidad_alumnos
FROM public.alumnos a
  GROUP BY a.edad_al;

--3
SELECT
   *
FROM public.alumnos a
WHERE a.edad_al BETWEEN 18 AND 25;

--4
SELECT p.nombre_p, p.telefono_p from
public.profesores p
WHERE p.nombre_p LIKE 'P%';

--5
SELECT a.nombre_al, a.apellido1_al FROM
public.alumnos a
INNER JOIN public.estudian e
ON a.dni_al =e.dni_al
INNER JOIN public.asignaturas a1
ON a1.cod_as = e.cod_as
INNER JOIN public.profesores p
ON p.dni_p = a1.dni_p
WHERE p.nombre_p like 'Pepe';

--6


SELECT (a1.nombre_al ||' '|| a1.apellido1_al ||' '||a1.apellido2_al) AS nombre_completo ,  e.nota_al_as, a.nombre_as 
FROM estudian e
INNER JOIN asignaturas a
ON e.cod_as = a.cod_as
INNER JOIN alumnos a1
ON a1.dni_al = e.dni_al
WHERE e.nota_al_as IS NOT NULL AND e.nota_al_as IN (SELECT MAX(e.nota_al_as) FROM estudian e);

SELECT * FROM estudian e WHERE e.nota_al_as >= 9;


--7

SELECT (a.nombre_al ||' '|| a.apellido1_al ||' '||a.apellido2_al) AS nombre_completo, a.direccion_al 
  FROM alumnos a
WHERE a.direccion_al LIKE '%Fran%';

--8
SELECT (a.nombre_al ||' '|| a.apellido1_al ||' '||a.apellido2_al) AS nombre_completo, a.edad_al 
  FROM alumnos a
ORDER BY a.edad_al DESC;

--9


--10
SELECT * FROM profesores p WHERE dni_p = '82341356H';

UPDATE public.profesores 
  SET nombre_p = 'Helli'
  WHERE dni_p = '82341356H';

--11

DELETE FROM profesores
WHERE apellido1_p = 'Martínez';

--12

--13

--14
SELECT * FROM alumnos a ORDER BY a.telefono_al ASC;

--15
SELECT * FROM alumnos a 
ORDER BY a.edad_al DESC, nombre_al ASC;

--16
SELECT (a.nombre_al ||' '|| a.apellido1_al ||' '||a.apellido2_al) AS nombre_completo, e.nota_al_as FROM alumnos a
INNER JOIN estudian e
ON a.dni_al = e.dni_al
WHERE e.nota_al_as BETWEEN 7 AND 9 OR a.ciudad_al = 'Mandurah';

--17
SELECT (a.nombre_al ||' '|| a.apellido1_al ||' '||a.apellido2_al) AS nombre_completo, a1.nombre_as FROM alumnos a
INNER JOIN estudian e
ON a.dni_al = e.dni_al
INNER JOIN asignaturas a1
ON e.cod_as = a1.cod_as
WHERE e.nota_al_as > 5;

--18
SELECT  * FROM alumnos a WHERE a.nombre_al LIKE 'Jhon%';

SELECT a.nombre_al, TRUNC(AVG (e.nota_al_as),2) FROM estudian e
INNER JOIN alumnos a
ON e.dni_al = a.dni_al
WHERE a.nombre_al LIKE 'F%'
group BY a.nombre_al;

--20
--No existe campo fecha

--21
SELECT a.nombre_al, TRUNC(AVG (e.nota_al_as),2) FROM estudian e
INNER JOIN alumnos a
ON e.dni_al = a.dni_al
WHERE e.nota_al_as IS NOT null
group BY a.nombre_al;









  SELECT * from
public.asignaturas;

SELECT * FROM
public.estudian;

SELECT * FROM
public.profesores WHERE dni_p = '96887314Z';