drop database inmobiliaria
drop table administrativo;
drop table clientes;
drop table contrato;
drop table directores;
drop table empleados;
drop table entrevista;
drop table facturas;
drop table inmueble_factura;
drop table inmuebles;
drop table inspecciones;
drop table oficinas;
drop table pago;
drop table pariente;
drop table periodico;
drop table propietario;
drop table publicidad;
drop table visitas;

ALTER TABLE publicidad DROP CONSTRAINT fkpublicidadper; 
ALTER TABLE clientes DROP CONSTRAINT clientes_id_cli_fkey1;
ALTER TABLE clientes DROP CONSTRAINT clientes_id_cli_fkey2;
ALTER TABLE clientes DROP CONSTRAINT clientes_id_cli_fkey3;