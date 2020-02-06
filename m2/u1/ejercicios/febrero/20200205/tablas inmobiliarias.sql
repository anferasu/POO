-- Directores
CREATE TABLE Directores (
  id_dir            integer,
  pago_anual_dir    integer,
  bonif_mensual_dir integer
);
ALTER TABLE Directores
  ADD PRIMARY KEY (id_dir);

-- Empleados
CREATE TABLE Empleados (
  id_emp            integer,
  dni_emp           varchar(9),
  nombre_emp        varchar(255),
  direccion_emp     varchar(255),
  telefono_emp      varchar(9),
  fecha_naci_emp    date,
  cargo_emp         varchar(255),
  fecha_ingreso_emp date,
  salario_anual_emp int,
  id_ofi            int
);
ALTER TABLE Empleados
  ADD PRIMARY KEY (id_emp);

/*David*/
  create table Entrevista (
  id_emp integer,
  id_cli integer,
  fecha_ent date, 
  comentario_ent varchar (255),
  primary key (id_emp,id_cli)
);

CREATE table Administrativo (
  id_adm integer,
  velocidad_escri_adm integer,
  primary key (id_adm)
  );

create table Pariente (
  id_par integer,
  nombre_par varchar(255),
  parentesco_par varchar(255),
  direccion_par varchar (255),
  telefono_par varchar(9),
  id_emp integer,
  primary key (id_par));

/*Oscar*/

-- Tabla oficinas
CREATE TABLE oficinas (
  id_ofi int NOT NULL,
  direccion_ofi varchar(255),
  telefono_ofi varchar(9),
  fax_ofi varchar(9),
  PRIMARY KEY(id_ofi));

-- Tabla visitas
CREATE TABLE visitas (
  id_inm int NOT NULL,
  id_cli int,
  fecha_vis date,
  comentario_vis varchar(255),
  PRIMARY KEY (id_inm));

-- Tabla Clientes
CREATE TABLE clientes (
  id_cli int NOT NULL,
  nombre_cli varchar(255),
  direccion_cli varchar(255),
  telefono_cli varchar(9),
  inmueble_preferido_cli int,
  importe_maximo_cli int,
  PRIMARY KEY(id_cli));

CREATE TABLE inspecciones(
  id_ins INTEGER PRIMARY KEY,
  fecha_ins DATE NOT NULL,
  comentario_ins VARCHAR (355) NOT NULL,
  id_emp INTEGER DEFAULT NULL,
  id_inm INTEGER NOT NULL
 );

CREATE TABLE inmuebles(
  id_inm INTEGER PRIMARY KEY,
  direccion_inm VARCHAR (255) NOT NULL,
  tipo_inm VARCHAR (50) NOT NULL,
  nro_habi_inm INTEGER  NOT NULL,
  precio_alquiler_inm  INTEGER  NOT NULL,
  precio_venta_inm  INTEGER  NOT NULL,
  galeria VARCHAR (50) NOT NULL,
  id_ofi INTEGER NOT NULL,
  id_pro INTEGER DEFAULT NULL,
  id_emp INTEGER NOT NULL

);

CREATE TABLE Inmueble_Factura(
	id_inm int,
	id_fac int,
	PRIMARY KEY(id_inm,id_fac)
);

/*Pablo*/

  CREATE TABLE Facturas(
	id_fac int,
	importe_fac int,
	metodo_pago varchar(255),
	importe_deposito int,
	plazo_pago int,
	observaciones varchar(255),
	id_cli int,
	PRIMARY KEY(id_fac)
);

/* Andrés*/


create table periodico(
id_per integer NOT NULL,
nombre_per varchar(20) DEFAULT NULL,
direccion_per varchar(20) DEFAULT NULL,
telefono_per integer DEFAULT NULL,
fax_per integer DEFAULT NULL,
nombre_pers_cont_per varchar(20) DEFAULT NULL,
primary key (id_per)
);

CREATE TABLE Publicidad (
  id_pub int,
  fecha_pub date,
  costo_pub int,
  id_inm int,
  id_per int
 
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

CREATE TABLE Pago(
	id_pag integer,
	importe integer,
	fecha_pag date,
	id_fac integer,
	PRIMARY KEY(id_pag)
);

CREATE TABLE Contrato (
  id_con int PRIMARY KEY,
  importe_mensual_con int,
  metodo_pago_con varchar(255),
  importe_deposito_con int,
  esta_cancelado_con int CHECK (esta_cancelado_con < 2),
  fecha_inicio_con date,
  fecha_fin_con date,
  duracion_con int,
  id_inm int REFERENCES Inmuebles(id_inm),
  id_emp int REFERENCES Empleados(id_emp),
  id_cli int REFERENCES Clientes(id_cli)
  );