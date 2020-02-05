create database inmobiliaria;

create table periodico(
id_per integer NOT NULL,
nombre_per varchar(20) DEFAULT NULL,
direccion_per varchar(20) DEFAULT NULL,
telefono_per integer DEFAULT NULL,
fax_per integer DEFAULT NULL,
nombre_pers_cont_per varchar(20) DEFAULT NULL,
primary key (id_per)
);

create table propietario(
id_pro integer NOT NULL,
nombre_pro varchar(20) DEFAULT NULL,
direccion_pro varchar(20) DEFAULT NULL,
telefono_pro integer DEFAULT NULL,
tipo_empresa_pro varchar (20) DEFAULT NULL,
persona_contrato_pro varchar(20) DEFAULT NULL,
primary key (id_pro)
);



alter table periodico add CONSTRAINT FK_publicidad_id_pub FOREIGN KEY (id_per)
REFERENCES publicidad (id_pub) ON DELETE CASCADE ON UPDATE CASCADE;

alter table propietario add CONSTRAINT FK_inmuebles_id_inm FOREIGN KEY (id_pro)
REFERENCES inmuebles (id_inm) ON DELETE CASCADE ON UPDATE CASCADE;




