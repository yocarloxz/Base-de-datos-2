USE parcial1;

-- ============================================================
-- CRUD sobre la entidad principal: usuario
-- ============================================================

-- ---------- CREATE: insertar un usuario nuevo ----------
INSERT INTO usuario (nombre, apellido, email, estado, activo, id_rol)
VALUES ('Camila', 'Arosemena', 'camila.arosemena@correo.com', 'activo', TRUE, 1);

-- Verificacion del CREATE
SELECT id_usuario, nombre, apellido, email, estado, activo
FROM usuario
WHERE email = 'camila.arosemena@correo.com';

-- ---------- READ: consulta filtrada ----------
-- Clientes activos, ordenados por apellido
SELECT id_usuario, nombre, apellido, email, estado
FROM usuario
WHERE estado = 'activo' AND id_rol = 1
ORDER BY apellido;

-- ---------- UPDATE: actualizacion controlada ----------
-- Se filtra por el campo UNIQUE (email) para afectar exactamente una fila
UPDATE usuario
SET email = 'camila.arosemena@pixelcorp.com'
WHERE email = 'camila.arosemena@correo.com';

-- Verificacion del UPDATE
SELECT id_usuario, nombre, apellido, email
FROM usuario
WHERE email = 'camila.arosemena@pixelcorp.com';

-- ---------- DELETE (eliminacion logica) ----------
-- No se borra la fila: se marca como inactiva
UPDATE usuario
SET estado = 'inactivo', activo = FALSE
WHERE email = 'camila.arosemena@pixelcorp.com';

-- Verificacion del DELETE logico
SELECT id_usuario, nombre, apellido, estado, activo
FROM usuario
WHERE email = 'camila.arosemena@pixelcorp.com';

-- ---------- Prueba de por que no se usa eliminacion fisica ----------
-- Este DELETE falla (error 1451) porque el usuario 1 tiene contrataciones
DELETE FROM usuario WHERE id_usuario = 1;
