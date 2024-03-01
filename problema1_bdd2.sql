-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS pixel_security_360;

-- Usar la base de datos creada
USE pixel_security_360;

CREATE TABLE IF NOT EXISTS autenticacion (
    autenticacion_id INT  AUTO_INCREMENT,
    usuario_id INT UNIQUE,
    nombre_usuario VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    agente_usuario VARCHAR(100),
    token VARCHAR(100),
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
    PRIMARY KEY (autenticacion_id)
);

SELECT * FROM usuario
INSERT INTO autenticacion (usuario_id, nombre_usuario, contrasena, agente_usuario, token) VALUES
(24, 'juan123', 'password1', 'Equipo1', MD5(RAND())),
(25, 'maria456', 'password2', 'Equipo2', MD5(RAND())),
(26, 'pedro789', 'password3', 'Equipo3', MD5(RAND())),
(27, 'ana321', 'password4', 'Equipo4', MD5(RAND())),
(28, 'carlos987', 'password5', 'Equipo5', MD5(RAND())),
(29, 'luis111', 'password6', 'Equipo6', MD5(RAND())),
(30, 'laura222', 'password7', 'Equipo7', MD5(RAND())),
(31, 'diego333', 'password8', 'Equipo8', MD5(RAND())),
(32, 'sofia444', 'password9', 'Equipo9', MD5(RAND())),
(33, 'elena555', 'password10', 'Equipo10', MD5(RAND()));

-- Tabla de tipo de usuario
CREATE TABLE IF NOT EXISTS tipo_usuario (
    tipo_usuario_id INT  AUTO_INCREMENT,
    nombre_tipo VARCHAR(100) NOT NULL,
    PRIMARY KEY(tipo_usuario_id)
);

-- Insertar tipos de usuarios iniciales
INSERT INTO tipo_usuario (nombre_tipo) VALUES
('Cliente'),
('Administrador'),
('Vendedor'),
('Ejecutivo'),
('Otro');

-- Tabla de usuario con relación a tipo de usuario
CREATE TABLE IF NOT EXISTS usuario (
    usuario_id INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    nombre_usuario VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    ciudad VARCHAR(100),
    sexo ENUM('M', 'F', 'O'),
    estado_civil ENUM('soltero', 'casado', 'divorciado', 'viudo'),
    tipo_usuario_id INT,
    direccion VARCHAR(255),
    FOREIGN KEY (tipo_usuario_id) REFERENCES tipo_usuario(tipo_usuario_id),
    PRIMARY KEY (usuario_id)
);



-- Insertar datos en la tabla usuario con los tipos de usuario correspondientes
INSERT INTO usuario (nombre, apellido, nombre_usuario, contrasena, ciudad, sexo, estado_civil, tipo_usuario_id, direccion) VALUES
('Juan', 'Pérez', 'juan123', 'password1', 'Ciudad A', 'M', 'casado', 1, 'Calle 123'), -- Cliente
('María', 'González', 'maria456', 'password2', 'Ciudad B', 'F', 'soltero', 2, 'Avenida XYZ'), -- Administrador
('Pedro', 'López', 'pedro789', 'password3', 'Ciudad C', 'M', 'soltero', 3, 'Carrera 789'), -- Vendedor
('Ana', 'Martínez', 'ana321', 'password4', 'Ciudad D', 'F', 'casado', 4, 'Calle 456'), -- Ejecutivo
('Carlos', 'Ruiz', 'carlos987', 'password5', 'Ciudad E', 'M', 'soltero', 5, 'Avenida ABC'), -- Otro
('Luis', 'Sánchez', 'luis111', 'password6', 'Ciudad F', 'M', 'casado', 1, 'Calle 789'), -- Cliente
('Laura', 'Díaz', 'laura222', 'password7', 'Ciudad G', 'F', 'soltero', 2, 'Avenida LMN'), -- Administrador
('Diego', 'Martín', 'diego333', 'password8', 'Ciudad H', 'M', 'soltero', 3, 'Carrera 012'), -- Vendedor
('Sofía', 'Hernández', 'sofia444', 'password9', 'Ciudad I', 'F', 'soltero', 4, 'Calle 345'), -- Ejecutivo
('Elena', 'Gómez', 'elena555', 'password10', 'Ciudad J', 'F', 'casado', 5, 'Avenida XYZ'); -- Otro


