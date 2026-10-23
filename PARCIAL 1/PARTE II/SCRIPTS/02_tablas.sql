USE parcial1;

CREATE TABLE usuario (
  id_usuario     INT AUTO_INCREMENT PRIMARY KEY,
  nombre         VARCHAR(60)  NOT NULL,
  apellido       VARCHAR(60)  NOT NULL,
  email          VARCHAR(120) NOT NULL,
  estado         ENUM('activo','inactivo','suspendido','bloqueado') NOT NULL DEFAULT 'activo',
  activo         BOOLEAN NOT NULL DEFAULT TRUE,
  fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  id_rol         INT NOT NULL,
  CONSTRAINT uq_usuario_email UNIQUE (email),
  CONSTRAINT ck_usuario_email CHECK (email LIKE '%@%'),
  CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES rol(id_rol)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE credencial (
  id_credencial     INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario        INT NOT NULL,
  password_hash     VARCHAR(255) NOT NULL,
  algoritmo         ENUM('bcrypt','argon2','scrypt') NOT NULL DEFAULT 'bcrypt',
  mfa_habilitado    BOOLEAN NOT NULL DEFAULT FALSE,
  intentos_fallidos INT NOT NULL DEFAULT 0,
  ultimo_cambio     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT uq_credencial_usuario UNIQUE (id_usuario),
  CONSTRAINT ck_credencial_intentos CHECK (intentos_fallidos >= 0),
  CONSTRAINT fk_credencial_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE sesion (
  id_sesion        INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario       INT NOT NULL,
  token_hash       VARCHAR(255) NOT NULL,
  user_agent       VARCHAR(200),
  dispositivo      ENUM('web','movil','escritorio','otro') NOT NULL DEFAULT 'web',
  ip               VARCHAR(45),
  fecha_inicio     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fecha_expiracion DATETIME NOT NULL,
  activa           BOOLEAN NOT NULL DEFAULT TRUE,
  CONSTRAINT uq_sesion_token UNIQUE (token_hash),
  CONSTRAINT ck_sesion_fechas CHECK (fecha_expiracion > fecha_inicio),
  CONSTRAINT fk_sesion_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE servicio (
  id_servicio    INT AUTO_INCREMENT PRIMARY KEY,
  nombre         VARCHAR(80) NOT NULL,
  descripcion    VARCHAR(255),
  precio_mensual DECIMAL(10,2) NOT NULL,
  modalidad      ENUM('basico','premium','empresarial') NOT NULL DEFAULT 'basico',
  activo         BOOLEAN NOT NULL DEFAULT TRUE,
  id_categoria   INT NOT NULL,
  CONSTRAINT uq_servicio_nombre UNIQUE (nombre),
  CONSTRAINT ck_servicio_precio CHECK (precio_mensual > 0),
  CONSTRAINT fk_servicio_categoria FOREIGN KEY (id_categoria) REFERENCES categoria_servicio(id_categoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE contratacion (
  id_contratacion       INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario            INT NOT NULL,
  id_servicio           INT NOT NULL,
  fecha_inicio          DATE NOT NULL,
  fecha_fin             DATE,
  estado                ENUM('activa','pausada','cancelada','vencida') NOT NULL DEFAULT 'activa',
  renovacion_automatica BOOLEAN NOT NULL DEFAULT FALSE,
  CONSTRAINT uq_contratacion UNIQUE (id_usuario, id_servicio, fecha_inicio),
  CONSTRAINT ck_contratacion_fechas CHECK (fecha_fin IS NULL OR fecha_fin >= fecha_inicio),
  CONSTRAINT fk_contratacion_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  CONSTRAINT fk_contratacion_servicio FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE pago (
  id_pago         INT AUTO_INCREMENT PRIMARY KEY,
  id_contratacion INT NOT NULL,
  id_metodo       INT NOT NULL,
  monto           DECIMAL(10,2) NOT NULL,
  fecha_pago      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  estado          ENUM('pendiente','completado','fallido','reembolsado') NOT NULL DEFAULT 'pendiente',
  referencia      VARCHAR(60) NOT NULL,
  conciliado      BOOLEAN NOT NULL DEFAULT FALSE,
  CONSTRAINT uq_pago_referencia UNIQUE (referencia),
  CONSTRAINT ck_pago_monto CHECK (monto > 0),
  CONSTRAINT fk_pago_contratacion FOREIGN KEY (id_contratacion) REFERENCES contratacion(id_contratacion),
  CONSTRAINT fk_pago_metodo FOREIGN KEY (id_metodo) REFERENCES metodo_pago(id_metodo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE auditoria_acceso (
  id_auditoria  INT AUTO_INCREMENT PRIMARY KEY,
  codigo_evento VARCHAR(36) NOT NULL,
  id_usuario    INT NULL,
  fecha_hora    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ip            VARCHAR(45),
  user_agent    VARCHAR(200),
  resultado     ENUM('exitoso','fallido','bloqueado') NOT NULL,
  es_sospechoso BOOLEAN NOT NULL DEFAULT FALSE,
  CONSTRAINT uq_auditoria_codigo UNIQUE (codigo_evento),
  CONSTRAINT ck_auditoria_ip CHECK (ip IS NULL OR CHAR_LENGTH(ip) >= 7),
  CONSTRAINT fk_auditoria_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
