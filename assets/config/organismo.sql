-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-05-2023 a las 23:15:34
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `organismo`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE PROCEDURE `sp_delete_documento` (IN `_id` INT(11))  BEGIN
        	DECLARE existe_documento INT;
        	DECLARE response INT;
            
            SET existe_documento = (SELECT COUNT(*) FROM documento WHERE id=_id AND status = 1 LIMIT 1); 
            IF existe_documento > 0 THEN
            	UPDATE documento SET status = 0 WHERE id=_id;
                SET response = 1;
            ELSE
            	SET response = 0;
            END IF;
            SELECT response;
        END$$

CREATE PROCEDURE `sp_existe_expediente` (IN `_expediente` VARCHAR(200))  BEGIN
        	DECLARE existe_expediente INT;
        	DECLARE response INT;
            
            SET existe_expediente = (SELECT COUNT(*) FROM documento WHERE expediente=_expediente AND status = 1 LIMIT 1);
            
            IF existe_expediente > 0 THEN
            	SET response = 1; 
            ELSE
            	SET response = 0;
            END IF;
           
            SELECT response;
        END$$

CREATE PROCEDURE `sp_existe_expediente_update` (`_id` INT, `_expediente` VARCHAR(200))  BEGIN
        	DECLARE existe_expediente INT;
            DECLARE response INT;
            
            SET existe_expediente = (SELECT COUNT(*) FROM documento WHERE (expediente=_expediente AND id!=_id) AND status=1 LIMIT 1);
            IF existe_expediente > 0 THEN
            	SET response = 1;
            ELSE
            	SET response = 0;
            END IF;
            SELECT response;
        END$$

CREATE PROCEDURE `sp_existe_fechaSuscripcion` (IN `_fechaSuscrip` VARCHAR(200))  BEGIN
        	DECLARE existe_fecha INT;
        	DECLARE response INT;
            
            SET existe_fecha = (SELECT COUNT(*) FROM documento WHERE fechaSuscripcion=_fechaSuscrip AND status = 1 LIMIT 1);
            
            IF existe_fecha > 0 THEN
            	SET response = 1; 
            ELSE
            	SET response = 0;
            END IF;
           
            SELECT response;
        END$$

CREATE PROCEDURE `sp_existe_fechaSuscrip_update` (`_id` INT, `_fechaSuscrip` VARCHAR(100))  BEGIN
        	DECLARE existe_fecha INT;
        	DECLARE response INT;
            
            SET existe_fecha = (SELECT COUNT(*) FROM documento WHERE (fechaSuscripcion=_fechaSuscrip AND id!=_id) AND status=1 LIMIT 1);
            IF existe_fecha > 0 THEN
            	SET response = 1;
            ELSE
            	SET response = 0;
            END IF;
            
            SELECT response;
        END$$

CREATE PROCEDURE `sp_existe_titulo` (IN `_titulo` VARCHAR(255))  BEGIN
        	DECLARE existe_titulo INT;
        	DECLARE response INT;
            
            SET existe_titulo = (SELECT COUNT(*) FROM documento WHERE titulo=_titulo AND status = 1 LIMIT 1);
            
            IF existe_titulo > 0 THEN
            	SET response = 1; 
            ELSE
            	SET response = 0;
            END IF;
           
            SELECT response;
        END$$

CREATE PROCEDURE `sp_existe_titulo_update` (`_id` INT, `_titulo` VARCHAR(255))  BEGIN
        	DECLARE existe_titulo INT;
            DECLARE response INT;
            
            SET existe_titulo = (SELECT COUNT(*) FROM documento WHERE (titulo=_titulo AND id!=_id) AND status=1 LIMIT 1);
            IF existe_titulo > 0 THEN
            	SET response = 1;
            ELSE
            	SET response = 0;
            END IF;
            SELECT response;
        END$$

CREATE PROCEDURE `sp_insert_autor` (`_nombre` VARCHAR(80), `_apellido` VARCHAR(80))  BEGIN
        	DECLARE response INT;
            
        	INSERT INTO autor(nombre,apellido) VALUES(TRIM(_nombre),TRIM(_apellido));
            SET response = LAST_INSERT_ID();
            
            SELECT response;
        END$$

