-- ----------------------------------------------------------------------
-- MySQL Migration Toolkit
-- SQL Create Script
-- ----------------------------------------------------------------------

--SET FOREIGN_KEY_CHECKS = 0;

--CREATE DATABASE IF NOT EXISTS ciclistas
  --CHARACTER (SET latin1 COLLATE latin1_swedish_ci);


DROP DATABASE ciclistas;
CREATE DATABASE Ciclistas;
  --CHARACTER (SET latin1 COLLATE latin1_swedish_ci);

--USE ciclistas;
-- -------------------------------------
-- Tables

--DROP TABLE IF EXISTS ciclistas.ciclista;
CREATE TABLE ciclista (
  dorsal INTEGER NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  edad INTEGER NULL,
  nomequipo VARCHAR(25) NOT NULL,
  PRIMARY KEY (dorsal)
 -- INDEX equipociclista (nomequipo)
);
--ENGINE = INNODB
--CHARACTER (SET utf8 COLLATE utf8_general_ci);

--DROP TABLE IF EXISTS ciclistas.equipo;
CREATE TABLE equipo (
  nomequipo VARCHAR(25) NOT NULL,
  director VARCHAR(30) NULL,
  PRIMARY KEY (nomequipo)
);
--ENGINE = INNODB
--CHARACTER (SET utf8 COLLATE utf8_general_ci);

--DROP TABLE IF EXISTS ciclistas.etapa;
CREATE TABLE etapa (
  numetapa INTEGER NOT NULL,
  kms INTEGER NOT NULL,
  salida VARCHAR(35) NOT NULL,
  llegada VARCHAR(35) NOT NULL,
  dorsal INTEGER NULL,
  PRIMARY KEY (numetapa)
  --INDEX ciclistaetapa (dorsal)
);
--ENGINE = INNODB
--CHARACTER (SET utf8 COLLATE utf8_general_ci);

--DROP TABLE IF EXISTS ciclistas.lleva;
CREATE TABLE lleva (
  dorsal INTEGER NOT NULL,
  numetapa INTEGER NOT NULL,
  código VARCHAR(3) NOT NULL,
  PRIMARY KEY (numetapa, código)
  --INDEX ciclistallevar (dorsal),
  --INDEX etapallevar (numetapa),
  --INDEX maillotllevar (código)
);
--ENGINE = INNODB
--CHARACTER (SET utf8 COLLATE utf8_general_ci);

--DROP TABLE IF EXISTS ciclistas.maillot;
CREATE TABLE maillot (
  código VARCHAR(3) NOT NULL,
  tipo VARCHAR(30) NOT NULL,
  color VARCHAR(20) NOT NULL,
  premio INTEGER NOT NULL,
  PRIMARY KEY (código)
);
--ENGINE = INNODB
--CHARACTER SET utf8 COLLATE utf8_general_ci;

--DROP TABLE IF EXISTS ciclistas.puerto;
CREATE TABLE puerto (
  nompuerto VARCHAR(35) NOT NULL,
  altura INTEGER NOT NULL,
  categoria VARCHAR(1) NOT NULL,
  pendiente DOUBLE PRECISION NULL,
  numetapa INTEGER NOT NULL,
  dorsal INTEGER NULL,
  PRIMARY KEY (nompuerto)
  --INDEX ciclistapuerto (dorsal),
  --INDEX etapapuerto (numetapa)
);
--ENGINE = INNODB
--CHARACTER (SET utf8 COLLATE utf8_general_ci);



--SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------------------------------------------------
-- EOF

