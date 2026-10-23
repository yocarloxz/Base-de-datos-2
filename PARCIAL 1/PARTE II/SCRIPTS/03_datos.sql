USE parcial1;

-- ============================================================
-- 1. rol (10)
-- ============================================================
INSERT INTO rol (nombre, descripcion, nivel, activo) VALUES
('cliente',       'Usuario final que contrata servicios',          'basico',     TRUE),
('administrador', 'Gestiona usuarios y configuracion del sistema', 'total',      TRUE),
('vendedor',      'Gestiona cotizaciones y contrataciones',        'intermedio', TRUE),
('ejecutivo',     'Consulta reportes gerenciales',                 'intermedio', TRUE),
('soporte',       'Atiende incidencias de los clientes',           'intermedio', TRUE),
('auditor',       'Revisa accesos y registros de seguridad',       'intermedio', TRUE),
('contador',      'Revisa pagos y conciliaciones',                 'intermedio', TRUE),
('supervisor',    'Supervisa al equipo de ventas y soporte',       'intermedio', TRUE),
('desarrollador', 'Acceso tecnico a ambientes de prueba',          'total',      TRUE),
('invitado',      'Acceso temporal de solo lectura',               'basico',     FALSE);

-- ============================================================
-- 2. categoria_servicio (10)
-- ============================================================
INSERT INTO categoria_servicio (nombre, segmento, activa) VALUES
('Hosting',              'ambos',       TRUE),
('Correo corporativo',   'empresarial', TRUE),
('Respaldo en la nube',  'ambos',       TRUE),
('Seguridad administrada','empresarial', TRUE),
('Gestion de dominios',  'ambos',       TRUE),
('Soporte tecnico',      'empresarial', TRUE),
('Almacenamiento',       'personal',    TRUE),
('Redes y VPN',          'empresarial', TRUE),
('Analitica',            'empresarial', TRUE),
('Capacitacion',         'ambos',       TRUE);

-- ============================================================
-- 3. metodo_pago (10)
-- ============================================================
INSERT INTO metodo_pago (nombre, tipo, activo) VALUES
('Visa',                           'tarjeta',       TRUE),
('Mastercard',                     'tarjeta',       TRUE),
('American Express',               'tarjeta',       TRUE),
('Transferencia ACH',              'transferencia', TRUE),
('Transferencia internacional',    'transferencia', TRUE),
('Yappy',                          'billetera',     TRUE),
('PayPal',                         'billetera',     TRUE),
('Apple Pay',                      'billetera',     TRUE),
('Efectivo en oficina',            'efectivo',      TRUE),
('Pago en ventanilla',             'efectivo',      FALSE);

-- ============================================================
-- 4. usuario (10)
-- ============================================================
INSERT INTO usuario (nombre, apellido, email, estado, activo, fecha_registro, id_rol) VALUES
('Ana',      'Rodriguez',   'ana.rodriguez@correo.com',    'activo',     TRUE,  '2026-01-03 09:12:00', 1),
('Luis',     'Perez',       'luis.perez@correo.com',       'activo',     TRUE,  '2026-01-10 14:30:00', 1),
('Marta',    'Castillo',    'marta.castillo@correo.com',   'activo',     TRUE,  '2026-02-25 10:05:00', 1),
('Andres',   'Mendoza',     'andres.mendoza@correo.com',   'inactivo',   FALSE, '2026-02-18 16:45:00', 1),
('Sofia',    'Vargas',      'sofia.vargas@correo.com',     'suspendido', FALSE, '2026-04-08 11:20:00', 1),
('Jorge',    'Batista',     'jorge.batista@correo.com',    'activo',     TRUE,  '2026-04-30 08:55:00', 1),
('Daniela',  'Ortega',      'daniela.ortega@correo.com',   'activo',     TRUE,  '2026-03-12 13:10:00', 1),
('Ricardo',  'Samaniego',   'ricardo.samaniego@correo.com','activo',     TRUE,  '2026-05-28 17:40:00', 1),
('Valeria',  'Nunez',       'valeria.nunez@pixelcorp.com', 'activo',     TRUE,  '2025-12-01 08:00:00', 2),
('Miguel',   'Herrera',     'miguel.herrera@pixelcorp.com','bloqueado',  FALSE, '2026-01-20 09:30:00', 3);