CREATE PROCEDURE `sp_insert_descripFisica` (IN `_numPag` VARCHAR(10), IN `_numHojas` VARCHAR(10), IN `_formato` VARCHAR(10), IN `_otros` VARCHAR(100))  BEGIN
        	DECLARE response INT;
            
        	INSERT INTO descripfisica(numPag,numHojas,formato,otros) VALUES(TRIM(_numPag),TRIM(_numHojas),TRIM(_formato),TRIM(_otros));
            SET response = LAST_INSERT_ID();
            
            SELECT response;
        END$$

CREATE PROCEDURE `sp_insert_documento` (IN `_titulo` VARCHAR(255), IN `_expediente` VARCHAR(200), IN `_mencionRespoID` INT(11), IN `_fechaSuscripcion` VARCHAR(100), IN `_descripFisicaID` INT(11), IN `_notasID` INT(11), IN `_terminoPropuesto` VARCHAR(22), IN `_ubicacionID` INT(11), IN `_responsable` VARCHAR(150), IN `_archivoAdjunto` VARCHAR(255))  BEGIN
        	DECLARE response INT;
            
            INSERT INTO documento(titulo,expediente,mencionResponsabilidad_id,fechaSuscripcion,descripfisica_id,notas_id,terminoPropuesto,ubicacion_id,responsable,archivoAdjunto) VALUES(TRIM(_titulo),TRIM(_expediente),_mencionRespoID,TRIM(_fechaSuscripcion),_descripFisicaID,_notasID,TRIM(_terminoPropuesto),_ubicacionID,TRIM(_responsable),TRIM(_archivoAdjunto));
            SET response = LAST_INSERT_ID();
            
            SELECT response;
        END$$

CREATE PROCEDURE `sp_insert_entidad` (`_nombre` VARCHAR(50))  BEGIN
        	DECLARE response INT;
            
        	INSERT INTO entidad(nombre) VALUES(TRIM(_nombre));
            SET response = LAST_INSERT_ID();
            
            SELECT response;
        END$$

CREATE PROCEDURE `sp_insert_mencionResponsabilidad` (IN `_autorID` INT(11), IN `_entidadID` INT(11))  BEGIN
        	DECLARE response INT;
            
            INSERT INTO mencionresponsabilidad(autor_id,entidad_id) VALUES(_autorID,_entidadID);
            SET response = LAST_INSERT_ID();
            
            SELECT response;
        END$$

CREATE PROCEDURE `sp_insert_notas` (`_objeto` VARCHAR(100), `_docVinculado` VARCHAR(150), `_notaContenido` VARCHAR(150), `_lugarRedaccion` VARCHAR(100), `_natuAlcanceForma` VARCHAR(100), `_vigencia` VARCHAR(80), `_numDecreto` VARCHAR(50), `_aprobadoLey` VARCHAR(50))  BEGIN
        	DECLARE response INT;
            
        	INSERT INTO notas(objeto,doc_vinculado,nota_contenido,lugar_redaccion,naturaleza_alcance_forma,vigencia,numero_decreto,aprobado_ley) VALUES(TRIM(_objeto),TRIM(_docVinculado),TRIM(_notaContenido),TRIM(_lugarRedaccion),TRIM(_natuAlcanceForma),TRIM(_vigencia),TRIM(_numDecreto),TRIM(_aprobadoLey));
            SET response = LAST_INSERT_ID();
            
            SELECT response;
        END$$

CREATE PROCEDURE `sp_insert_ubicacion` (IN `_carpeta` VARCHAR(20), IN `_folio` VARCHAR(20))  BEGIN
        	DECLARE response INT;
            
        	INSERT INTO ubicacion(carpeta,folio) VALUES(TRIM(_carpeta),TRIM(_folio));
            SET response = LAST_INSERT_ID();
            
            SELECT response;
        END$$

CREATE PROCEDURE `sp_select_archivo` (`_id` INT)  BEGIN
        	SELECT archivoAdjunto FROM documento WHERE id=_id AND status = 1 LIMIT 1;
        END$$

