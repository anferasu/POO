--1
SELECT
   a.nombre_al, a.edad_al
FROM public.alumnos a
INNER JOIN public.estudian e
  ON a.dni_al = e.dni_al
INNER JOIN public.asignaturas a1
  ON e.cod_as = a1.cod_as
WHERE a1.nombre_as like 'D%';

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
INNER JOIN public.profesores p
ON e.d = p.



  SELECT * from
public.asignaturas;

SELECT * FROM
public.estudian;

SELECT * FROM
public.profesores;