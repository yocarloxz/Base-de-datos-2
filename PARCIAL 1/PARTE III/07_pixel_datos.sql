USE pixel_security360;

-- ============================================================
-- tipo_usuario (catalogo de los tipos que pide el enunciado)
-- ============================================================
INSERT INTO tipo_usuario (nombre, activo) VALUES
('Cliente',        TRUE),
('Administrador',  TRUE),
('Vendedor',       TRUE),
('Ejecutivo',      TRUE),
('Otros',          TRUE);

-- ============================================================
-- MODULO DE USUARIO (20)
-- Token y contrasena simulados (hash), nunca datos reales
-- ============================================================
INSERT INTO usuario (nombre, apellido, nombre_usuario, token, contrasena, ciudad, sexo, estado_civil, tipo_empresa, direccion, activo, id_tipo_usuario) VALUES
('Ana',       'Rodriguez',  'arodriguez',  SHA2('token-arodriguez',256),  CONCAT('$2b$12$', SUBSTRING(SHA2('pwd-arodriguez',256),1,53)),  'Ciudad de Panama', 'femenino',  'soltero',    'privada', 'Calle 50, Edificio Torres del Pacifico, Piso 8',       TRUE,  1),
('Luis',      'Perez',      'lperez',      SHA2('token-lperez',256),      CONCAT('$2b$12$', SUBSTRING(SHA2('pwd-lperez',256),1,53)),      'Colon',            'masculino', 'casado',     'privada', 'Avenida Bolivar, Casa 14',                             TRUE,  1),
('Marta',     'Castillo',   'mcastillo',   SHA2('token-mcastillo',256),   CONCAT('$2b$12$', SUBSTRING(SHA2('pwd-mcastillo',256),1,53)),   'David',            'femenino',  'casado',     'publica', 'Barrio Bolivar, Calle 3, Casa 22',                     TRUE,  1),
('Andres',    'Mendoza',    'amendoza',    SHA2('token-amendoza',256),    CONCAT('$2b$12$', SUBSTRING(SHA2('pwd-amendoza',256),1,53)),    'Santiago',         'masculino', 'divorciado', 'privada', 'Avenida Central, Local 5',                             TRUE,  1),
('Sofia',     'Vargas',     'svargas',     SHA2('token-svargas',256),     CONCAT('$2b$12$', SUBSTRING(SHA2('pwd-svargas',256),1,53)),     'Chitre',           'femenino',  'soltero',    'publica', 'Calle Manuel Maria Icaza, Casa 9',                     TRUE,  1),
('Jorge',     'Batista',    'jbatista',    SHA2('token-jbatista',256),    CONCAT('$2b$12$', SUBSTRING(SHA2('pwd-jbatista',256),1,53)),    'La Chorrera',      'masculino', 'union_libre','privada', 'Barriada Santa Marta, Casa 31',                        TRUE,  1),
('Daniela',   'Ortega',     'dortega',     SHA2('token-dortega',256),     CONCAT('$2b$12$', SUBSTRING(SHA2('pwd-dortega',256),1,53)),     'Penonome',         'femenino',  'casado',     'privada', 'Calle Juan Demostenes Arosemena, Edificio Plaza, Of. 2',TRUE,  1),
('Ricardo',   'Samaniego',  'rsamaniego',  SHA2('token-rsamaniego',256),  CONCAT('$2b$12$', SUBSTRING(SHA2('pwd-rsamaniego',256),1,53)),  'Las Tablas',       'masculino', 'soltero',    'publica', 'Avenida Belisario Porras, Casa 18',                    TRUE,  1),
('Paola',     'Arosemena',  'parosemena',  SHA2('token-parosemena',256),  CONCAT('$2b$12$', SUBSTRING(SHA2('pwd-parosemena',256),1,53)),  'Aguadulce',        'femenino',  'soltero',    'privada', 'Calle 8va Norte, Casa 4',                              TRUE,  1),
('Hector',    'Quintero',   'hquintero',   SHA2('token-hquintero',256),   CONCAT('$2b$12$', SUBSTRING(SHA2('pwd-hquintero',256),1,53)),   'Boquete',          'masculino', 'viudo',      'privada', 'Camino Real, Finca Los Naranjos',                      TRUE,  1),
('Lucia',     'Fernandez',  'lfernandez',  SHA2('token-lfernandez',256),  CONCAT('$2b$12$', SUBSTRING(SHA2('pwd-lfernandez',256),1,53)),  'Ciudad de Panama', 'femenino',  'divorciado', 'publica', 'Via Espana, Torre Global, Piso 3',                     TRUE,  1),
('Esteban',   'Moreno',     'emoreno',     SHA2('token-emoreno',256),     CONCAT('$2b$12$', SUBSTRING(SHA2('pwd-emoreno',256),1,53)),     'Colon',            'masculino', 'casado',     'publica', 'Calle 11, Edificio Cristobal, Apto 6',                 TRUE,  1),
('Valeria',   'Nunez',      'vnunez',      SHA2('token-vnunez',256),      CONCAT('$2b$12$', SUBSTRING(SHA2('pwd-vnunez',256),1,53)),      'Ciudad de Panama', 'femenino',  'soltero',    'privada', 'Obarrio, Calle 55, Torre Pixel, Piso 12',              TRUE,  2),
('Miguel',    'Herrera',    'mherrera',    SHA2('token-mherrera',256),    CONCAT('$2b$12$', SUBSTRING(SHA2('pwd-mherrera',256),1,53)),    'Ciudad de Panama', 'masculino', 'casado',     'privada', 'Obarrio, Calle 55, Torre Pixel, Piso 12',              TRUE,  2),
('Patricia',  'Solis',      'psolis',      SHA2('token-psolis',256),      CONCAT('$2b$12$', SUBSTRING(SHA2('pwd-psolis',256),1,53)),      'David',            'femenino',  'casado',     'privada', 'Avenida Obaldia, Local 12',                            TRUE,  3),
('Fernando',  'Cedeno',     'fcedeno',     SHA2('token-fcedeno',256),     CONCAT('$2b$12$', SUBSTRING(SHA2('pwd-fcedeno',256),1,53)),     'Santiago',         'masculino', 'soltero',    'privada', 'Calle 6ta, Local 3',                                   TRUE,  3),
('Gabriela',  'Rios',       'grios',       SHA2('token-grios',256),       CONCAT('$2b$12$', SUBSTRING(SHA2('pwd-grios',256),1,53)),       'La Chorrera',      'femenino',  'union_libre','privada', 'Avenida Libertador, Local 7',                          TRUE,  3),
('Alberto',   'Jaramillo',  'ajaramillo',  SHA2('token-ajaramillo',256),  CONCAT('$2b$12$', SUBSTRING(SHA2('pwd-ajaramillo',256),1,53)),  'Ciudad de Panama', 'masculino', 'casado',     'privada', 'Costa del Este, Torre Financiera, Piso 20',            TRUE,  4),
('Natalia',   'Barrios',    'nbarrios',    SHA2('token-nbarrios',256),    CONCAT('$2b$12$', SUBSTRING(SHA2('pwd-nbarrios',256),1,53)),    'Ciudad de Panama', 'femenino',  'divorciado', 'privada', 'Costa del Este, Torre Financiera, Piso 22',            TRUE,  4),
('Roberto',   'Alvarado',   'ralvarado',   SHA2('token-ralvarado',256),   CONCAT('$2b$12$', SUBSTRING(SHA2('pwd-ralvarado',256),1,53)),   'Colon',            'masculino', 'soltero',    'publica', 'Zona Libre, Edificio 4',                               FALSE, 5);

