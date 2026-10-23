USE parcial1;

-- VISTA 1: NEGOCIO
CREATE OR REPLACE VIEW v_negocio_contrataciones AS
SELECT
  c.id_contratacion,
  CONCAT(u.nombre, ' ', u.apellido) AS cliente,
  u.email,
  cs.nombre AS categoria,
  s.nombre AS servicio,
  s.precio_mensual,
  c.fecha_inicio,
  c.estado AS estado_contratacion,
  COUNT(p.id_pago) AS total_pagos,
  COALESCE(SUM(CASE WHEN p.estado = 'completado' THEN p.monto END), 0) AS total_pagado
FROM contratacion c
JOIN usuario u             ON u.id_usuario    = c.id_usuario
JOIN servicio s            ON s.id_servicio   = c.id_servicio
JOIN categoria_servicio cs ON cs.id_categoria = s.id_categoria
LEFT JOIN pago p           ON p.id_contratacion = c.id_contratacion
GROUP BY c.id_contratacion, u.nombre, u.apellido, u.email,
         cs.nombre, s.nombre, s.precio_mensual, c.fecha_inicio, c.estado;

-- VISTA 2: SEGURIDAD (sin password_hash ni token_hash)
CREATE OR REPLACE VIEW v_seguridad_usuarios AS
SELECT
  u.id_usuario,
  u.nombre,
  u.apellido,
  u.email,
  r.nombre AS rol,
  u.estado,
  u.activo,
  cr.mfa_habilitado,
  cr.intentos_fallidos,
  cr.ultimo_cambio
FROM usuario u
JOIN rol r              ON r.id_rol      = u.id_rol
LEFT JOIN credencial cr ON cr.id_usuario = u.id_usuario;

-- VISTA 3: AUDITORIA
CREATE OR REPLACE VIEW v_auditoria_accesos AS
SELECT
  a.id_auditoria,
  a.fecha_hora,
  COALESCE(CONCAT(u.nombre, ' ', u.apellido), 'Usuario desconocido') AS usuario,
  u.estado AS estado_usuario,
  a.ip,
  a.user_agent,
  a.resultado,
  a.es_sospechoso
FROM auditoria_acceso a
LEFT JOIN usuario u ON u.id_usuario = a.id_usuario;
