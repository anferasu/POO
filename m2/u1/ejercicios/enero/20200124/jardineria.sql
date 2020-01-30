---1.4.4
--1
SELECT * FROM pago
WHERE fecha_pago >='01/01/2008' AND fecha_pago < '01/01/2009';

SELECT * FROM pago
WHERE fecha_pago BETWEEN '01/01/2008' AND  '31/12/2008'

SELECT * FROM pago
WHERE  EXTRACT(YEAR FROM fecha_pago)='2008' 

SELECT * FROM pago
WHERE  date_part('year', fecha_pago)='2008'

---1.4.5
--7
SELECT c.nombre_cliente, e.nombre AS nombre_representante, o.ciudad FROM cliente c 
  INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado 
  INNER JOIN oficina o ON e.codigo_oficina = o.codigo_oficina

--10
select DISTINCT c.codigo_cliente, p1.gama from cliente c 
  INNER JOIN pedido p
  on c.codigo_cliente = p.codigo_pedido
  INNER JOIN detalle_pedido d
  on p.codigo_pedido =  d.codigo_pedido
  INNER JOIN producto p1
  on p1.codigo_producto = d.codigo_producto


  --1.4.6
  --2

select p.codigo_producto, p.nombre FROM producto p
where p.codigo_producto not in (select d.codigo_producto from detalle_pedido d)

select p.codigo_producto, p.nombre FROM producto p left join detalle_pedido d
on p.codigo_producto = d.codigo_producto
where d.codigo_pedido is null


 --3

select  DISTINCT codigo_oficina from oficina
 where codigo_oficina <> all 
  (SELECT distinct codigo_oficina from cliente  join empleado 
    on codigo_empleado_rep_ventas = codigo_empleado JOIN pedido 
    ON cliente.codigo_cliente= pedido.codigo_cliente join detalle_pedido 
    on pedido.codigo_pedido = detalle_pedido.codigo_pedido JOIN producto
    on detalle_pedido.codigo_producto = producto.codigo_producto JOIN gama_producto
    on gama_producto.gama = producto.gama
where gama_producto.gama ='Frutales')


--10

select e.*, e2.nombre as Jefe_Asociado from empleado e left join empleado e2
  on e.codigo_jefe = e2.codigo_empleado where e.codigo_empleado not in (select distinct cliente.codigo_empleado_rep_ventas from cliente)


--1.4.7
  --9
   
     SELECT d.codigo_producto, sum(d.cantidad)
    from detalle_pedido d
    GROUP BY d.codigo_producto
     ORDER BY SUM(d.cantidad) DESC
     LIMIT 20;

--15

  SELECT c2.base_imponible, c2.iva, c2.base_imponible+c2.iva as Total_facturado
    from (SELECT c1.base_imponible, c1.base_imponible*0.21 as iva FROM
      (SELECT sum (cantidad*precio_unidad)as base_imponible from detalle_pedido) c1)c2;

  SELECT c1.base_imponible, c1.base_imponible*1.21 as Total_facturado, c1.base_imponible*0.21 as iva
    from (SELECT sum (cantidad*precio_unidad)as base_imponible from detalle_pedido) c1;

--1.4.8.1

select c.codigo_cliente, c.nombre_cliente, c.limite_credito, max(p.total) from cliente c, pago p 
where c.codigo_cliente = p.codigo_cliente and c.limite_credito > p.total
GROUP by c.codigo_cliente, c.nombre_cliente, c.limite_credito;


select cliente.codigo_cliente, cliente.limite_credito from cliente
  where limite_credito > (select max(pago.total) from pago
    where cliente.codigo_cliente=pago.codigo_cliente
  GROUP by codigo_cliente);

   

--1.4.8.2

select * from detalle_pedido d 
where d.codigo_producto = any (SELECT p.codigo_producto from producto p where p.cantidad_en_stock = (SELECT min(p.cantidad_en_stock) from producto p))

select producto.nombre from producto
  where cantidad_en_stock <= all
  (select producto.cantidad_en_stock from producto)
 


--1.4.8.3

select e.nombre, e.apellido1, e.puesto from empleado e
where e.codigo_empleado NOT IN  (SELECT e.codigo_empleado  from cliente c INNER JOIN empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado) 

select e.nombre, e.apellido1, e.puesto from empleado e
where e.codigo_empleado NOT IN  (SELECT c.codigo_empleado_rep_ventas  from cliente c)      



--1.4.8.4

SELECT p.codigo_producto from producto p
  where EXISTS (SELECT d.codigo_producto from detalle_pedido d where d.codigo_producto = p.codigo_producto)

--1.4.9
--5
SELECT c.nombre_cliente, e.nombre, e.apellido1, o.ciudad from cliente c
INNER JOIN empleado e
on c.codigo_empleado_rep_ventas = e.codigo_empleado
INNER JOIN oficina o
on e.codigo_oficina = o.codigo_oficina

--7
SELECT o.ciudad, COUNT(e.codigo_empleado) as total_empleados from oficina o
INNER JOIN empleado e
on o.codigo_oficina = e.codigo_oficina
GROUP BY o.ciudad


SELECT * FROM cliente;
SELECT * FROM detalle_pedido;
SELECT * FROM empleado;
SELECT * FROM gama_producto;
SELECT * FROM oficina;
SELECT * FROM pago;
SELECT * FROM pedido;
SELECT * FROM producto;
 