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

select  DISTINCT codigo_oficina  from oficina
 where codigo_oficina <> all 
  (SELECT distinct codigo_oficina from cliente  join empleado 
    on codigo_empleado_rep_ventas = codigo_empleado JOIN pedido 
    ON cliente.codigo_cliente= pedido.codigo_cliente join detalle_pedido 
    on pedido.codigo_pedido = detalle_pedido.codigo_pedido JOIN producto
    on gama = producto.gama
where pedido.estado = 'Entregado' and gama_producto='Frutales')


--10

SELECT  * from empleado e
where e.codigo_empleado NOT in (select c.codigo_empleado_rep_ventas from cliente c)

--1.4.7
  --9
   
   
     SELECT d.codigo_producto, COUNT(d.codigo_pedido)
    from detalle_pedido d
    GROUP BY d.codigo_producto
     ORDER BY COUNT(d.codigo_pedido) DESC
     LIMIT 20;



--1.4.8.1

select DISTINCT c.codigo_cliente, c.nombre_cliente from cliente c, pago p 
where c.codigo_cliente = p.codigo_cliente and c.limite_credito > p.total

--1.4.8.2

select * from detalle_pedido d 
where d.codigo_producto = any (SELECT p.codigo_producto from producto p where p.cantidad_en_stock = (SELECT min(p.cantidad_en_stock) from producto p))


--1.4.8.3

select e.nombre, e.apellido1, e.puesto from empleado e
where e.codigo_empleado NOT IN  (SELECT e.codigo_empleado  from cliente c INNER JOIN empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado) 

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
 