CREATE PROCEDURE `sp_select_documento` (IN `_id` INT(11))  BEGIN
        	SELECT f.id AS descripFisicaID, n.id AS notasID, u.id AS ubicacionID, a.id AS autorID, e.id AS entidadID,titulo,expediente,fechaSuscripcion, a.nombre AS nombreAutor, a.apellido AS apellidoAutor, e.nombre AS entidad,formato, numHojas,numPag,otros,doc_vinculado,lugar_redaccion,naturaleza_alcance_forma,nota_contenido,numero_decreto,objeto, aprobado_ley,vigencia,terminoPropuesto,carpeta,folio,responsable,archivoAdjunto 
		FROM documento d 
		INNER JOIN descripfisica f 
		ON d.descripfisica_id = f.id 
		INNER JOIN notas n 
		ON d.notas_id = n.id 
		INNER JOIN ubicacion u 
		ON d.ubicacion_id = u.id 
		INNER JOIN mencionresponsabilidad m
		ON d.mencionResponsabilidad_id = m.id 
		INNER JOIN autor a 
		ON m.autor_id = a.id
		INNER JOIN entidad e
		ON m.entidad_id = e.id
		WHERE d.id = _id
		AND d.status = 1;
        END$$

CREATE PROCEDURE `sp_select_documentos` ()  BEGIN
        	SELECT d.id AS idDocumento, f.id AS idDescripFisica, n.id AS idNotas, u.id AS idUbicacion, a.id AS idAutor, e.id AS idEntidad, d.titulo, d.expediente, d.fechaSuscripcion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', f.formato, f.numHojas, f.numPag, f.otros) AS descripFisica, CONCAT_WS(' ', n.doc_vinculado, n.lugar_redaccion, n.naturaleza_alcance_forma, n.nota_contenido,n.numero_decreto, n.objeto, n.aprobado_ley, n.vigencia) AS nota, d.terminoPropuesto, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN descripfisica f 
    ON d.descripfisica_id = f.id 
    INNER JOIN notas n 
    ON d.notas_id = n.id 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN mencionresponsabilidad m 
    ON d.mencionresponsabilidad_id = m.id
    INNER JOIN autor a 
    ON m.autor_id = a.id
    INNER JOIN entidad e
    ON m.entidad_id = e.id
    WHERE d.status = 1;
        END$$

CREATE PROCEDURE `sp_update_archivo` (`_id` INT, `_archivo` VARCHAR(255))  BEGIN
        	DECLARE existe_documento INT;
        	DECLARE response INT;
            SET existe_documento = (SELECT COUNT(id) FROM documento WHERE id=_id AND status = 1 LIMIT 1);
            
            IF existe_documento > 0 THEN
            	UPDATE documento SET archivoAdjunto=_archivo WHERE id=_id;
                SET response = 1;
            ELSE
            	SET response = 0;
            END IF;
            SELECT response;
        END$$

CREATE PROCEDURE `sp_update_autor` (`_id` INT, `_nombre` VARCHAR(60), `_apellido` VARCHAR(60))  BEGIN
        	DECLARE existe_autor INT;
        	DECLARE response INT;
            SET existe_autor = (SELECT COUNT(id) FROM autor WHERE id=_id LIMIT 1);
            
            IF existe_autor > 0 THEN
            	UPDATE autor SET nombre=_nombre,apellido=_apellido WHERE id=_id;
                SET response = 1;
            ELSE
            	SET response = 0;
            END IF;
            SELECT response;
        END$$

CREATE PROCEDURE `sp_update_descripFisica` (`_id` INT, `_numPag` VARCHAR(10), `_numHojas` VARCHAR(10), `_formato` VARCHAR(10), `_otros` VARCHAR(80))  BEGIN
        	DECLARE existe_descripFisica INT;
        	DECLARE response INT;
            SET existe_descripFisica = (SELECT COUNT(id) FROM descripfisica WHERE id=_id LIMIT 1);
            
            IF existe_descripFisica > 0 THEN
            	UPDATE descripfisica SET numPag=_numPag,numHojas=_numHojas,formato=_formato,otros=_otros WHERE id=_id;
                SET response = 1;
            ELSE
            	SET response = 0;
            END IF;
            SELECT response;
        END$$