-- ============================================================
-- MODULO DE AUTENTICACION (20)
-- Se copia nombre de usuario y contrasena desde usuario para que coincidan
-- ============================================================
INSERT INTO autenticacion (id_usuario, nombre_usuario, contrasena, agente_usuario, token, fecha_inicio, activa)
SELECT
  id_usuario,
  nombre_usuario,
  contrasena,
  ELT(((id_usuario - 1) % 5) + 1,
      'Chrome 126 - Windows 11',
      'Firefox 127 - Windows 10',
      'Safari 17 - iPhone 15',
      'Chrome 126 - Android 14',
      'Edge 126 - Windows 11'),
  SHA2(CONCAT('auth-', nombre_usuario), 256),
  TIMESTAMP('2026-10-01 08:00:00') + INTERVAL id_usuario DAY,
  (id_usuario % 5) <> 0
FROM usuario
ORDER BY id_usuario;

-- ============================================================
-- MODULO DE TIPOS DE PRUEBAS (20)
-- Las 4 etapas de la imagen (sin "Informe") + pruebas adicionales
-- ============================================================
INSERT INTO tipo_prueba (referencia, nombre, descripcion, fecha_ingreso, estado) VALUES
('PT-001', 'Reconocimiento',                          'Recopilacion de informacion publica y activa sobre el objetivo',          '2025-01-15', 'activo'),
('PT-002', 'Analisis de Vulnerabilidades',            'Identificacion y clasificacion de vulnerabilidades en sistemas y redes',  '2025-01-15', 'activo'),
('PT-003', 'Explotacion',                             'Aprovechamiento controlado de vulnerabilidades para comprobar su impacto', '2025-01-15', 'activo'),
('PT-004', 'Escalada de Privilegios y Post-Explotacion','Obtencion de mayores privilegios y evaluacion del alcance del compromiso','2025-01-15', 'activo'),
('PT-005', 'Pruebas de Inyeccion SQL',                'Deteccion de fallos que permiten manipular consultas a la base de datos', '2025-03-10', 'activo'),
('PT-006', 'Pruebas de Cross-Site Scripting (XSS)',   'Busqueda de inyeccion de scripts en aplicaciones web',                    '2025-03-10', 'activo'),
('PT-007', 'Autenticacion y Gestion de Sesiones',     'Evaluacion de inicio de sesion, tokens y expiracion de sesiones',         '2025-04-22', 'activo'),
('PT-008', 'Pruebas de Control de Acceso',            'Verificacion de permisos y separacion de privilegios entre usuarios',     '2025-04-22', 'activo'),
('PT-009', 'Ingenieria Social y Phishing',            'Simulacion de campanas de engano dirigidas al personal',                  '2025-05-30', 'activo'),
('PT-010', 'Pruebas de Red Interna',                  'Evaluacion de segmentacion y exposicion dentro de la red corporativa',    '2025-06-18', 'activo'),
('PT-011', 'Pruebas de Red Externa',                  'Evaluacion del perimetro expuesto a internet',                            '2025-06-18', 'activo'),
('PT-012', 'Seguridad de Redes Inalambricas',         'Revision de cifrado, claves y puntos de acceso no autorizados',           '2025-08-05', 'activo'),
('PT-013', 'Pruebas de API',                          'Analisis de endpoints, autenticacion y validacion de parametros',         '2025-09-12', 'activo'),
('PT-014', 'Pruebas de Aplicaciones Moviles',         'Revision de almacenamiento local y comunicacion de apps moviles',         '2025-10-20', 'activo'),
('PT-015', 'Revision de Configuracion en la Nube',    'Auditoria de permisos y configuraciones en servicios cloud',              '2025-11-14', 'activo'),
('PT-016', 'Denegacion de Servicio Controlada',       'Prueba de resistencia ante saturacion de recursos en ventanas acordadas', '2025-12-02', 'desactivado'),
('PT-017', 'Fuerza Bruta y Politicas de Contrasenas', 'Evaluacion de contrasenas debiles y mecanismos de bloqueo',               '2026-01-08', 'activo'),
('PT-018', 'Seguridad de Contenedores',               'Analisis de imagenes, orquestacion y configuracion de contenedores',      '2026-01-27', 'activo'),
('PT-019', 'Seguridad Fisica y de Dispositivos',      'Revision de acceso fisico a equipos e instalaciones',                     '2026-02-10', 'desactivado'),
('PT-020', 'Cifrado y Transporte (TLS)',              'Evaluacion de protocolos y certificados en comunicaciones',               '2026-02-24', 'activo');

