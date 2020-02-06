--si
ALTER TABLE Empleados
  ADD CONSTRAINT fk_oficina
    FOREIGN KEY (id_ofi)
      REFERENCES Oficinas (id_ofi);


--si
alter table Entrevista
  add constraint fk_Empleados
    foreign key (id_emp)
     references Empleados(id_emp);
  
--si 
alter table Entrevista
  add constraint fk_Clientes
    foreign key (id_cli)
     references Clientes (id_cli);

--si
alter table Administrativo
  add constraint fk_Empleados
    foreign key (id_adm)
     references Empleados (id_emp);

--si
alter table Pariente
add constraint fk_Empleados
foreign key (id_emp)
references Empleados(id_emp);  
--si
ALTER TABLE Inmueble_Factura
ADD CONSTRAINT FKInmueble_FacturaInmuebles
FOREIGN KEY (id_inm) REFERENCES Inmuebles(id_inm);
--si
ALTER TABLE Inmueble_Factura
ADD CONSTRAINT FKInmueble_FacturaFacturas
FOREIGN KEY (id_fac) REFERENCES Facturas(id_fac);
--si
ALTER TABLE Facturas
ADD CONSTRAINT FKFacturasClientes
FOREIGN KEY (id_cli) REFERENCES Clientes(id_cli);

--si
ALTER TABLE Facturas ADD CONSTRAINT FKFacturaPago FOREIGN KEY (id_fac) REFERENCES Pago(id_pag);



--si
ALTER TABLE Publicidad add primary key (id_pub);
--si
ALTER TABLE Publicidad add CONSTRAINT FKPublicidadInm foreign key (id_inm) REFERENCES Inmuebles(id_inm);
--si
ALTER TABLE Publicidad add CONSTRAINT FKPublicidadper foreign key (id_per) REFERENCES Periodico(id_per);


--- no hace parte
--ALTER TABLE Publicidad DROP CONSTRAINT publicidad_id_inm_fkey;
--ALTER TABLE Publicidad DROP CONSTRAINT publicidad_id_per_fkey;


--si
alter table periodico add CONSTRAINT FK_publicidad_id_pub FOREIGN KEY (id_per)
REFERENCES publicidad (id_pub) ON DELETE CASCADE ON UPDATE CASCADE;

--si
alter table propietario add CONSTRAINT FK_inmuebles_id_inm FOREIGN KEY (id_pro)
REFERENCES inmuebles (id_inm) ON DELETE CASCADE ON UPDATE CASCADE;







ALTER TABLE oficinas ADD FOREIGN KEY (id_ofi) REFERENCES inmuebles(id_ofi) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE clientes ADD FOREIGN KEY (id_cli) REFERENCES visitas(id_inm) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE clientes ADD FOREIGN KEY (id_cli) REFERENCES facturas(id_fac) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE clientes ADD FOREIGN KEY (id_cli) REFERENCES contrato(id_con) ON DELETE CASCADE ON UPDATE CASCADE;

--no
ALTER TABLE clientes ADD FOREIGN KEY (id_cli) REFERENCES entrevista(id_emp) ON DELETE CASCADE ON UPDATE CASCADE;


/*Antonio*/


alter table inspecciones add  CONSTRAINT fkey_inmuebles_id_inm FOREIGN KEY (id_inm) REFERENCES inmuebles (id_inm)


alter table inmuebles add CONSTRAINT fkey_oficinas_id_ofi FOREIGN KEY (id_ofi) REFERENCES oficinas (id_ofi)
alter table inmuebles add  CONSTRAINT fkey_empleados_id_emp FOREIGN KEY (id_emp) REFERENCES empleados (id_emp)
alter table inmuebles add  CONSTRAINT fkey_visitas_id_inm FOREIGN KEY (id_inm)   REFERENCES visitas (id_inm)