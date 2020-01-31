create view consulta1 as
select c."cÓdigo_cliente" as "CODIGO CLIENTE", 
       p."nÚmero_de_pedido" as "NUMERO PEDIDO",
       c.empresa as "EMPRESA",
       c."poblaciÓn" as "POBLACION"
from clientes c
INNER JOIN pedidos p
ON c."cÓdigo_cliente"=p."cÓdigo_cliente"
WHERE c."poblaciÓn" in ('MADRID', 'BARCELONA', 'ZARAGOZA')

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
  on c1."cÓdigo_cliente" = p."cÓdigo_cliente"


select * from clientes; 
select *  from pedidos p


