USE esports;


SELECT COUNT(*) AS total_usuarios 
FROM USUARIO;
SELECT c.nombre AS comuna, COUNT(b.id) AS cantidad_barrios
FROM COMUNA c
LEFT JOIN COMUNA_BARRIO b ON b.comuna_id = c.id
GROUP BY c.nombre;
SELECT nombre AS `Título del Juego`, 
       estudio_desarrollador AS `Empresa Desarrolladora`
FROM JUEGO;
SELECT CONCAT(u.primer_nombre, ' ', u.primer_apellido) AS nombre_completo, 
       b.nombre AS barrio
FROM USUARIO u, COMUNA_BARRIO b
WHERE u.comuna_barrio_id = b.id;
SELECT p.id AS PLATAFORMA_id, 
       p.nombre AS nombre_plataforma,
       COUNT(j.id) AS cantidad_juegos
FROM PLATAFORMA p
LEFT JOIN JUEGO j ON j.plataforma_id = p.id
GROUP BY p.id, p.nombre;
SELECT nombre AS `Squad`, 
       horas_entrenamiento AS `Tiempo Jugado`
FROM EQUIPO;
SELECT e.nombre AS nombre_equipo, 
       j.nombre AS nombre_juego
FROM EQUIPO_JUEGO ej, EQUIPO e, JUEGO j
WHERE ej.equipo_id = e.id 
  AND ej.juego_id = j.id;
SELECT tipo_genero AS tipo, 
       COUNT(*) AS cantidad
FROM JUEGO
GROUP BY tipo_genero
ORDER BY cantidad DESC;
SELECT lt.nombre AS logro, 
       lt.puntos_requeridos, 
       j.nombre AS juego
FROM LOGRO_TROFEO lt, JUEGO j
WHERE lt.juego_id = j.id;
SELECT s.fecha_agendamiento AS fecha_sesion, 
       CONCAT(u.primer_nombre, ' ', u.primer_apellido) AS nombre_arbitro,
       s.hora_inicio,
       s.hora_fin
FROM SESION_ENTRENAMIENTO s, USUARIO u
WHERE s.arbitro_usuario_id = u.id;
