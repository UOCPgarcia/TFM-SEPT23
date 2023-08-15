-- cambio de código de página de consola adaptarlo a la de windows
-- se averigua cuál es el código de página de windows

SET PGCLIENTENCODING = utf-8
chcp 1252

-- creación de superusuario
CREATE USER mpilargarciar WITH SUPERUSER PASSWORD '*********';

-- comprobación
\du

--creación de la base de datos
CREATE DATABASE tfm;

-- se asigna el usuario creado a la base de datos creada
GRANT ALL PRIVILEGES ON DATABASE tfm TO mpilargarciar;


-- conectamos a la base de datos tfm
psql -U mpilargarciar -d tfm

-- creamos secuencia
CREATE SEQUENCE tfm_seq START 1;