-- ============================================================
-- 5. credencial (10)  -- hashes simulados (nunca contrasenas reales)
-- ============================================================
INSERT INTO credencial (id_usuario, password_hash, algoritmo, mfa_habilitado, intentos_fallidos, ultimo_cambio) VALUES
(1,  CONCAT('$2b$12$', SUBSTRING(SHA2('semilla-usuario-1',256),1,53)),  'bcrypt', FALSE, 0, '2026-01-03 09:15:00'),
(2,  CONCAT('$2b$12$', SUBSTRING(SHA2('semilla-usuario-2',256),1,53)),  'bcrypt', FALSE, 0, '2026-01-10 14:35:00'),
(3,  CONCAT('$2b$12$', SUBSTRING(SHA2('semilla-usuario-3',256),1,53)),  'bcrypt', TRUE,  0, '2026-03-02 10:00:00'),
(4,  CONCAT('$2b$12$', SUBSTRING(SHA2('semilla-usuario-4',256),1,53)),  'bcrypt', FALSE, 0, '2026-02-18 16:50:00'),
(5,  CONCAT('$2b$12$', SUBSTRING(SHA2('semilla-usuario-5',256),1,53)),  'bcrypt', FALSE, 3, '2026-04-08 11:25:00'),
(6,  CONCAT('$2b$12$', SUBSTRING(SHA2('semilla-usuario-6',256),1,53)),  'bcrypt', FALSE, 0, '2026-04-30 09:00:00'),
(7,  CONCAT('$2b$12$', SUBSTRING(SHA2('semilla-usuario-7',256),1,53)),  'bcrypt', TRUE,  0, '2026-06-15 12:00:00'),
(8,  CONCAT('$2b$12$', SUBSTRING(SHA2('semilla-usuario-8',256),1,53)),  'bcrypt', FALSE, 0, '2026-05-28 17:45:00'),
(9,  CONCAT('$argon2id$v=19$m=65536,t=3,p=4$', SUBSTRING(SHA2('semilla-usuario-9',256),1,22), '$', SUBSTRING(SHA2('semilla-usuario-9',256),23,42)), 'argon2', TRUE, 0, '2026-09-01 08:30:00'),
(10, CONCAT('$scrypt$ln=15,r=8,p=1$', SUBSTRING(SHA2('semilla-usuario-10',256),1,22), '$', SUBSTRING(SHA2('semilla-usuario-10',256),23,42)), 'scrypt', FALSE, 5, '2026-01-20 09:35:00');

-- ============================================================
-- 6. sesion (10)
-- ============================================================
INSERT INTO sesion (id_usuario, token_hash, user_agent, dispositivo, ip, fecha_inicio, fecha_expiracion, activa) VALUES
(1, SHA2('token-sesion-001',256), 'Mozilla/5.0 (Windows NT 10.0) Chrome/126.0',       'web',        '190.34.12.45',  '2026-10-22 07:30:00', '2026-10-23 07:30:00', TRUE),
(1, SHA2('token-sesion-002',256), 'Mozilla/5.0 (iPhone; CPU iPhone OS 17) Safari',     'movil',      '190.34.12.46',  '2026-10-21 18:05:00', '2026-10-22 18:05:00', TRUE),
(2, SHA2('token-sesion-003',256), 'Mozilla/5.0 (Windows NT 10.0) Firefox/127.0',       'web',        '200.46.88.17',  '2026-10-22 08:45:00', '2026-10-23 08:45:00', TRUE),
(3, SHA2('token-sesion-004',256), 'PixelSecurityDesktop/2.3 (Windows)',                'escritorio', '181.197.20.9',  '2026-10-18 09:00:00', '2026-10-19 09:00:00', FALSE),
(4, SHA2('token-sesion-005',256), 'Mozilla/5.0 (Windows NT 10.0) Edg/126.0',           'web',        '186.74.101.33', '2026-09-15 14:20:00', '2026-09-16 14:20:00', FALSE),
(6, SHA2('token-sesion-006',256), 'Mozilla/5.0 (Linux; Android 14) Chrome/126.0',      'movil',      '201.218.5.120', '2026-10-22 06:50:00', '2026-10-23 06:50:00', TRUE),
(7, SHA2('token-sesion-007',256), 'Mozilla/5.0 (Macintosh; Intel Mac OS X) Chrome/126','web',        '190.34.77.8',   '2026-10-21 21:15:00', '2026-10-22 21:15:00', TRUE),
(8, SHA2('token-sesion-008',256), 'PixelSecurityAPI-Client/1.0',                       'otro',       '200.46.12.99',  '2026-10-10 10:00:00', '2026-10-10 11:00:00', FALSE),
(9, SHA2('token-sesion-009',256), 'Mozilla/5.0 (X11; Linux x86_64) Chrome/126.0',      'web',        '10.0.0.15',     '2026-10-22 08:00:00', '2026-10-22 16:00:00', TRUE),
(9, SHA2('token-sesion-010',256), 'PixelSecurityDesktop/2.3 (Linux)',                  'escritorio', '10.0.0.16',     '2026-10-20 13:30:00', '2026-10-20 21:30:00', FALSE);

-- ============================================================
-- 7. servicio (10)
-- ============================================================
INSERT INTO servicio (nombre, descripcion, precio_mensual, modalidad, activo, id_categoria) VALUES
('Hosting Web Basico',            'Alojamiento web con 10 GB y certificado SSL',          9.99,  'basico',      TRUE, 1),
('Correo Corporativo',            'Casillas de correo con dominio propio',                5.50,  'basico',      TRUE, 2),
('Respaldo Automatico en la Nube','Copias de seguridad diarias con retencion de 30 dias', 14.90, 'premium',     TRUE, 3),
('Firewall Administrado',         'Monitoreo y reglas de firewall gestionadas',           49.00, 'empresarial', TRUE, 4),
('Gestion de Dominios',           'Registro y renovacion de dominios',                    3.50,  'basico',      TRUE, 5),
('Soporte Tecnico 24/7',          'Atencion de incidencias todo el dia',                  79.00, 'empresarial', TRUE, 6),
('Almacenamiento Seguro 1TB',     'Almacenamiento cifrado de 1 TB',                       12.00, 'basico',      TRUE, 7),
('VPN Empresarial',               'Acceso remoto seguro para equipos de trabajo',         25.00, 'premium',     TRUE, 8),
('Panel de Analitica Web',        'Reportes de trafico y comportamiento de usuarios',     19.99, 'premium',     TRUE, 9),
('Capacitacion en Ciberseguridad','Talleres de concientizacion para empleados',           35.00, 'premium',     TRUE, 10);