-- Tabla de pruebas con relación a usuario
CREATE TABLE IF NOT EXISTS pruebas (
    prueba_id INT PRIMARY KEY AUTO_INCREMENT,
    referencia VARCHAR(100) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_ingreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('activo', 'desactivado') DEFAULT 'activo',
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
);

-- Insertar datos en la tabla pruebas
INSERT INTO pruebas (referencia, nombre, descripcion,estado, usuario_id) VALUES
('REF001', 'Prueba de vulnerabilidad de red', 'Escaneo de puertos y detección de vulnerabilidades en la red.','activo', 24),
('REF002', 'Prueba de seguridad web', 'Identificación de vulnerabilidades en aplicaciones web.','activo', 25),
('REF003', 'Prueba de phishing', 'Simulación de ataques de phishing para evaluar la resistencia de los usuarios.','desactivado',26),
('REF004', 'Prueba de intrusión', 'Intentos de acceso no autorizado a sistemas informáticos.','activo', 27),
('REF005', 'Prueba de denegación de servicio', 'Simulación de ataques para saturar recursos del sistema.','activo', 28),
('REF006', 'Prueba de firewall', 'Evaluación de la configuración y eficacia del firewall de red.','activo', 29),
('REF007', 'Prueba de análisis de tráfico', 'Análisis del tráfico de red para detectar anomalías y posibles amenazas.','desactivado', 30),
('REF008', 'Prueba de autenticación', 'Evaluación de la seguridad de los mecanismos de autenticación de usuarios.','activo', 31),
('REF009', 'Prueba de cifrado', 'Evaluación de la integridad y eficacia de los algoritmos de cifrado.','activo', 32),
('REF010', 'Prueba de políticas de seguridad', 'Revisión de las políticas y procedimientos de seguridad implementados.','desactivado', 33);


-- Tabla de pago
CREATE TABLE IF NOT EXISTS pago (
    pago_id INT  AUTO_INCREMENT,
    usuario_id INT,
    monto DECIMAL(10, 2) NOT NULL,
    fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
    PRIMARY KEY(pago_id)
);
INSERT INTO pago (usuario_id, monto) VALUES
(24, 50.00),
(25, 75.00),
(26, 100.00),
(27, 125.00),
(28, 150.00),
(29, 175.00),
(30, 200.00),
(31, 225.00),
(32, 250.00),
(33, 275.00);

-- Tabla de reportes
CREATE TABLE IF NOT EXISTS reporte (
    reporte_id INT  AUTO_INCREMENT,
    usuario_id INT,
    prueba_id INT,
    fecha_reporte TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    resultado TEXT,
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
    FOREIGN KEY (prueba_id) REFERENCES pruebas(prueba_id),
    PRIMARY KEY(reporte_id)
);


-- Insertar datos en la tabla reporte
INSERT INTO reporte (usuario_id, prueba_id, resultado) VALUES
(24, 11, 'Se encontraron múltiples vulnerabilidades en la red corporativa.'),
(25, 12, 'La aplicación web presenta vulnerabilidades de inyección de SQL.'),
(26, 13, 'Los empleados tienen una alta tasa de clics en enlaces de phishing.'),
(27, 14, 'Se detectaron intentos de intrusión en el sistema.'),
(28, 15, 'El servicio web experimentó un ataque de denegación de servicio.'),
(29, 16, 'Se detectaron correos electrónicos de phishing en la bandeja de entrada.'),
(30, 17, 'Se identificaron puertos abiertos en la red interna.'),
(31, 18, 'Se encontró una vulnerabilidad de inyección de SQL en el sistema de gestión de contenido.'),
(32, 19, 'Se recibieron varios intentos de acceso no autorizado.'),
(33, 20, 'El sistema experimentó un ataque de denegación de servicio distribuido (DDoS).');

SELECT * from pago
