--2
create view consultaproductos as
select p."cÓdigo_artÍculo", p."secciÓn", p.precio from productos p where p.precio >100;

select c."cÓdigo_artÍculo", c."secciÓn", c.precio from consultaproductos c
where (c.secciÓn ='DEPORTES');

select c."cÓdigo_artÍculo", c."secciÓn", c.precio from consultaproductos c
where (c.secciÓn ='DEPORTES');

INSERT INTO productos ('AR90','NOVEDADES',5) 
select * from consultaproductos