-- ============================================================
-- MODULO DE REPORTE (20)
-- ============================================================
INSERT INTO reporte (referencia, id_usuario, id_tipo_prueba, titulo, resumen, severidad, estado, fecha_emision, visible_cliente) VALUES
('REP-2026-001', 1, 2,  'Analisis de vulnerabilidades - Portal corporativo',      'Se identificaron 14 hallazgos en el portal web',              'alta',        'entregado', '2026-03-12', TRUE),
('REP-2026-002', 2, 5,  'Prueba de inyeccion SQL - Sistema de facturacion',       'Parametro vulnerable en el modulo de busqueda',               'critica',     'entregado', '2026-03-20', TRUE),
('REP-2026-003', 3, 6,  'Prueba XSS - Intranet institucional',                    'XSS reflejado en el formulario de contacto',                  'media',       'entregado', '2026-03-28', TRUE),
('REP-2026-004', 4, 1,  'Reconocimiento - Infraestructura externa',               'Se enumeraron 23 subdominios expuestos',                      'informativa', 'entregado', '2026-04-02', TRUE),
('REP-2026-005', 5, 7,  'Autenticacion y sesiones - Plataforma de tramites',      'Tokens de sesion sin expiracion definida',                    'alta',        'emitido',   '2026-04-10', TRUE),
('REP-2026-006', 6, 8,  'Control de acceso - Aplicacion de inventario',           'Acceso horizontal a datos de otros usuarios',                 'alta',        'entregado', '2026-04-18', TRUE),
('REP-2026-007', 7, 9,  'Ingenieria social - Campana de phishing',                '31% del personal abrio el correo simulado',                   'media',       'entregado', '2026-04-25', TRUE),
('REP-2026-008', 8, 10, 'Red interna - Segmentacion',                             'Segmentos de red sin restriccion entre areas',                'media',       'emitido',   '2026-05-05', TRUE),
('REP-2026-009', 9, 11, 'Red externa - Perimetro',                                'Puertos de administracion expuestos a internet',              'alta',        'entregado', '2026-05-14', TRUE),
('REP-2026-010', 10,12, 'Redes inalambricas - Sucursal Boquete',                  'Cifrado WPA2 con clave debil',                                'media',       'entregado', '2026-05-22', TRUE),
('REP-2026-011', 11,13, 'Pruebas de API - Servicio de pagos',                     'Endpoints sin limitacion de solicitudes',                     'alta',        'emitido',   '2026-06-03', TRUE),
('REP-2026-012', 12,14, 'Aplicacion movil - Banca en linea',                      'Almacenamiento inseguro de datos locales',                    'media',       'entregado', '2026-06-12', TRUE),
('REP-2026-013', 1, 15, 'Configuracion en la nube - Almacenamiento',              'Bucket con permisos de lectura publicos',                     'critica',     'entregado', '2026-06-20', TRUE),
('REP-2026-014', 2, 17, 'Politicas de contrasenas - Directorio activo',           'Cuentas con contrasenas comunes detectadas',                  'alta',        'entregado', '2026-07-01', TRUE),
('REP-2026-015', 3, 18, 'Contenedores - Cluster de produccion',                   'Imagenes base con vulnerabilidades conocidas',                'media',       'emitido',   '2026-07-15', TRUE),
('REP-2026-016', 4, 20, 'Cifrado y transporte - Sitio web',                       'Soporte de protocolos TLS obsoletos',                         'baja',        'entregado', '2026-07-28', TRUE),
('REP-2026-017', 5, 3,  'Explotacion - Servidor de aplicaciones',                 'Ejecucion remota de comandos comprobada',                     'critica',     'entregado', '2026-08-09', TRUE),
('REP-2026-018', 6, 4,  'Post-explotacion - Escalada de privilegios',             'Escalada a administrador de dominio lograda',                 'critica',     'emitido',   '2026-08-21', TRUE),
('REP-2026-019', 7, 2,  'Analisis de vulnerabilidades - Red de oficinas',         'Se hallaron 9 vulnerabilidades de severidad media',           'media',       'borrador',  '2026-09-10', FALSE),
('REP-2026-020', 8, 13, 'Pruebas de API - Aplicacion de reservas',                'Falta de validacion en parametros de entrada',                'baja',        'borrador',  '2026-10-05', FALSE);