-- ============================================================
-- 8. contratacion (10)
-- ============================================================
INSERT INTO contratacion (id_usuario, id_servicio, fecha_inicio, fecha_fin, estado, renovacion_automatica) VALUES
(1, 1,  '2026-01-05', NULL,         'activa',    TRUE),
(1, 3,  '2026-02-10', NULL,         'activa',    TRUE),
(2, 2,  '2026-01-15', NULL,         'activa',    FALSE),
(3, 4,  '2026-03-01', NULL,         'activa',    TRUE),
(4, 1,  '2026-02-20', '2026-08-20', 'cancelada', FALSE),
(5, 6,  '2026-04-12', NULL,         'pausada',   FALSE),
(6, 7,  '2026-05-03', NULL,         'activa',    TRUE),
(7, 8,  '2026-03-18', NULL,         'activa',    FALSE),
(8, 9,  '2026-06-01', '2026-09-01', 'vencida',   FALSE),
(2, 10, '2026-07-07', NULL,         'activa',    TRUE);

-- ============================================================
-- 9. pago (10)
-- ============================================================
INSERT INTO pago (id_contratacion, id_metodo, monto, fecha_pago, estado, referencia, conciliado) VALUES
(1,  1, 9.99,  '2026-01-05 09:30:00', 'completado',  'PAG-2026-0001', TRUE),
(2,  6, 14.90, '2026-02-10 14:20:00', 'completado',  'PAG-2026-0002', TRUE),
(3,  4, 5.50,  '2026-01-15 11:00:00', 'completado',  'PAG-2026-0003', TRUE),
(4,  2, 49.00, '2026-03-01 08:45:00', 'completado',  'PAG-2026-0004', TRUE),
(5,  7, 9.99,  '2026-02-20 17:05:00', 'reembolsado', 'PAG-2026-0005', TRUE),
(6,  5, 79.00, '2026-04-12 10:00:00', 'pendiente',   'PAG-2026-0006', FALSE),
(7,  9, 12.00, '2026-05-03 15:30:00', 'completado',  'PAG-2026-0007', TRUE),
(8,  3, 25.00, '2026-03-18 19:10:00', 'fallido',     'PAG-2026-0008', FALSE),
(9,  8, 19.99, '2026-06-01 07:55:00', 'completado',  'PAG-2026-0009', TRUE),
(10, 1, 35.00, '2026-07-07 12:40:00', 'completado',  'PAG-2026-0010', FALSE);

-- ============================================================
-- 10. auditoria_acceso (10)
-- ============================================================
INSERT INTO auditoria_acceso (codigo_evento, id_usuario, fecha_hora, ip, user_agent, resultado, es_sospechoso) VALUES
(UUID(), 1,    '2026-10-22 07:30:00', '190.34.12.45',  'Mozilla/5.0 (Windows NT 10.0) Chrome/126.0',  'exitoso',   FALSE),
(UUID(), 1,    '2026-10-21 18:05:00', '190.34.12.46',  'Mozilla/5.0 (iPhone; CPU iPhone OS 17) Safari','exitoso',  FALSE),
(UUID(), 2,    '2026-10-22 08:45:00', '200.46.88.17',  'Mozilla/5.0 (Windows NT 10.0) Firefox/127.0', 'exitoso',   FALSE),
(UUID(), 10,   '2026-10-19 22:14:00', '45.77.120.8',   'curl/8.4.0',                                   'fallido',   TRUE),
(UUID(), 10,   '2026-10-19 22:15:00', '45.77.120.8',   'curl/8.4.0',                                   'fallido',   TRUE),
(UUID(), 10,   '2026-10-19 22:16:00', '45.77.120.8',   'curl/8.4.0',                                   'bloqueado', TRUE),
(UUID(), NULL, '2026-10-20 03:02:00', '185.220.101.4', 'python-requests/2.31',                          'fallido',   TRUE),
(UUID(), 5,    '2026-10-05 11:20:00', '190.34.9.60',   'Mozilla/5.0 (Windows NT 10.0) Chrome/126.0',   'fallido',   FALSE),
(UUID(), 9,    '2026-10-22 08:00:00', '10.0.0.15',     'Mozilla/5.0 (X11; Linux x86_64) Chrome/126.0', 'exitoso',   FALSE),
(UUID(), 6,    '2026-10-22 06:50:00', '201.218.5.120', 'Mozilla/5.0 (Linux; Android 14) Chrome/126.0', 'exitoso',   FALSE);