CREATE PROCEDURE `sp_update_documento` (IN `_id` INT, IN `_titulo` VARCHAR(255), IN `_expediente` VARCHAR(100), IN `_fechaSuscripcion` VARCHAR(60), IN `_terminoPropuesto` VARCHAR(200), IN `_responsable` VARCHAR(150))  BEGIN
        	DECLARE existe_documento INT;
        	DECLARE response INT;
            SET existe_documento = (SELECT COUNT(id) FROM documento WHERE id=_id AND status = 1 LIMIT 1);
            
            IF existe_documento > 0 THEN
            	UPDATE documento SET titulo=_titulo,expediente=_expediente,fechaSuscripcion=_fechaSuscripcion,terminoPropuesto=_terminoPropuesto,responsable=_responsable WHERE id=_id;
                SET response = 1;
            ELSE
            	SET response = 0;
            END IF;
            SELECT response;
        END$$

CREATE PROCEDURE `sp_update_entidad` (`_id` INT, `_nombre` VARCHAR(60))  BEGIN
        	DECLARE existe_entidad INT;
        	DECLARE response INT;
            SET existe_entidad = (SELECT COUNT(id) FROM entidad WHERE id=_id LIMIT 1);
            
            IF existe_entidad > 0 THEN
            	UPDATE entidad SET nombre=_nombre WHERE id=_id;
                SET response = 1;
            ELSE
            	SET response = 0;
            END IF;
            SELECT response;
        END$$

CREATE PROCEDURE `sp_update_notas` (`_id` INT, `_objeto` VARCHAR(150), `_docVinculado` VARCHAR(150), `_notaContenido` VARCHAR(150), `_lugarRedaccion` VARCHAR(150), `_natuAlcanceForma` VARCHAR(150), `_vigencia` VARCHAR(50), `_numDecreto` VARCHAR(50), `_aprobadoLey` VARCHAR(50))  BEGIN
        	DECLARE existe_nota INT;
        	DECLARE response INT;
            SET existe_nota = (SELECT COUNT(id) FROM notas WHERE id=_id LIMIT 1);
            
            IF existe_nota > 0 THEN
            	UPDATE notas SET objeto=_objeto,doc_vinculado=_docVinculado,nota_contenido=_notaContenido,lugar_redaccion=_lugarRedaccion,naturaleza_alcance_forma=_natuAlcanceForma,vigencia=_vigencia,numero_decreto=_numDecreto,aprobado_ley=_aprobadoLey WHERE id=_id;
                SET response = 1;
            ELSE
            	SET response = 0;
            END IF;
            SELECT response;
        END$$

CREATE PROCEDURE `sp_update_ubicacion` (`_id` INT, `_carpeta` VARCHAR(20), `_folio` VARCHAR(20))  BEGIN
        	DECLARE existe_ubicacion INT;
        	DECLARE response INT;
            SET existe_ubicacion = (SELECT COUNT(id) FROM ubicacion WHERE id=_id LIMIT 1);
            
            IF existe_ubicacion > 0 THEN
            	UPDATE ubicacion SET carpeta=_carpeta,folio=_folio WHERE id=_id;
                SET response = 1;
            ELSE
            	SET response = 0;
            END IF;
            SELECT response;
        END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`id`, `nombre`, `apellido`) VALUES
