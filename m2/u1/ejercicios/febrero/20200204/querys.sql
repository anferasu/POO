--2
create view consultaproductos as
select p."cÓdigo_artÍculo", p."secciÓn", p.precio from productos p where p.precio >100;

create view consultacompletaproductos as
select c."cÓdigo_artÍculo", c."secciÓn", c.precio from consultaproductos c
where (c.secciÓn ='DEPORTES');


ALTER table productos alter importado set default 0;

INSERT INTO consultaproductos VALUES('AR90','NOVEDADES',5); 

--6
-- se activa la opcion check local
INSERT INTO consultaproductos VALUES('AR89','NOVEDADES',5); 
--1 el nuevo registro para la vista «consultaproductos» viola la opción check porque no cumple con la condicion mayor a 100
INSERT INTO consultaproductos VALUES('AR89','NOVEDADES',110);
--si deja guardar porque el valor precio si es mayor que 100 en la columna

--8

INSERT INTO consultacompletaproductos VALUES('AR97','DEPORTES',5);  

select * from consultacompletaproductos

    select * from consultaproductos

    select * from productos   




