USE pixel_security360;

CREATE TABLE tipo_usuario (
  id_tipo_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre          VARCHAR(40) NOT NULL,
  activo          BOOLEAN NOT NULL DEFAULT TRUE,
  CONSTRAINT uq_tipo_usuario_nombre UNIQUE (nombre),
  CONSTRAINT ck_tipo_usuario_nombre CHECK (CHAR_LENGTH(nombre) >= 3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE usuario (
  id_usuario      INT AUTO_INCREMENT PRIMARY KEY,
  nombre          VARCHAR(60)  NOT NULL,
  apellido        VARCHAR(60)  NOT NULL,
  nombre_usuario  VARCHAR(40)  NOT NULL,
  token           VARCHAR(255) NOT NULL,
  contrasena      VARCHAR(255) NOT NULL,
  ciudad          VARCHAR(60)  NOT NULL,
  sexo            ENUM('masculino','femenino') NOT NULL,
  estado_civil    ENUM('soltero','casado','divorciado','viudo','union_libre') NOT NULL,
  tipo_empresa    ENUM('publica','privada') NOT NULL,
  direccion       VARCHAR(200) NOT NULL,
  activo          BOOLEAN NOT NULL DEFAULT TRUE,
  id_tipo_usuario INT NOT NULL,
  CONSTRAINT uq_usuario_nombre_usuario UNIQUE (nombre_usuario),
  CONSTRAINT uq_usuario_token UNIQUE (token),
  CONSTRAINT ck_usuario_nombre_usuario CHECK (CHAR_LENGTH(nombre_usuario) >= 4),
  CONSTRAINT fk_usuario_tipo FOREIGN KEY (id_tipo_usuario) REFERENCES tipo_usuario(id_tipo_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE autenticacion (
  id_autenticacion INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario       INT NOT NULL,
  nombre_usuario   VARCHAR(40)  NOT NULL,
  contrasena       VARCHAR(255) NOT NULL,
  agente_usuario   VARCHAR(200) NOT NULL,
  token            VARCHAR(255) NOT NULL,
  fecha_inicio     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  activa           BOOLEAN NOT NULL DEFAULT TRUE,
  CONSTRAINT uq_autenticacion_token UNIQUE (token),
  CONSTRAINT fk_autenticacion_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE tipo_prueba (
  id_tipo_prueba INT AUTO_INCREMENT PRIMARY KEY,
  referencia     VARCHAR(20)  NOT NULL,
  nombre         VARCHAR(100) NOT NULL,
  descripcion    VARCHAR(255) NOT NULL,
  fecha_ingreso  DATE NOT NULL,
  estado         ENUM('activo','desactivado') NOT NULL DEFAULT 'activo',
  CONSTRAINT uq_tipo_prueba_referencia UNIQUE (referencia),
  CONSTRAINT uq_tipo_prueba_nombre UNIQUE (nombre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE reporte (
  id_reporte     INT AUTO_INCREMENT PRIMARY KEY,
  referencia     VARCHAR(20)  NOT NULL,
  id_usuario     INT NOT NULL,
  id_tipo_prueba INT NOT NULL,
  titulo         VARCHAR(120) NOT NULL,
  resumen        VARCHAR(255),
  severidad      ENUM('informativa','baja','media','alta','critica') NOT NULL,
  estado         ENUM('borrador','emitido','entregado') NOT NULL DEFAULT 'borrador',
  fecha_emision  DATE NOT NULL,
  visible_cliente BOOLEAN NOT NULL DEFAULT TRUE,
  CONSTRAINT uq_reporte_referencia UNIQUE (referencia),
  CONSTRAINT fk_reporte_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  CONSTRAINT fk_reporte_tipo_prueba FOREIGN KEY (id_tipo_prueba) REFERENCES tipo_prueba(id_tipo_prueba)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE metodo_pago (
  id_metodo_pago   INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario       INT NOT NULL,
  marca            ENUM('visa','mastercard','american_express','discover','diners') NOT NULL,
  numero_tarjeta   VARCHAR(19) NOT NULL,
  titular          VARCHAR(100) NOT NULL,
  cvc              VARCHAR(4) NOT NULL,
  vencimiento_mes  TINYINT NOT NULL,
  vencimiento_anio SMALLINT NOT NULL,
  predeterminada   BOOLEAN NOT NULL DEFAULT FALSE,
  CONSTRAINT uq_metodo_usuario_tarjeta UNIQUE (id_usuario, numero_tarjeta),
  CONSTRAINT ck_metodo_numero CHECK (numero_tarjeta REGEXP '^[0-9]{13,19}$'),
  CONSTRAINT ck_metodo_cvc CHECK (cvc REGEXP '^[0-9]{3,4}$'),
  CONSTRAINT ck_metodo_mes CHECK (vencimiento_mes BETWEEN 1 AND 12),
  CONSTRAINT ck_metodo_anio CHECK (vencimiento_anio >= 2026),
  CONSTRAINT fk_metodo_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
