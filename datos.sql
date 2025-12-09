

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
