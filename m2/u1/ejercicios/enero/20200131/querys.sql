--1

create view consulta1 as
select c."cÓdigo_cliente" as "CODIGO CLIENTE", 
       p."nÚmero_de_pedido" as "NUMERO PEDIDO",
       c.empresa as "EMPRESA",
       c."poblaciÓn" as "POBLACION"
from clientes c
INNER JOIN pedidos p
ON c."cÓdigo_cliente"=p."cÓdigo_cliente"
WHERE c."poblaciÓn" in ('MADRID', 'BARCELONA', 'ZARAGOZA');

--4

create view consulta1optimizada as
SELECT c1."cÓdigo_cliente", c1.empresa, c1."poblaciÓn", p."nÚmero_de_pedido" from pedidos p
  JOIN(
  SELECT c."cÓdigo_cliente", c.empresa, c."poblaciÓn" from clientes c
  WHERE c."poblaciÓn" in ('MADRID', 'BARCELONA', 'ZARAGOZA')
  ) as c1
USING ("cÓdigo_cliente")

create view subconsulta2optimizada as
SELECT c."cÓdigo_cliente", c.empresa, c."poblaciÓn" from clientes c
  WHERE c."poblaciÓn" in ('MADRID', 'BARCELONA', 'ZARAGOZA')

create view consulta2optimizada as
SELECT c1."cÓdigo_cliente", c1.empresa, c1."poblaciÓn", p."nÚmero_de_pedido" from pedidos p
  JOIN(select * from subconsulta2optimizada)c1  
  on c1."cÓdigo_cliente" = p."cÓdigo_cliente";


--6
create view subconsulta1consulta2 as
--consulta 1
select p."nÚmero_de_pedido", p.fecha_de_pedido, p.forma_de_pago, p."cÓdigo_cliente"  from pedidos p
  where date_part('year',p.fecha_de_pedido)=2002 and p.forma_de_pago = 'TARJETA';


--consulta completa
SELECT c.empresa,
       c."poblaciÓn",
       c1."nÚmero_de_pedido",
       c1.fecha_de_pedido,
       c1.forma_de_pago
  FROM clientes c
JOIN (select p."nÚmero_de_pedido", p.fecha_de_pedido, p.forma_de_pago, p."cÓdigo_cliente"  from pedidos p
  where date_part('year',p.fecha_de_pedido)=2002 and p.forma_de_pago = 'TARJETA') c1
using (cÓdigo_cliente)
order by c1.fecha_de_pedido asc;

--consulta ejecutando vista de la consulta 1
SELECT c.empresa,
       c."poblaciÓn",
       c1."nÚmero_de_pedido",
       c1.fecha_de_pedido,
       c1.forma_de_pago
  FROM clientes c
JOIN (select * from subconsulta1consulta2 )c1  
  on c."cÓdigo_cliente" = c1."cÓdigo_cliente"
order by c1.fecha_de_pedido asc;


--7

--consulta 1

create view c1consulta3 as
select COUNT(*) as n_pedidos, p."cÓdigo_cliente" from pedidos p
GROUP by p."cÓdigo_cliente";

--consulta 2
create view c2consulta3 as
SELECT max(c1.n_pedidos) as maximo  from (select COUNT(*) as n_pedidos, p."cÓdigo_cliente" from pedidos p
GROUP by p."cÓdigo_cliente")c1;

--consulta 3
SELECT c1."cÓdigo_cliente"  from 
(select COUNT(*) as n_pedidos, p."cÓdigo_cliente" from pedidos p
GROUP by p."cÓdigo_cliente")c1
join 
(SELECT max(c1.n_pedidos) as maximo  from (select COUNT(*) as n_pedidos, p."cÓdigo_cliente" from pedidos p
GROUP by p."cÓdigo_cliente")c1)c2
on c1.n_pedidos=c2.maximo

SELECT c1."cÓdigo_cliente"  from 
(select * from c1consulta3)c1
join 
(select * from c2consulta3)c2
on c1.n_pedidos=c2.maximo


select * from clientes; 
select *  from pedidos p


