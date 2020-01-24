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
SELECT c.nombre_cliente, e.nombre AS nombre_representante, o.ciudad FROM cliente c INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado INNER JOIN oficina o ON e.codigo_oficina = o.codigo_oficina

--10



SELECT * FROM cliente;
SELECT * FROM detalle_pedido;
SELECT * FROM empleado;
SELECT * FROM gama_producto;
SELECT * FROM oficina;
SELECT * FROM pago;
SELECT * FROM pedido;
SELECT * FROM producto;
 