(39, 'adasda', 'asda'),
(40, 'adasda', 'asda'),
(41, 'adasda', 'asda'),
(42, 'adasda', 'asda'),
(43, 'adasda', 'asda'),
(44, 'adasda', 'asda'),
(45, 'adasda', 'asda'),
(46, 'adasda', 'asda'),
(47, 'adasda', 'asda'),
(48, 'adasda', 'asda'),
(49, 'adasda', 'asda'),
(50, 'adasda', 'asda'),
(51, 'adasda', 'asda'),
(52, 'adasda', 'asda'),
(53, 'hola', 'asda'),
(54, 'nombreAutor', 'ApellidoAutor'),
(55, 'nombreAutor', 'ApellidoAutor'),
(56, 'nombreAutor', 'ApellidoAutor'),
(57, 'nombreautor', 'apellidoautor'),
(58, 'Theautor', 'TheapellidoAutor'),
(59, 'adsasdas', 'asdasda'),
(60, 'libero', 'libero'),
(61, 'corporis', 'eveniet'),
(62, 'ntium', 'tempore'),
(63, 'arc', 'sed'),
(64, 'consectetur', 'dolores'),
(65, 'Nostrum', 'adip'),
(66, 'pellat', 'eius');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descripfisica`
--

CREATE TABLE `descripfisica` (
  `id` int(11) NOT NULL,
  `numPag` varchar(10) NOT NULL,
  `numHojas` varchar(10) NOT NULL,
  `formato` varchar(10) NOT NULL,
  `otros` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `descripfisica`
--

INSERT INTO `descripfisica` (`id`, `numPag`, `numHojas`, `formato`, `otros`) VALUES
(33, '4', '4', 'Oficio', '2 ejemplares'),
(34, '4', '4', 'Oficio', '2 ejemplares'),
(35, '4', '4', 'Oficio', '2 ejemplares'),
(36, '4', '4', 'Oficio', '2 ejemplares'),
(37, '4', '4', 'Oficio', '2 ejemplares'),
(38, '4', '4', 'Oficio', '2 ejemplares'),
(39, '4', '4', 'Oficio', '2 ejemplares'),
(40, '4', '4', 'Oficio', '2 ejemplares'),
(41, '4', '4', 'Oficio', '2 ejemplares'),
(42, '4', '4', 'Oficio', '2 ejemplares'),
(43, '4', '4', 'Oficio', '2 ejemplares'),
(44, '4', '4', 'Oficio', '2 ejemplares'),
(45, '4', '4', 'Oficio', '2 ejemplares'),
(46, '4', '4', 'Oficio', '2 ejemplares'),
(47, '8', '3', 'A4', '8 ejemplares'),
(48, '111', '1111', 'formato', 'otros'),
(49, '324', '2342', 'The format', 'The otros'),
(50, '2543', '25523', 'asdas', 'asdasdas'),
(51, '43', '22', 'libero par', 'quibusdam optio autem nisi aliquam'),
(52, '345', '345', 'Fuga quos', 'necessitatibus error voluptatum ad ullam sint'),
(53, '24', '56', 'officiis n', 'dignissimos ad adipisci voluptatum corporis'),
(54, '435', '644', 'stiae arc', 'sit iste molestiae aliquam omnis explicabo'),
(55, '56', '546', 'consectetu', 't amet consectetur adipisicing elit. Unde aut recusandae vo'),
(56, '43', '324', 'Fuga quos', 'olorem, molestiae architecto hic temporibus eaque vitae'),
(57, '424', '46', 'perferendi', 'Corrupti nobis, eum hic pariatur iste perferendis consequuntur');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `expediente` varchar(100) NOT NULL,
  `mencionResponsabilidad_id` int(11) NOT NULL,
  `fechaSuscripcion` varchar(60) NOT NULL,
  `descripfisica_id` int(11) NOT NULL,
  `notas_id` int(11) NOT NULL,
  `terminoPropuesto` varchar(200) NOT NULL,
  `ubicacion_id` int(11) NOT NULL,
  `responsable` varchar(150) NOT NULL,
  `archivoAdjunto` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`id`, `titulo`, `expediente`, `mencionResponsabilidad_id`, `fechaSuscripcion`, `descripfisica_id`, `notas_id`, `terminoPropuesto`, `ubicacion_id`, `responsable`, `archivoAdjunto`, `status`) VALUES
(1, '. Fuga quos et quod numquam quia praesentium', 'libero pariatur soluta, corrupti repudiandae quis expedi', 50, '2023-05-13', 51, 49, '. Fuga quos et quod nu', 51, '. Fuga quos et quod numquam quia praesentium', '1683147330_example.pdf', 1),
(2, 'Fuga quos et quod numquam quia praesentium i', 'Fuga quos et quod numquam quia praesentium i', 51, '2023-05-21', 52, 50, 'eveniet illum sed cor', 52, 'necessitatibus error voluptatum ad ullam sint', '1683147425_example.pdf', 1),
(3, 'dignissimos ad adipisci voluptatum corporis', 'officiis natus! Qui, perspiciat', 52, '2023-04-07', 53, 51, 'dignissimos ad adipisc', 53, 'dignissimos ad adipisci voluptatum corporis', '1683147517_example.pdf', 1),
(4, 'sit iste molestiae aliquam omnis explicabo', 'l debitis? Impedit labore accusantium,', 53, '2023-03-15', 54, 52, 'sed corporis nostrum', 54, 'sit iste molestiae aliquam omnis explicabo', '1683147615_example.pdf', 1),
(5, 't amet consectetur adipisicing elit. Unde aut recusandae vo', 'consectetur libero pariatur dolor ipsam dolores a', 54, '2023-01-16', 55, 53, 'consectetur libero par', 55, 't amet consectetur adipisicing elit', '1683147722_example.pdf', 1),
(6, 'olorem, molestiae architecto hic temporibus eaque vitae', 'Nostrum dolorum dignissimos ad adip', 55, '2023-03-20', 56, 54, 'Fuga quos et quod numq', 56, 'olorem, molestiae architecto hic temporibus eaque vitae', '1683147812_example.pdf', 1),
(7, 'perferendis veniam eius maiores facilis', 'Corrupti nobis, eum hic pariatur iste perferendis consequuntur', 56, '2023-03-25', 57, 55, 'Facilis cum eveniet, v', 57, 'Facilis cum eveniet,', '1683147933_example.pdf', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidad`
--

