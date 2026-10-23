USE parcial1;

CREATE TABLE rol (
  id_rol      INT AUTO_INCREMENT PRIMARY KEY,
  nombre      VARCHAR(50)  NOT NULL,
  descripcion VARCHAR(150),
  nivel       ENUM('basico','intermedio','total') NOT NULL DEFAULT 'basico',
  activo      BOOLEAN NOT NULL DEFAULT TRUE,
  CONSTRAINT uq_rol_nombre UNIQUE (nombre),
  CONSTRAINT ck_rol_nombre CHECK (CHAR_LENGTH(nombre) >= 3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE categoria_servicio (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nombre       VARCHAR(60) NOT NULL,
  segmento     ENUM('personal','empresarial','ambos') NOT NULL DEFAULT 'ambos',
  activa       BOOLEAN NOT NULL DEFAULT TRUE,
  CONSTRAINT uq_categoria_nombre UNIQUE (nombre),
  CONSTRAINT ck_categoria_nombre CHECK (CHAR_LENGTH(nombre) >= 3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE metodo_pago (
  id_metodo INT AUTO_INCREMENT PRIMARY KEY,
  nombre    VARCHAR(50) NOT NULL,
  tipo      ENUM('tarjeta','transferencia','billetera','efectivo') NOT NULL,
  activo    BOOLEAN NOT NULL DEFAULT TRUE,
  CONSTRAINT uq_metodo_nombre UNIQUE (nombre),
  CONSTRAINT ck_metodo_nombre CHECK (CHAR_LENGTH(nombre) >= 3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
