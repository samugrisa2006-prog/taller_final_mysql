

USE esports;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS USUARIO_EQUIPO;
DROP TABLE IF EXISTS SESION_ENTRENAMIENTO;
DROP TABLE IF EXISTS CONTROL;
DROP TABLE IF EXISTS CONSOLA;
DROP TABLE IF EXISTS LOGRO_TROFEO;
DROP TABLE IF EXISTS EQUIPO_JUEGO;
DROP TABLE IF EXISTS EQUIPO;
DROP TABLE IF EXISTS JUEGO;
DROP TABLE IF EXISTS PLATAFORMA;
DROP TABLE IF EXISTS USUARIO;
DROP TABLE IF EXISTS COMUNA_BARRIO;
DROP TABLE IF EXISTS COMUNA;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE COMUNA (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE COMUNA_BARRIO (
  id INT AUTO_INCREMENT PRIMARY KEY,
  comuna_id INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  FOREIGN KEY (comuna_id) REFERENCES COMUNA(id) ON DELETE CASCADE
);

CREATE TABLE USUARIO (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tipo_documento VARCHAR(20),
  numero_documento VARCHAR(50) UNIQUE,
  primer_nombre VARCHAR(50) NOT NULL,
  segundo_nombre VARCHAR(50),
  primer_apellido VARCHAR(50) NOT NULL,
  segundo_apellido VARCHAR(50),
  edad INT,
  sexo ENUM('M','F','O') DEFAULT 'O',
  comuna_barrio_id INT,
  direccion VARCHAR(200),
  telefono_movil VARCHAR(30),
  telefono_trabajo VARCHAR(30),
  telefono_fijo VARCHAR(30),
  redes_sociales VARCHAR(255),
  tipo_usuario VARCHAR(50),
  username VARCHAR(50),
  password VARCHAR(255),
  padre_familia VARCHAR(150),
  FOREIGN KEY (comuna_barrio_id) REFERENCES COMUNA_BARRIO(id) ON DELETE SET NULL
);

CREATE TABLE PLATAFORMA (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  marca VARCHAR(100)
);

CREATE TABLE JUEGO (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  esrb VARCHAR(10),
  estudio_desarrollador VARCHAR(150),
  tipo_genero VARCHAR(50),
  num_jugadores INT DEFAULT 1,
  total_existencias INT DEFAULT 0,
  plataforma_id INT,
  FOREIGN KEY (plataforma_id) REFERENCES PLATAFORMA(id)
);

CREATE TABLE EQUIPO (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  horas_entrenamiento INT DEFAULT 0,
  nivel_equipo VARCHAR(50),
  trofeos_total INT DEFAULT 0
);

CREATE TABLE EQUIPO_JUEGO (
  id INT AUTO_INCREMENT PRIMARY KEY,
  equipo_id INT NOT NULL,
  juego_id INT NOT NULL,
  FOREIGN KEY (equipo_id) REFERENCES EQUIPO(id) ON DELETE CASCADE,
  FOREIGN KEY (juego_id) REFERENCES JUEGO(id) ON DELETE CASCADE
);

CREATE TABLE LOGRO_TROFEO (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  puntos_requeridos INT NOT NULL,
  juego_id INT NOT NULL,
  FOREIGN KEY (juego_id) REFERENCES JUEGO(id) ON DELETE CASCADE
);

CREATE TABLE CONSOLA (
  id INT AUTO_INCREMENT PRIMARY KEY,
  numero_serie VARCHAR(100),
  nombre VARCHAR(150),
  total_existente INT DEFAULT 0,
  direccion_ip VARCHAR(50),
  mac_ethernet VARCHAR(50),
  mac_wifi VARCHAR(50),
  total_controles_disponibles INT DEFAULT 0,
  plataforma_id INT,
  FOREIGN KEY (plataforma_id) REFERENCES PLATAFORMA(id)
);

CREATE TABLE CONTROL (
  id INT AUTO_INCREMENT PRIMARY KEY,
  numero_serie VARCHAR(100),
  plataforma_id INT,
  tipo_control VARCHAR(80),
  FOREIGN KEY (plataforma_id) REFERENCES PLATAFORMA(id)
);

CREATE TABLE SESION_ENTRENAMIENTO (
  id INT AUTO_INCREMENT PRIMARY KEY,
  fecha_agendamiento DATE NOT NULL,
  hora_inicio TIME,
  hora_fin TIME,
  juego_id INT,
  arbitro_usuario_id INT,
  estado ENUM('AGENDADA','CANCELADA','CERRADA') DEFAULT 'AGENDADA',
  equipo_id INT,
  FOREIGN KEY (juego_id) REFERENCES JUEGO(id),
  FOREIGN KEY (arbitro_usuario_id) REFERENCES USUARIO(id),
  FOREIGN KEY (equipo_id) REFERENCES EQUIPO(id)
);

CREATE TABLE USUARIO_EQUIPO (
  id INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT NOT NULL,
  equipo_id INT NOT NULL,
  fecha_ingreso DATE,
  rol_en_equipo VARCHAR(80),
  FOREIGN KEY (usuario_id) REFERENCES USUARIO(id) ON DELETE CASCADE,
  FOREIGN KEY (equipo_id) REFERENCES EQUIPO(id) ON DELETE CASCADE
);


INSERT INTO COMUNA (nombre) VALUES ('Comuna 1'), ('Comuna 2'), ('Comuna 3');

INSERT INTO COMUNA_BARRIO (comuna_id, nombre) VALUES
(1,'Barrio A'),
(1,'Barrio B'),
(2,'Barrio C'),
(2,'Barrio D'),
(3,'Barrio E'),
(3,'Barrio F');

INSERT INTO USUARIO (tipo_documento, numero_documento, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, edad, sexo, comuna_barrio_id, direccion, telefono_movil, redes_sociales, tipo_usuario, username, password, padre_familia)
VALUES
('CC','1001','Juan',NULL,'Pérez',NULL,25,'M',1,'Calle 1 #1-10','3001110001','@juan','atleta','juanp','pass1',NULL),
('CC','1002','María',NULL,'Gómez',NULL,22,'F',2,'Calle 2 #2-20','3001110002','@maria','entrenador','mariag','pass2',NULL),
('CC','1003','Carlos',NULL,'Ramírez',NULL,30,'M',3,'Calle 3 #3-30','3001110003','@carlos','administrativo','carlosr','pass3',NULL),
('CC','1004','Ana',NULL,'Torres',NULL,17,'F',4,'Calle 4 #4-40','3001110004','@ana','atleta','anat','pass4','Padre Torres'),
('CC','1005','Luis',NULL,'Martínez',NULL,20,'M',5,'Calle 5 #5-50','3001110005','@luis','proveedor','luism','pass5',NULL),
('CC','1006','Sofía',NULL,'Ruiz',NULL,19,'F',6,'Calle 6 #6-60','3001110006','@sofi','atleta','sofi','pass6',NULL),
('CC','1007','Andrés',NULL,'Mejía',NULL,27,'M',1,'Calle 7 #7-70','3001110007','@andres','arbitro','andresm','pass7',NULL),
('CC','1008','Valentina',NULL,'Cruz',NULL,23,'F',2,'Calle 8 #8-80','3001110008','@valen','atleta','valenc','pass8',NULL);

INSERT INTO PLATAFORMA (nombre, marca) VALUES
('PC','Generic'),
('PlayStation','Sony'),
('Xbox','Microsoft');

INSERT INTO JUEGO (nombre, esrb, estudio_desarrollador, tipo_genero, num_jugadores, total_existencias, plataforma_id) VALUES
('ShooterPro','M','DevStudio A','Shooter',5,10,1),
('MOBA Max','T','DevStudio B','MOBA',10,8,1),
('CarreraTop','E','DevStudio C','Racing',12,4,2),
('FútbolPro','E','DevStudio D','Sports',22,6,3),
('BeatMusic','E','DevStudio E','Rhythm',1,3,1),
('AventuraX','T','DevStudio F','Adventure',4,2,2);

INSERT INTO EQUIPO (nombre, horas_entrenamiento, nivel_equipo, trofeos_total) VALUES
('Dragons',40,'Profesional',5),
('Titans',20,'Semiprofesional',2),
('Rookies',10,'Amateur',0),
('Legends',60,'Profesional',10);

INSERT INTO EQUIPO_JUEGO (equipo_id, juego_id) VALUES
(1,1),(2,2),(3,3),(4,1),(4,4);

INSERT INTO LOGRO_TROFEO (nombre, puntos_requeridos, juego_id) VALUES
('Primera Sangre',100,1),
('Campeón Semanal',500,2),
('Vuelta Rápida',150,3),
('Hat-trick',200,4),
('Ritmo Perfecto',120,5),
('Explorador',80,6);

INSERT INTO CONSOLA (numero_serie, nombre, total_existente, direccion_ip, mac_ethernet, mac_wifi, total_controles_disponibles, plataforma_id) VALUES
('SN100','PC Sala 1',5,'192.168.1.10','00:11:22:33:44:55','AA:BB:CC:DD:EE:FF',10,1),
('SN101','PS Sala 1',3,'192.168.1.20','00:11:22:33:44:66','AA:BB:CC:DD:EE:00',6,2),
('SN102','Xbox Sala 1',2,'192.168.1.30','00:11:22:33:44:77','AA:BB:CC:DD:EE:11',4,3);

INSERT INTO CONTROL (numero_serie, plataforma_id, tipo_control) VALUES
('C100',1,'Teclado'),
('C101',1,'Mouse'),
('C102',2,'Control DualShock'),
('C103',3,'Control Xbox'),
('C104',1,'Volante'),
('C105',2,'Instrumento Musical');

INSERT INTO SESION_ENTRENAMIENTO (fecha_agendamiento, hora_inicio, hora_fin, juego_id, arbitro_usuario_id, estado, equipo_id) VALUES
('2025-12-01','09:00:00','11:00:00',1,7,'AGENDADA',1),
('2025-12-02','14:00:00','16:00:00',2,7,'CERRADA',2),
('2025-12-03','10:00:00','12:00:00',3,7,'CANCELADA',3),
('2025-12-04','18:00:00','20:00:00',4,7,'AGENDADA',4);

INSERT INTO USUARIO_EQUIPO (usuario_id, equipo_id, fecha_ingreso, rol_en_equipo) VALUES
(1,1,'2024-01-10','Jugador'),
(4,1,'2024-02-15','Jugador'),
(2,1,'2023-11-05','Entrenador'),
(6,3,'2024-06-20','Jugador');