CREATE TABLE `entidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `entidad`
--

INSERT INTO `entidad` (`id`, `nombre`) VALUES
(38, 'San Juan. Ministerio de Educación'),
(39, 'San Juan. Ministerio de Educación'),
(40, 'San Juan. Ministerio de Educación'),
(41, 'San Juan. Ministerio de Educación'),
(42, 'San Juan. Ministerio de Educación'),
(43, 'San Juan. Ministerio de Educación'),
(44, 'San Juan. Ministerio de Educación'),
(45, 'San Juan. Ministerio de Educación'),
(46, 'San Juan. Ministerio de Educación'),
(47, 'San Juan. Ministerio de Educación'),
(48, 'San Juan. Ministerio de Educación'),
(49, 'San Juan. Ministerio de Educación'),
(50, 'San Juan. Ministerio de Educación'),
(51, 'San Juan. Ministerio de Educación'),
(52, 'San Juan. Ministerio de Educación'),
(53, 'Entidad'),
(54, 'Entidad'),
(55, 'Entidad'),
(56, 'entidad'),
(57, 'The Entidad'),
(58, 'adsdad'),
(59, 'libero pariatur soluta, corrupti repudiandae quis'),
(60, 'necessitatibus error voluptatum ad ullam sint'),
(61, 'dignissimos ad adipisci voluptatum corporis'),
(62, 'sed corporis nostrum deserunt itaque atque id dol'),
(63, 'consectetur libero pariatur dolor ipsam dolores a'),
(64, 'Nostrum dolorum dignissimos ad adip'),
(65, 'Corrupti nobis, eum hic pariatur iste perferendis');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mencionresponsabilidad`
--