-- ============================================================
-- MODULO DE PAGO (20)  -- numeros de tarjeta de PRUEBA, no reales
-- ============================================================
INSERT INTO metodo_pago (id_usuario, marca, numero_tarjeta, titular, cvc, vencimiento_mes, vencimiento_anio, predeterminada) VALUES
(1,  'visa',             '4111111111111111', 'ANA RODRIGUEZ',     '123',  8,  2028, TRUE),
(1,  'mastercard',       '5555555555554444', 'ANA RODRIGUEZ',     '456',  3,  2029, FALSE),
(2,  'visa',             '4012888888881881', 'LUIS PEREZ',        '789',  11, 2027, TRUE),
(2,  'american_express', '378282246310005',  'LUIS PEREZ',        '1234', 5,  2030, FALSE),
(3,  'mastercard',       '5105105105105100', 'MARTA CASTILLO',    '321',  2,  2028, TRUE),
(3,  'discover',         '6011111111111117', 'MARTA CASTILLO',    '654',  9,  2029, FALSE),
(4,  'american_express', '371449635398431',  'ANDRES MENDOZA',    '4321', 12, 2027, TRUE),
(4,  'visa',             '4111111111111111', 'ANDRES MENDOZA',    '987',  6,  2030, FALSE),
(5,  'discover',         '6011000990139424', 'SOFIA VARGAS',      '147',  4,  2028, TRUE),
(5,  'diners',           '30569309025904',   'SOFIA VARGAS',      '258',  10, 2029, FALSE),
(6,  'visa',             '4012888888881881', 'JORGE BATISTA',     '369',  1,  2031, TRUE),
(6,  'mastercard',       '5555555555554444', 'JORGE BATISTA',     '741',  7,  2028, FALSE),
(7,  'diners',           '38520000023237',   'DANIELA ORTEGA',    '852',  3,  2027, TRUE),
(7,  'visa',             '4111111111111111', 'DANIELA ORTEGA',    '963',  8,  2030, FALSE),
(8,  'mastercard',       '5105105105105100', 'RICARDO SAMANIEGO', '159',  12, 2028, TRUE),
(8,  'american_express', '378282246310005',  'RICARDO SAMANIEGO', '7531', 2,  2029, FALSE),
(9,  'visa',             '4012888888881881', 'PAOLA AROSEMENA',   '246',  5,  2029, TRUE),
(10, 'discover',         '6011111111111117', 'HECTOR QUINTERO',   '135',  9,  2027, TRUE),
(11, 'mastercard',       '5555555555554444', 'LUCIA FERNANDEZ',   '579',  11, 2030, TRUE),
(12, 'visa',             '4111111111111111', 'ESTEBAN MORENO',    '864',  4,  2031, TRUE);