CREATE TABLE `mencionresponsabilidad` (
  `id` int(11) NOT NULL,
  `autor_id` int(11) NOT NULL,
  `entidad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mencionresponsabilidad`
--

INSERT INTO `mencionresponsabilidad` (`id`, `autor_id`, `entidad_id`) VALUES
(29, 39, 38),
(30, 40, 39),
(31, 41, 40),
(32, 42, 41),
(33, 43, 42),
(34, 44, 43),
(35, 45, 44),
(36, 46, 45),
(37, 47, 46),
(38, 48, 47),
(39, 49, 48),
(40, 50, 49),
(41, 51, 50),
(42, 52, 51),
(43, 53, 52),
(44, 54, 53),
(45, 55, 54),
(46, 56, 55),
(47, 57, 56),
(48, 58, 57),
(49, 59, 58),
(50, 60, 59),
(51, 61, 60),
(52, 62, 61),
(53, 63, 62),
(54, 64, 63),
(55, 65, 64),
(56, 66, 65);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `objeto` varchar(150) NOT NULL,
  `doc_vinculado` varchar(150) NOT NULL,
  `nota_contenido` varchar(150) NOT NULL,
  `lugar_redaccion` varchar(150) NOT NULL,
  `naturaleza_alcance_forma` varchar(150) NOT NULL,
  `vigencia` varchar(50) NOT NULL,
  `numero_decreto` varchar(50) NOT NULL,
  `aprobado_ley` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id`, `objeto`, `doc_vinculado`, `nota_contenido`, `lugar_redaccion`, `naturaleza_alcance_forma`, `vigencia`, `numero_decreto`, `aprobado_ley`) VALUES
(30, 'asda', 'asda', 'ada', 'San Juan', 'adsasada', '2022-12-04', '131', '582'),
(31, 'asda', 'asda', 'ada', 'San Juan', 'adsasada', '2022-12-04', '131', '582'),
(32, 'asda', 'asda', 'ada', 'San Juan', 'adsasada', '2022-12-04', '131', '582'),
(33, 'asda', 'asda', 'ada', 'San Juan', 'adsasada', '2022-12-04', '131', '582'),
(34, 'asda', 'asda', 'ada', 'San Juan', 'adsasada', '2022-12-04', '131', '582'),
(35, 'asda', 'asda', 'ada', 'San Juan', 'adsasada', '2022-12-04', '131', '582'),
(36, 'asda', 'asda', 'ada', 'San Juan', 'adsasada', '2022-12-04', '131', '582'),
(37, 'asda', 'asda', 'ada', 'San Juan', 'adsasada', '2022-12-04', '131', '582'),
(38, 'asda', 'asda', 'ada', 'San Juan', 'adsasada', '2022-12-04', '131', '582'),
(39, 'asda', 'asda', 'ada', 'San Juan', 'adsasada', '2022-12-04', '131', '582'),
(40, 'asda', 'asda', 'ada', 'San Juan', 'adsasada', '2022-12-04', '131', '582'),
(41, 'asda', 'asda', 'ada', 'San Juan', 'adsasada', '2022-12-04', '131', '582'),
(42, 'asda', 'asda', 'ada', 'San Juan', 'adsasada', '2022-12-04', '131', '582'),
(43, 'asda', 'asda', 'ada', 'San Juan', 'adsasada', '2022-12-04', '131', '582'),
(44, 'asda', 'asda', 'ada', 'San Juan', 'adsasada', '2022-12-04', '131', '582'),
(45, 'Objeto', 'Docuemento vinculado', 'nota contenido', 'Lugar de redaccion', 'Nuturaleza alcance y forma', '2023-04-20', '4553', '54234'),
(46, 'objeto', 'docuemento vinculado', 'Nota Contenido', 'Lugar de Redaccion', 'nuturaleza Alcance y Forma', '2023-04-27', '1111', '1111'),
(47, 'The objeto', 'The doc vinculado', 'The nota contenido', 'The lugar de redaccion', 'The naturalez', '2023-04-25', '34645654', '325346'),
(48, 'sadsa', 'asdsadas', 'asdsad', 'adsada', 'asdasda', '2023-04-18', '435435', '3443253'),
(49, 'quibusdam optio autem nisi aliquam', '. Fuga quos et quod numquam quia praesentium', 'quibusdam optio autem nisi aliquam', 'quibusdam optio autem nisi aliquam', 'libero pariatur soluta, corrupti repudiandae quis expedi', '2023-05-23', '4654645', '3464'),
(50, 'eveniet illum sed corporis no', 'Fuga quos m quia praesentium i', 'Fuga quos et quod numi', 'Fuga quos et quod numquam quia praesentium i', 'necessitatibus error voluptatum ad ullam sint', '2023-06-10', '45654', '36547'),
(51, 'officiis natus! Qui, perspiciat', 'ntium, maxime quos ut sed aliquam similique molestiae voluptatibus tempore', 'officiis natus! Qui, perspiciat', 'dignissimos ad adipisci voluptatum corporis', 'officiis natus! Qui, perspiciat', '2023-06-07', '634654', '5464'),
(52, 'sit iste molestiae aliquam omnis explicabo', ',  sed corporis nostrum deserunt itaque atque id dolorem, molestiae arc', 'l debitis? Impedit labore accusantium,', 'sit iste molestiae aliquam omnis explicabo', 'sit iste molestiae aliquam omnis explicabo', '2023-05-22', '4354', '464'),
(53, 'consectetur libero pariatur dolor ipsam dolores a', 't amet consectetur adipisicing elit. Unde aut recusandae vo', 'consectetur libero pariatur dolor ipsam dolores a', 'consectetur libero pariatur dolor ipsam dolores a', 't amet consectetur adipisicing elit. Unde aut recusandae vo', '2023-03-17', '4654', '45457'),
(54, 'Fuga quos et quod numquam quia praesentium impedit quae adipisci', 'Nostrum dolorum dignissimos ad adip', 'Fuga quos et quod numquam quia praesentium impedit quae adipisci', 'Fuga quos et quod numquam quia praesentium impedit quae adipisci', 'olorem, molestiae architecto hic temporibus eaque vitae', '2023-06-04', '878678', '45645'),
(55, 'eius ipsam blanditiis rem qui repudiandae repellat beatae', 'perferendis veniam eius maiores facilis', 'eius ipsam blanditiis rem qui repudiandae repellat beatae', 'eius ipsam blanditiis rem qui repudiandae repellat beatae', 'Facilis cum eveniet, vero doloremque', '2023-05-01', '57665', '4575');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id` int(11) NOT NULL,
  `carpeta` varchar(20) NOT NULL,
  `folio` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id`, `carpeta`, `folio`) VALUES
(32, 'C1', 'asdada'),
(33, 'C1', 'asdada'),
(34, 'C1', 'asdada'),
(35, 'C1', 'asdada'),
(36, 'C1', 'asdada'),
(37, 'C1', 'asdada'),
(38, 'C1', 'asdada'),
(39, 'C1', 'asdada'),
(40, 'C1', 'asdada'),
(41, 'C1', 'asdada'),
(42, 'C1', 'asdada'),
(43, 'C1', 'asdada'),
(44, 'C1', 'asdada'),
(45, 'C1', 'asdada'),
(46, 'C1', 'asdada'),
(47, '21432', '32423'),
(48, '11111', '1111'),
(49, 'The carpeta', 'The folio'),
(50, 'asdad', 'asdsadas'),
(51, '4', '3'),
(52, '34', '543'),
(53, 'Qui, perspiciat', 'perspiciat'),
(54, 'molestiae', 'sed corporis nostru'),
(55, 'res a', 'libero pariatur dolo'),
(56, 'gnissimos ad adip', 'Nostrum dolo'),
(57, 'Facilis cum eveniet,', 'vero doloremque');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `descripfisica`
--
ALTER TABLE `descripfisica`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documento_ibfk_1` (`mencionResponsabilidad_id`),
  ADD KEY `documento_ibfk_2` (`notas_id`),
  ADD KEY `documento_ibfk_3` (`ubicacion_id`),
  ADD KEY `documento_ibfk_4` (`descripfisica_id`);

--
-- Indices de la tabla `entidad`
--
ALTER TABLE `entidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mencionresponsabilidad`
--
ALTER TABLE `mencionresponsabilidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mencionresponsabilidad_ibfk_1` (`autor_id`),
  ADD KEY `mencionresponsabilidad_ibfk_2` (`entidad_id`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `descripfisica`
--
ALTER TABLE `descripfisica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `entidad`
--
ALTER TABLE `entidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `mencionresponsabilidad`
--
ALTER TABLE `mencionresponsabilidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `documento`
--
ALTER TABLE `documento`
  ADD CONSTRAINT `documento_ibfk_1` FOREIGN KEY (`mencionResponsabilidad_id`) REFERENCES `mencionresponsabilidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `documento_ibfk_2` FOREIGN KEY (`notas_id`) REFERENCES `notas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `documento_ibfk_3` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `documento_ibfk_4` FOREIGN KEY (`descripfisica_id`) REFERENCES `descripfisica` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mencionresponsabilidad`
--
ALTER TABLE `mencionresponsabilidad`
  ADD CONSTRAINT `mencionresponsabilidad_ibfk_1` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mencionresponsabilidad_ibfk_2` FOREIGN KEY (`entidad_id`) REFERENCES `entidad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
