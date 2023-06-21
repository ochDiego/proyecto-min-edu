-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-06-2023 a las 00:00:10
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
-- Base de datos: `organismo_2`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_documento` (IN `_id` INT(11))  BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existe_expediente` (IN `_expediente` VARCHAR(200))  BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existe_expediente_update` (`_id` INT, `_expediente` VARCHAR(200))  BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existe_fechaSuscripcion` (IN `_fechaSuscrip` VARCHAR(200))  BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existe_fechaSuscrip_update` (`_id` INT, `_fechaSuscrip` VARCHAR(100))  BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existe_titulo` (IN `_titulo` VARCHAR(255))  BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_existe_titulo_update` (`_id` INT, `_titulo` VARCHAR(255))  BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_autor` (`_nombre` VARCHAR(80), `_apellido` VARCHAR(80))  BEGIN
        	DECLARE response INT;
            
        	INSERT INTO autor(nombre,apellido) VALUES(TRIM(_nombre),TRIM(_apellido));
            SET response = LAST_INSERT_ID();
            
            SELECT response;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_descripFisica` (IN `_numPag` VARCHAR(10), IN `_numHojas` VARCHAR(10), IN `_formato` VARCHAR(10), IN `_otros` VARCHAR(100))  BEGIN
        	DECLARE response INT;
            
        	INSERT INTO descripfisica(numPag,numHojas,formato,otros) VALUES(TRIM(_numPag),TRIM(_numHojas),TRIM(_formato),TRIM(_otros));
            SET response = LAST_INSERT_ID();
            
            SELECT response;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_documento` (IN `_titulo` VARCHAR(255), IN `_expediente` VARCHAR(200), IN `_mencionRespoID` INT(11), IN `_fechaSuscripcion` VARCHAR(100), IN `_descripFisicaID` INT(11), IN `_notasID` INT(11), IN `_terminoPropuesto` VARCHAR(22), IN `_ubicacionID` INT(11), IN `_responsable` VARCHAR(150), IN `_archivoAdjunto` VARCHAR(255), IN `_autorInstitucional` VARCHAR(255), IN `_terminoControlado` VARCHAR(255))  BEGIN
        	DECLARE response INT;
            
            INSERT INTO documento(titulo,expediente,mencionResponsabilidad_id,fechaSuscripcion,descripfisica_id,notas_id,terminoPropuesto,ubicacion_id,responsable,autorInstitucional,terminoControlado,archivoAdjunto) VALUES(TRIM(_titulo),TRIM(_expediente),_mencionRespoID,TRIM(_fechaSuscripcion),_descripFisicaID,_notasID,TRIM(_terminoPropuesto),_ubicacionID,TRIM(_responsable),TRIM(_autorInstitucional),TRIM(_terminoControlado),TRIM(_archivoAdjunto));
            SET response = LAST_INSERT_ID();
            
            SELECT response;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_entidad` (`_nombre` VARCHAR(50))  BEGIN
        	DECLARE response INT;
            
        	INSERT INTO entidad(nombre) VALUES(TRIM(_nombre));
            SET response = LAST_INSERT_ID();
            
            SELECT response;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_notas` (`_objeto` VARCHAR(100), `_docVinculado` VARCHAR(150), `_notaContenido` VARCHAR(150), `_lugarRedaccion` VARCHAR(100), `_natuAlcanceForma` VARCHAR(100), `_vigencia` VARCHAR(80), `_numDecreto` VARCHAR(50), `_aprobadoLey` VARCHAR(50))  BEGIN
        	DECLARE response INT;
            
        	INSERT INTO notas(objeto,doc_vinculado,nota_contenido,lugar_redaccion,naturaleza_alcance_forma,vigencia,numero_decreto,aprobado_ley) VALUES(TRIM(_objeto),TRIM(_docVinculado),TRIM(_notaContenido),TRIM(_lugarRedaccion),TRIM(_natuAlcanceForma),TRIM(_vigencia),TRIM(_numDecreto),TRIM(_aprobadoLey));
            SET response = LAST_INSERT_ID();
            
            SELECT response;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_ubicacion` (IN `_carpeta` VARCHAR(20), IN `_folio` VARCHAR(20))  BEGIN
        	DECLARE response INT;
            
        	INSERT INTO ubicacion(carpeta,folio) VALUES(TRIM(_carpeta),TRIM(_folio));
            SET response = LAST_INSERT_ID();
            
            SELECT response;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_archivo` (`_id` INT)  BEGIN
        	SELECT archivoAdjunto FROM documento WHERE id=_id AND status = 1 LIMIT 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_autor` ()  BEGIN
        	SELECT id,CONCAT(nombre,' ',apellido) AS firmante FROM autor ORDER BY firmante ASC; 
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documento` (IN `_id` INT(11))  BEGIN
        	SELECT d.id AS documentoID, u.id AS ubicacionID, a.id AS autorID,t.id AS tituloID,t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio,fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia,terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto,institucion_id, i.nombre AS institucion, a.nombre AS nombreAutor, a.apellido AS apellidoAutor,carpeta,folio,responsable,archivoAdjunto 
		FROM documento d 
        INNER JOIN ubicacion u 
		ON d.ubicacion_id = u.id 
        INNER JOIN autor a 
		ON d.autor_id = a.id 
        INNER JOIN titulos t ON 
        d.titulo_id = t.id 
        INNER JOIN ministerio_educacion me ON 
        d.min_edu_id = me.id 
        INNER JOIN vigencia v ON 
        d.vigencia_id = v.id 
        INNER JOIN termino_controlado tc ON 
        d.terminoControlado_id = tc.id 
        INNER JOIN termino_propuesto tp ON 
        d.terminoPropuesto_id = tp.id 
        INNER JOIN institucion i ON 
        d.institucion_id = i.id
		WHERE d.id = _id
		AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos` ()  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor,t.id AS tituloID, t.nombre AS titulo, me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, tc.id AS idTerminoControlado, tc.nombre AS terminoControlado,tp.id AS idTerminoPrpuesto, tp.nombre AS terminoPropuesto,i.id idInstitucion, i.nombre AS institucion, CONCAT(a.nombre,', ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_autor` (IN `_autorID` INT)  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo, me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia,terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id 
    WHERE a.id = _autorID AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_fecha` (IN `_fecha` VARCHAR(60))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo, me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia,terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto,institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE d.fechaSuscripcion LIKE CONCAT('%',_fecha) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_fecha_autor` (IN `_fecha` VARCHAR(60), IN `_autorID` INT)  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (d.fechaSuscripcion LIKE CONCAT('%',_fecha) AND a.id = _autorID) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_fecha_inst` (IN `_fecha` VARCHAR(60), IN `_tipo` VARCHAR(150))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (d.fechaSuscripcion LIKE CONCAT('%',_fecha) AND i.nombre = _tipo) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_fecha_vigencia` (IN `_fecha` VARCHAR(60), IN `_vigencia` VARCHAR(60))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (d.fechaSuscripcion LIKE CONCAT('%',_fecha) AND v.nombre = _vigencia) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_fecha_vigencia_autor` (IN `_fecha` VARCHAR(60), IN `_vigencia` VARCHAR(60), IN `_autorID` INT)  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (d.fechaSuscripcion LIKE CONCAT('%',_fecha) AND v.nombre = _vigencia AND a.id = _autorID) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_fecha_vigencia_inst` (IN `_fecha` VARCHAR(60), IN `_vigencia` VARCHAR(60), IN `_tipo` VARCHAR(150))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (d.fechaSuscripcion LIKE CONCAT('%',_fecha) AND v.nombre = _vigencia AND i.nombre = _tipo) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_fecha_vigencia_inst_autor` (IN `_fecha` VARCHAR(60), IN `_vigencia` VARCHAR(60), IN `_tipo` VARCHAR(150), IN `_autorID` INT)  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (d.fechaSuscripcion LIKE CONCAT('%',_fecha) AND v.nombre = _vigencia AND i.nombre = _tipo AND a.id = _autorID) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_inst` (IN `_tipo` VARCHAR(150))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo, me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia,terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
	INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id 
    WHERE i.nombre = _tipo AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_inst_autor` (IN `_tipo` VARCHAR(150), IN `_autorID` INT)  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (i.nombre = _tipo AND a.id = _autorID) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_ministerio` (IN `_nombre` VARCHAR(200))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo, me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto,institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE me.nombre = _nombre AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_ministerio_autor` (IN `_ministerio` VARCHAR(200), IN `_autorID` INT)  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (me.nombre = _ministerio AND a.id = _autorID) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_ministerio_fecha` (IN `_ministerio` VARCHAR(200), IN `_fecha` VARCHAR(60))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (me.nombre = _ministerio AND d.fechaSuscripcion LIKE CONCAT('%',_fecha)) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_ministerio_fecha_autor` (IN `_ministerio` VARCHAR(200), IN `_fecha` VARCHAR(60), IN `_autorID` INT)  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (me.nombre = _ministerio AND d.fechaSuscripcion LIKE CONCAT('%',_fecha) AND a.id = _autorID) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_ministerio_fecha_inst` (IN `_ministerio` VARCHAR(200), IN `_fecha` VARCHAR(60), IN `_tipo` VARCHAR(150))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (me.nombre = _ministerio AND d.fechaSuscripcion LIKE CONCAT('%',_fecha) AND i.nombre = _tipo) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_ministerio_fecha_vigencia` (IN `_ministerio` VARCHAR(200), IN `_fecha` VARCHAR(60), IN `_vigencia` VARCHAR(60))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (me.nombre = _ministerio AND d.fechaSuscripcion LIKE CONCAT('%',_fecha) AND v.nombre = _vigencia) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_ministerio_fecha_vigencia_autor` (IN `_ministerio` VARCHAR(200), IN `_fecha` VARCHAR(60), IN `_vigencia` VARCHAR(60), IN `_autorID` INT)  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (me.nombre = _ministerio AND d.fechaSuscripcion LIKE CONCAT('%',_fecha) AND v.nombre = _vigencia AND a.id = _autorID) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_ministerio_fecha_vigencia_inst` (IN `_ministerio` VARCHAR(200), IN `_fecha` VARCHAR(60), IN `_vigencia` VARCHAR(60), IN `_tipo` VARCHAR(150))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (me.nombre = _ministerio AND d.fechaSuscripcion LIKE CONCAT('%',_fecha) AND v.nombre = _vigencia AND i.nombre = _tipo) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_ministerio_fecha_vigencia_inst_autor` (IN `_ministerio` VARCHAR(200), IN `_fecha` VARCHAR(60), IN `_vigencia` VARCHAR(60), IN `_tipo` VARCHAR(150), IN `_autorID` INT)  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (me.nombre = _ministerio AND d.fechaSuscripcion LIKE CONCAT('%',_fecha) AND v.nombre = _vigencia AND i.nombre = _tipo AND a.id = _autorID) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_ministerio_inst` (IN `_ministerio` VARCHAR(200), IN `_tipo` VARCHAR(150))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (me.nombre = _ministerio AND i.nombre = _tipo) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_ministerio_vigencia` (IN `_ministerio` VARCHAR(200), IN `_vigencia` VARCHAR(60))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (me.nombre = _ministerio AND v.nombre = _vigencia) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_titulo` (IN `_titulo` VARCHAR(255))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE t.nombre = _titulo AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_titulo_autor` (IN `_titulo` VARCHAR(200), IN `_autorID` INT)  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (t.nombre = _titulo AND a.id = _autorID) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_titulo_fecha` (IN `_titulo` VARCHAR(200), IN `_fecha` VARCHAR(60))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (t.nombre = _titulo AND d.fechaSuscripcion LIKE CONCAT('%',_fecha)) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_titulo_inst` (IN `_titulo` VARCHAR(200), IN `_tipo` VARCHAR(150))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (t.nombre = _titulo AND i.nombre = _tipo) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_titulo_ministerio` (IN `_titulo` VARCHAR(200), IN `_ministerio` VARCHAR(200))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (t.nombre = _titulo AND me.nombre = _ministerio) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_titulo_ministerio_autor` (IN `_titulo` VARCHAR(200), IN `_ministerio` VARCHAR(200), IN `_autorID` INT)  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (t.nombre = _titulo AND me.nombre = _ministerio AND a.id = _autorID) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_titulo_ministerio_fecha` (IN `_titulo` VARCHAR(200), IN `_ministerio` VARCHAR(200), IN `_fecha` VARCHAR(60))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (t.nombre = _titulo AND me.nombre = _ministerio AND d.fechaSuscripcion LIKE CONCAT('%',_fecha)) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_titulo_ministerio_fecha_autor` (IN `_titulo` VARCHAR(200), IN `_ministerio` VARCHAR(200), IN `_fecha` VARCHAR(60), IN `_autorID` INT)  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (t.nombre = _titulo AND me.nombre = _ministerio AND d.fechaSuscripcion LIKE CONCAT('%',_fecha) AND a.id = _autorID) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_titulo_ministerio_fecha_inst` (IN `_titulo` VARCHAR(200), IN `_ministerio` VARCHAR(200), IN `_fecha` VARCHAR(60), IN `_tipo` VARCHAR(150))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (t.nombre = _titulo AND me.nombre = _ministerio AND d.fechaSuscripcion LIKE CONCAT('%',_fecha) AND i.nombre = _tipo) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_titulo_ministerio_fecha_vigencia` (IN `_titulo` VARCHAR(200), IN `_ministerio` VARCHAR(200), IN `_fecha` VARCHAR(60), IN `_vigencia` VARCHAR(60))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (t.nombre = _titulo AND me.nombre = _ministerio AND d.fechaSuscripcion LIKE CONCAT('%',_fecha) AND v.nombre = _vigencia) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_titulo_ministerio_fecha_vigencia_autor` (IN `_titulo` VARCHAR(200), IN `_ministerio` VARCHAR(200), IN `_fecha` VARCHAR(60), IN `_vigencia` VARCHAR(60), IN `_autorID` INT)  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (t.nombre = _titulo AND me.nombre = _ministerio AND d.fechaSuscripcion LIKE CONCAT('%',_fecha) AND v.nombre = _vigencia AND a.id = _autorID) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_titulo_ministerio_fecha_vigencia_inst` (IN `_titulo` VARCHAR(200), IN `_ministerio` VARCHAR(200), IN `_fecha` VARCHAR(60), IN `_vigencia` VARCHAR(60), IN `_tipo` VARCHAR(150))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (t.nombre = _titulo AND me.nombre = _ministerio AND d.fechaSuscripcion LIKE CONCAT('%',_fecha) AND v.nombre = _vigencia AND i.nombre = _tipo) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_titulo_ministerio_inst` (IN `_titulo` VARCHAR(200), IN `_ministerio` VARCHAR(200), IN `_tipo` VARCHAR(150))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (t.nombre = _titulo AND me.nombre = _ministerio AND i.nombre = _tipo) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_titulo_ministerio_vigencia` (IN `_titulo` VARCHAR(200), IN `_ministerio` VARCHAR(200), IN `_vigencia` VARCHAR(60))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (t.nombre = _titulo AND me.nombre = _ministerio AND v.nombre = _vigencia) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_titulo_min_fecha_vigencia_inst_autor` (IN `_titulo` VARCHAR(200), IN `_ministerio` VARCHAR(200), IN `_fecha` VARCHAR(60), IN `_vigencia` VARCHAR(60), IN `_tipo` VARCHAR(150), IN `_autorID` INT)  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (t.nombre = _titulo AND me.nombre = _ministerio AND d.fechaSuscripcion LIKE CONCAT('%',_fecha) AND v.nombre = _vigencia AND i.nombre = _tipo AND a.id = _autorID) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_titulo_vigencia` (IN `_titulo` VARCHAR(200), IN `_vigencia` VARCHAR(60))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (t.nombre = _titulo AND v.nombre = _vigencia) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_vigencia` (IN `_nombre` VARCHAR(40))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo, me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto,institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE v.nombre = _nombre AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_vigencia_autor` (IN `_vigencia` VARCHAR(60), IN `_autorID` INT)  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (v.nombre = _vigencia AND a.id = _autorID) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_vigencia_inst` (IN `_vigencia` VARCHAR(60), IN `_tipo` VARCHAR(150))  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (v.nombre = _vigencia AND i.nombre = _tipo) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_documentos_vigencia_inst_autor` (IN `_vigencia` VARCHAR(60), IN `_tipo` VARCHAR(150), IN `_autorID` INT)  BEGIN
        	SELECT d.id AS idDocumento, u.id AS idUbicacion, a.id AS idAutor, t.id AS tituloID, t.nombre AS titulo,me.id AS meID, me.nombre AS ministerio, d.fechaSuscripcion,v.id AS vigenciaID, v.nombre AS vigencia, terminoControlado_id, tc.nombre AS terminoControlado,terminoPropuesto_id, tp.nombre AS terminoPropuesto, institucion_id, i.nombre AS institucion, CONCAT(a.nombre,' ',a.apellido) AS autor, CONCAT_WS(' ', u.carpeta, u.folio) AS ubicacion, d.archivoAdjunto, d.responsable 
    FROM documento d 
    INNER JOIN ubicacion u 
    ON d.ubicacion_id = u.id 
    INNER JOIN autor a 
    ON d.autor_id = a.id 
    INNER JOIN titulos t ON 
    d.titulo_id = t.id 
    INNER JOIN ministerio_educacion me ON 
    d.min_edu_id = me.id 
    INNER JOIN vigencia v ON 
    d.vigencia_id = v.id 
    INNER JOIN termino_controlado tc ON 
    d.terminoControlado_id = tc.id 
    INNER JOIN termino_propuesto tp ON 
    d.terminoPropuesto_id = tp.id 
    INNER JOIN institucion i ON 
    d.institucion_id = i.id
    WHERE (v.nombre = _vigencia AND i.nombre = _tipo, a.id = _autorID) AND d.status = 1;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_inst` ()  BEGIN
        	SELECT nombre FROM institucion ORDER BY nombre ASC;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_ministerio` ()  BEGIN
        	SELECT nombre FROM ministerio_educacion ORDER BY nombre ASC;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_name_autor` (IN `_id` INT)  BEGIN
        	SELECT CONCAT(nombre,' ',apellido) AS nombre FROM autor WHERE id = _id LIMIT 1;
		END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_titulos` ()  BEGIN
        	SELECT nombre FROM titulos ORDER BY nombre ASC;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_select_vigencia` ()  BEGIN
        	SELECT nombre FROM vigencia ORDER BY nombre ASC;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_archivo` (`_id` INT, `_archivo` VARCHAR(255))  BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_autor` (`_id` INT, `_nombre` VARCHAR(60), `_apellido` VARCHAR(60))  BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_descripFisica` (`_id` INT, `_numPag` VARCHAR(10), `_numHojas` VARCHAR(10), `_formato` VARCHAR(10), `_otros` VARCHAR(80))  BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_documento` (IN `_id` INT, IN `_titulo` VARCHAR(255), IN `_expediente` VARCHAR(100), IN `_fechaSuscripcion` VARCHAR(60), IN `_terminoPropuesto` VARCHAR(200), IN `_responsable` VARCHAR(150), IN `_autorInstitucional` VARCHAR(255), IN `_terminoControlado` VARCHAR(255))  BEGIN
        	DECLARE existe_documento INT;
        	DECLARE response INT;
            SET existe_documento = (SELECT COUNT(id) FROM documento WHERE id=_id AND status = 1 LIMIT 1);
            
            IF existe_documento > 0 THEN
            	UPDATE documento SET titulo=_titulo,expediente=_expediente,fechaSuscripcion=_fechaSuscripcion,terminoPropuesto=_terminoPropuesto,responsable=_responsable,autorInstitucional=_autorInstitucional,terminoControlado=_terminoControlado WHERE id=_id;
                SET response = 1;
            ELSE
            	SET response = 0;
            END IF;
            SELECT response;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_entidad` (`_id` INT, `_nombre` VARCHAR(60))  BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_notas` (`_id` INT, `_objeto` VARCHAR(150), `_docVinculado` VARCHAR(150), `_notaContenido` VARCHAR(150), `_lugarRedaccion` VARCHAR(150), `_natuAlcanceForma` VARCHAR(150), `_vigencia` VARCHAR(50), `_numDecreto` VARCHAR(50), `_aprobadoLey` VARCHAR(50))  BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_ubicacion` (`_id` INT, `_carpeta` VARCHAR(20), `_folio` VARCHAR(20))  BEGIN
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
(1, 'De Los Ríos', 'Felipe Tadeo'),
(2, 'Nasisi', 'Oscar'),
(3, 'Larrea', 'Claudio Marcelo'),
(4, 'Savall', 'Leonardo'),
(5, 'Sánchez', 'Ana Cristina'),
(6, 'Bernat Gigantino', 'Jorge E.'),
(7, 'Gómez Centurion', 'Carlos'),
(8, 'Martín', 'Pedro Luis'),
(9, 'Cuadros', 'Oscar'),
(10, 'Bullrich', 'Esteban José'),
(11, 'Uñac', 'Sergio'),
(12, 'Gulmanelli', 'Max'),
(13, 'Del Bono', 'Tulio'),
(14, 'Ceccatto', 'Alejandro'),
(15, 'D\'Anna', 'Eduardo'),
(16, 'Díaz Cano', 'Andrés'),
(17, 'Ubiler Zabala', 'Juan'),
(18, 'Aballay', 'Nestor Fabián'),
(19, 'Esteve', 'José Luis'),
(20, 'Quadri', 'Flavio A.'),
(21, 'Sánchez Zinny', 'Gabriel'),
(22, 'Tello', 'Domingo Raúl'),
(23, 'Gattoni', 'Roberto'),
(24, 'Finnochiaro', 'Alejandro Oscar'),
(25, 'Canedo Peña', 'Juan Martín'),
(26, 'Franzetti', 'Carlos Daniel'),
(27, 'Gandara', 'Gustavo Adrián'),
(28, 'Llorente', 'Ricardo Oscar'),
(29, 'Hensel', 'Alberto V.'),
(30, 'Pallarols', 'Juan Carlos'),
(31, 'Gómez', 'Gustavo Roberto'),
(32, 'Bloch', 'Rodolfo'),
(33, 'Gsponer', 'Analía Daniela'),
(34, 'Chica', 'Jorge Eduardo'),
(35, 'Sánchez', 'Armando'),
(36, 'Almadoz', 'María Rosa'),
(37, 'Díaz', 'Maria Castro'),
(38, 'Schneider', 'Judith'),
(39, 'Aranda', 'Franco'),
(40, 'Zapata', 'Gerónimo javier'),
(41, 'Sánchez Hidalgo', 'Cástor'),
(42, 'Allende', 'Walberto Enrique'),
(43, 'Sileoni', 'Alberto Estanislao'),
(44, 'García', 'Alicia'),
(45, 'Arangundi', 'Eduardo'),
(46, 'Rapp García', 'Jorge'),
(47, 'Ameigeiras', 'Tomás'),
(48, 'Lecich', 'María Inés'),
(49, 'Gioja', 'Juan Carlos'),
(50, 'Ponte', 'Miguel Ángel'),
(51, 'Fretes', 'Guillermo'),
(52, 'Giannoni', 'Fernando'),
(53, 'Daneri', 'Jimena'),
(54, 'Fernández', 'Daniel Eduardo'),
(55, 'Orihuela', 'Julio Cesar'),
(56, 'Castro', 'José'),
(57, 'Lima', 'Marcelo Jorge'),
(58, 'Garbarino', 'Ana Rosa');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `id` int(11) NOT NULL,
  `titulo_id` int(11) NOT NULL,
  `min_edu_id` int(11) NOT NULL,
  `fechaSuscripcion` varchar(60) NOT NULL,
  `vigencia_id` int(11) DEFAULT NULL,
  `terminoPropuesto_id` int(11) NOT NULL,
  `terminoControlado_id` int(11) NOT NULL,
  `institucion_id` int(11) DEFAULT NULL,
  `autor_id` int(11) DEFAULT NULL,
  `ubicacion_id` int(11) NOT NULL,
  `responsable` varchar(60) DEFAULT NULL,
  `archivoAdjunto` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`id`, `titulo_id`, `min_edu_id`, `fechaSuscripcion`, `vigencia_id`, `terminoPropuesto_id`, `terminoControlado_id`, `institucion_id`, `autor_id`, `ubicacion_id`, `responsable`, `archivoAdjunto`, `status`) VALUES
(1, 1, 1, '2016', 2, 3, 9, 1, 1, 1, NULL, NULL, 1),
(2, 1, 1, '2016', 2, 3, 9, 2, 1, 2, NULL, NULL, 1),
(3, 1, 1, '2016', 2, 3, 9, 3, 1, 3, NULL, NULL, 1),
(4, 1, 1, '2016', 2, 3, 9, 4, 1, 4, NULL, NULL, 1),
(5, 1, 1, '2016', 2, 3, 9, 5, 1, 5, NULL, NULL, 1),
(6, 1, 1, '2016', 2, 3, 9, 6, 1, 6, NULL, NULL, 1);

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
(77, 'odit nihil consectetur'),
(78, 'consequuntur voluptatem placeat'),
(79, 'possimus assumenda error veritatis'),
(80, 'sit amet consectetur adipisicing elit');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucion`
--

CREATE TABLE `institucion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `institucion`
--

INSERT INTO `institucion` (`id`, `nombre`) VALUES
(1, 'Municipalidad de Caucete. San Juan'),
(2, 'Municipalidad de Valle Fértil. San Juan'),
(3, 'Municipalidad de Capital. San Juan'),
(4, 'Municipalidad de Zonda. San Juan'),
(5, 'Municipalidad de Sarmiento. San Juan'),
(6, 'Municipalidad de 25 de Mayo. San Juan'),
(7, 'Municipalidad de 9 de Julio. San Juan'),
(8, 'Municipalidad de Jachal. San Juan'),
(9, 'Municipalidad de Iglesia. San Juan'),
(10, 'Universidad Católica de Cuyo. San Luis');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ministerio_educacion`
--

CREATE TABLE `ministerio_educacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ministerio_educacion`
--

INSERT INTO `ministerio_educacion` (`id`, `nombre`) VALUES
(1, 'Ministerio de Educación de San Juan'),
(2, 'Universidad Nacional de San Juan. San Juan'),
(3, 'Universidad Católica de Cuyo'),
(4, 'Universidad Católica de Cuyo. Facultad de Ciencias Económicas'),
(5, 'Universidad Católica de Cuyo. Facultad de Filosofía y Humanidades'),
(6, 'Universidad Católica de Cuyo. Facultad de Educación'),
(7, 'Gobierno de la provincia de San Juan'),
(8, 'Poder Ejecutivo Provincial. San Juan'),
(9, 'Universidad Católica de Cuyo. Facultad de Derecho y Ciencias Sociales'),
(10, 'Ciudad Autónoma de Buenos Aires. Ministerio de Educación'),
(11, 'Ciudad Autónoma de Buenos Aires. Ministerio de Educación y Deportes'),
(12, 'Secretaría de Estado de Ciencia, Tecnología e Innovación. San Juan '),
(13, 'Ciudad Autónoma de Buenos Aires. Consejo Nacional de Investigaciones Cientificas y Técnicas'),
(14, 'La Agencia Calidad San Juan S.E.M.'),
(15, 'Ciudad Autónoma de Buenos Aires. Ministerio de Educación y Deportes de la Nación'),
(16, 'Ministerio de Producción y Desarrollo Económico de San Juan'),
(17, 'Municipalidad de Pocito. San Juan'),
(18, 'Honorable Consejo Deliberante de Pocito. San Juan'),
(19, 'Ciudad Autónoma de Buenos Aires. Instituto Nacional de Educación Técnologica del Ministerio de Educación y Deportes de la Nación (INET)'),
(20, 'Cámara de Diputados de la provincia de San Juan'),
(21, 'Secretaría de Estado de Ambiente y Desarrollo Sustentable'),
(22, 'NO TIENE DOCUMENTACIÓN'),
(23, 'Ciudad Autónoma de Buenos Aires. Ministerio de Cultura, Ciencia y Tecnología'),
(24, 'Ciudad Autónoma de Buenos Aires. Instituto de Estadística y Registro de la Industria de la Construcción'),
(25, 'Ciudad Autónoma de Buenos Aires. Fundación UOCRA para la Educación de los Trabajadores Constructores'),
(26, 'Rotary International. Rotary de la provincia de San Juan'),
(27, 'Distrito 4851 de Rotary International'),
(28, 'Ministerio de Minería de San Juan'),
(29, 'Universidad Nacional de San Juan. Facultad de Arquitectura, Urbanismo y Diseño'),
(30, 'Universidad Nacional de San Juan. Facultad de Ciencias Exactas, Físicas y Naturales'),
(31, 'Distribuidora de Gas del Centro SA. San Juan'),
(32, 'Secretaría de Estado de Deporte'),
(33, 'Ministerio de Desarrollo Humano y Promoción social de San Juan'),
(34, 'Fundación Formación de Ambiente Interno'),
(35, 'Municipalidad de la Ciudad de San Juan. San Juan'),
(36, 'Ciudad Autónoma de Buenos Aires. Ministerio de Educación, Cultura, Ciencia y Tecnología'),
(37, 'Secretaría de Deportes de San Juan'),
(38, 'Asociación Sanjuanina de Hockey sobre Césped y Pista'),
(39, 'Secretaría de Estado de Deportes'),
(40, 'Ministerio de Salud Pública de San Juan'),
(41, 'Ciudad Autónoma de Buenos Aires. Instituto Nacional de Educación Técnologica del Ministerio de Educación de la Nación'),
(42, 'Ciudad Autónoma de Buenos Aires. Caja Complementaria de Previsión para la Actividad Docente'),
(43, 'Ministerio de Hacienda y Finanzas de San Juan'),
(44, 'Ministerio de Ciencia, Tecnología e Innovación Productiva'),
(45, 'Centro de Ingenieros de San Juan'),
(46, 'Municipalidad de Rawson. San Juan'),
(47, 'Ciudad Autónoma de Buenos Aires. Secretaría de Empleo'),
(48, 'Ciudad Autónoma de Buenos Aires. EDUC. AR Sociedad del Estado'),
(49, 'Empresa Minera Argentina Gold'),
(50, 'Barrick Exploraciones Argentina.'),
(51, 'Sol Frut'),
(52, 'Defensoría del Pueblo de San Juan'),
(53, 'Municipalidad de Angaco. San Juan'),
(54, 'Escuela Isla Vice Comodoro Marambio. San Juan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `objeto` varchar(150) DEFAULT NULL,
  `doc_vinculado` varchar(150) DEFAULT NULL,
  `nota_contenido` varchar(150) DEFAULT NULL,
  `lugar_redaccion` varchar(150) DEFAULT NULL,
  `naturaleza_alcance_forma` varchar(150) DEFAULT NULL,
  `numero_decreto` varchar(50) DEFAULT NULL,
  `aprobado_ley` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `termino_controlado`
--

CREATE TABLE `termino_controlado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `termino_controlado`
--

INSERT INTO `termino_controlado` (`id`, `nombre`) VALUES
(1, 'BIENES - CESIÓN'),
(2, 'CONSTRUCCIÓN'),
(3, 'DEPORTES - INSTALACIONES'),
(4, 'EDIFICIOS PARA LA ENSEÑANZA'),
(5, 'EDUCACIÓN'),
(6, 'EDUCACIÓN DE ADULTOS'),
(7, 'ENSEÑANZA PROFESIONAL'),
(8, 'FINANZAS'),
(9, 'POLÍTICA AGRARIA'),
(10, 'POLÍTICA ECONÓMICA'),
(11, 'POLÍTICA EDUCATIVA'),
(12, 'SALUD'),
(13, 'TECNOLOGÍA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `termino_propuesto`
--

CREATE TABLE `termino_propuesto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `termino_propuesto`
--

INSERT INTO `termino_propuesto` (`id`, `nombre`) VALUES
(1, 'ACTUALIZACIÓN PROFESIONAL'),
(2, 'ADMINISTRACIÓN DE FONDOS'),
(3, 'AGROINDUSTRIA'),
(4, 'ASISTENCIA'),
(5, 'ASTRONOMÍA'),
(6, 'CALIDAD EDUCATIVA'),
(7, 'CENS'),
(8, 'CENTRO DEPORTIVO'),
(9, 'CENTROS DE ACTIVIDADES JUVENILES (CAJ)'),
(10, 'CONSTRUNCCIÓN ESTABLECIMIENTOS ESCOLARES NIVEL INICIAL'),
(11, 'COOPERACIÓN EDUCATIVA'),
(12, 'COOPERACIÓN INTERINSTITUCIONAL'),
(13, 'CREACIÓN INSTITUTO'),
(14, 'DEUDA PÚBLICA'),
(15, 'EDIFICIOS PARA LA ENSEÑANZA'),
(16, 'EDUCACIÓN AMBIENTAL'),
(17, 'EMPRENDEDURISMO'),
(18, 'FINANCIAMIENTO DE INSUMOS'),
(19, 'FUNDACIÓN FAI'),
(20, 'HOCKEY'),
(21, 'LEY'),
(22, 'MAESTRÍA'),
(23, 'NIVEL INICIAL'),
(24, 'NIVEL SUPERIOR'),
(25, 'PASANTÍAS'),
(26, 'PLAN APRENDER CONECTADOS'),
(27, 'PLAN FINES'),
(28, 'PLAN NACIONAL DE CONECTIVIDAD ESCOLAR'),
(29, 'PRÁCTICAS PRE PROFESIONALES'),
(30, 'PREMIOS'),
(31, 'PROGRAMA ARQUITECTURA Y COMUNIDAD'),
(32, 'PROGRAMA ASISTIRÉ'),
(33, 'PROGRAMA EN FORMACIÓN CONTINUA EN EDUCACIÓN TÉCNICO PROFESIONAL (ENFOCOETP)'),
(34, 'PROGRAMAS ESCUELAS DEL FUTURO'),
(35, 'PROGRAMA INVESTIGAS CONCIENCIA 2019'),
(36, 'PROGRAMA NACIONAL DE EXTENSIÓN EDUCATIVA'),
(37, 'PROYECTO BANDERA DE LA PAZ'),
(38, 'PROYECTO CENTRO DE ACTIVIDADES INFANTILES'),
(39, 'PROYECTO INFINITO POR DESCUBRIR'),
(40, 'RECURSOS FINANCIEROS'),
(41, 'REDISTRIBUCIÓN DE FONDOS'),
(42, 'REUNIÓN ADMINISTRATIVA'),
(43, 'ROTARY INTERNATIONAL'),
(44, 'SUBSIDIOS'),
(45, 'SUM'),
(46, 'SUSTITUCIÓN EDILICIA'),
(47, 'TECNOLOGÍA'),
(48, 'TRANSFERENCIA DE BIENES MUEBLES'),
(49, 'TRANSMISIÓN DOMINIAL'),
(50, 'TRASLADO DE ALUMNOS'),
(51, 'TUTORÍAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulos`
--

CREATE TABLE `titulos` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `titulos`
--

INSERT INTO `titulos` (`id`, `nombre`) VALUES
(1, 'Convenio Marco de Cooperación'),
(2, 'Convenio especifico entre el Ministerio de Educación de la Provincia de San Juan y la Universidad Católica de Cuyo sede San Luis'),
(3, 'Adenda al acta complementaria entre el Gobierno de la Provincia de San Juan - Ministerio de Educación - Universidad Nacional de San Juan - Universidad Católica de Cuyo'),
(4, 'Acta complementaria de convenio marco de cooperación entre la Universidad Católica de Cuyo y el Ministerio de Educación de la Provincia de San Juan'),
(5, 'Acta complementaria Ministerio de la Provincia de San Juan y Facultad de Educación'),
(6, 'Convenio Marco'),
(7, 'Decreto'),
(8, 'Proyecto de transferencia'),
(9, 'Convenio Bilateral'),
(10, 'Convenio bilateral para disposición de fondos'),
(11, 'Convenio de cooperación educativa'),
(12, 'Acta complementaria N°1'),
(13, 'Acta complementaria N°5'),
(14, 'Convenio de cooperación y asistencia'),
(15, 'Nota N°34 DEST y FP-16-'),
(16, 'Convenio de asistencia educativa'),
(17, 'Ordenanza N°5147-2016'),
(18, 'Convenio bilateral entre el Ministerio de Educación y Deportes y la Provincia de San Juan'),
(19, 'Convenio de cooperación institucional y asistencia técnica entre el Ministerio de Educación y Deporte de la Nación y el Ministerio de Educación de la Provincia de San Juan'),
(20, 'Acta complementaria N°1141/11'),
(21, 'Acta modificatoria del Acta complementaria N°1141/12'),
(22, 'Acta modificatoria del Acta complementaria N°1141/12 del Convenio marco de cooperación N°837/05'),
(23, 'Acta modificatoria'),
(24, 'Decreto N°0191'),
(25, 'Ley N°2097-H'),
(26, 'Convenio \"Programa Asistiré\"'),
(27, 'Convenio de cooperación y fortalecimiento institucional entre el Instituto de Estadística y Registro de la Industria de la Construcción, el Ministerio de Educación de la Provincia de San Juan y la Fundación UOCRA para la Educación de los Trabajadores Constructores'),
(28, 'Anexo I'),
(29, 'Cooperación marco de asistencia y cooperación mutua de carácter general y amplio entre el Gobierno de la Provicia de San Juan y Rotary Club de la Provincia de San Juan de Rotary International'),
(30, 'Acta complementaria entre el Ministerio de Educación de la Provincia de San Juan y el Distrito 4851 de Rotary International'),
(31, 'Convenio marco de colaboración y asistencia para la creación del Instituto de Joyería, Orfebrería y Gemología de la Provincia de San Juan, entre el Ministerio de Minería, Ministerio de Educación y el sr. Juan Carlos Pallarols'),
(32, 'Convenio minería'),
(33, 'Convenio especifico entre el Ministerio de Educación de la Provincia y la Facultad de Arquitectura, Urbanismo y Diseño (FAUD) de la Universidad Nacional de San Juan (UNSJ)'),
(34, 'Acta complementaria (1)'),
(35, 'Acta complementaria entre el Ministerio de Educación de la Provincia de San Juan y la Facultad de Arquitectura, Urbanismo y Diseño de la Universidad Nacional de San Juan'),
(36, 'Acta complementaria entre la Secretaría de Estado de Ciencia, Tecnología e Innovación y el Ministerio de Educación de la provincia de San Juan y la Universidad Nacional de San Juan'),
(37, 'Convenio de colaboración'),
(38, 'Resolución conjunta N°1960 ME N°0282-SD-(2017,mar,27)'),
(39, 'Ratificación de convenio'),
(40, 'Convenio de marco de colaboracion'),
(41, 'Trigesimmo segundo protocolo adicional del convenio marco de cooperación'),
(42, 'Convenio de transferencia'),
(43, 'Convenio de cooperación institucional y asistencia técnica entre el Ministerio de Educación, Cultura, Ciencia y Tecnología de la Nación y el Ministerio de Educación de la Provincia de San Juan'),
(44, 'Acta complementaria del Convenio Marco de Cooperación'),
(45, 'Convenio de colaboración. Concurso alumnos solidarios'),
(46, 'Convenio de colaboración entre el Ministeriod de Educación, Cultura, Ciencia y Tecnología de la Nación y el Ministerio de Educación de la Provincia de San Juan para la implementación del Programa \"Asistiré\"'),
(47, 'Anexo II'),
(48, 'Convenio de asistencia y cooperación entre el Ministerio de Educación de la Provincia de San Juan y la Secretaría de Deportes de la Provincia de San Juan'),
(49, 'Acta complementaria'),
(50, 'Acta complementaria al convenio marco entre el Ministerio de Educación de la Provincia de San Juan y la Secretaria de Estado de Deportes de la Provincia de San Juan'),
(51, 'Convenio de asistencia y cooperación'),
(52, 'Decreto N°0405-ME-'),
(53, 'Decreto N°0362-ME-'),
(54, 'Convenio sobre ejecución de obra de infraestructura edilicia entre el Instituto Nacional de Educación Técnologica del Ministerio de Educación de la Nación y el Ministerio de Educación  de la Provincia de San Juan'),
(55, 'Modelo de convenio de pago'),
(56, 'Convenio de subvención'),
(57, 'Convenio de cooperación, capacitación y promoción productiva entre el Ministerio de Minería, el Ministerio de Educación y la Municipalidad de Rawson'),
(58, 'Protocolo adicional N°2/16 entre la Secretaría de Empleo y el Ministerio de Educación de la Provincia de San Juan, en el Marco del convenio N°30/16 entre el Ministerio de Trabajo, Empleo y Seguridad Social de la Nación y el Gobierno de la Provincia de San Juan'),
(59, 'Protocolo adicional N°3/17 entre la Secretaría de Empleo y el Ministerio de Educación de la Provincia de San Juan, en el Marco del convenio N°30/16 entre el Ministerio de Trabajo, Empleo y Seguridad Social de la Nación y el Gobierno de la Provincia de San Juan'),
(60, 'Acta complementaria N°1 al convenio marco de colaboración entre la Provincia de San Juan y EDUC.AR Sociedad del Estado'),
(61, 'Acta complementaria N°2 al convenio marco entre EDUC.AR Sociedad del Estado y al Provincia de San Juan \"Plan Nacional de Conectividad Escolar\"'),
(62, 'Acta complementaria N°3 del convenio específico entre EDUC.AR Sociedad del Estado y al Provincia de San Juan'),
(63, 'Convenio multilateral'),
(64, 'Acta complementaria N°1 del convenio marco multilateral de cooperación (Programa Cisco Networking Academy)'),
(65, 'Acta complementaria N°1 al convenio de colaboración y cooperación para la implementación del Plan FinEs'),
(66, 'Acta complementaria N°2 del convenio marco multilateral de cooperación (Plan Finalización de Estudios Primarios y Secundarios para Jovenes y Adultos - Plan FinEs'),
(67, 'Convenio de complementación tecnologíca entre el Ministerio de Educación de la Provincia de San Juan y la defensoría del Pueblo de San Juan'),
(68, 'Convenio marco de asistencia y cooperación multilateral '),
(69, 'Convenio de colaboración entre la Municipalidad de Angaco y la Escuela Isla Vice Comodoro Marambio'),
(70, 'Acta complementaria de Convenios marco entre el Gobierno de la Provincia de San Juan, Universidad Nacional de San Juan y Universidad Católica de Cuyo'),
(71, 'Acta 01'),
(72, 'Modelo de acta intención');

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
(1, 'C1', 'F1'),
(2, 'C1', 'F2'),
(3, 'C1', 'F3'),
(4, 'C1', 'F4'),
(5, 'C1', 'F5'),
(6, 'C1', 'F6'),
(7, 'C1', 'F7'),
(8, 'C1', 'F8'),
(9, 'C1', 'F9'),
(10, 'C1', 'F10'),
(11, 'C1', 'F11'),
(12, 'C1', 'F12'),
(13, 'C1', 'F13'),
(14, 'C1', 'F14'),
(15, 'C1', 'F15'),
(16, 'C1', 'F16'),
(17, 'C1', 'F17'),
(18, 'C1', 'F18'),
(19, 'C1', 'F19'),
(20, 'C1', 'F20'),
(21, 'C1', 'F21'),
(22, 'C1', 'F22'),
(23, 'C1', 'F23'),
(24, 'C1', 'F24'),
(25, 'C1', 'F25'),
(26, 'C1', 'F26'),
(27, 'C1', 'F27'),
(28, 'C1', 'F28'),
(29, 'C1', 'F29'),
(30, 'C1', 'F30'),
(31, 'C1', 'F31'),
(32, 'C1', 'F32'),
(33, 'C1', 'F33'),
(34, 'C1', 'F34'),
(35, 'C1', 'F35'),
(36, 'C1', 'F36'),
(37, 'C1', 'F37'),
(38, 'C1', 'F38'),
(39, 'C1', 'F39'),
(40, 'C1', 'F40'),
(41, 'C1', 'F41'),
(42, 'C1', 'F42'),
(43, 'C1', 'F43'),
(44, 'C1', 'F44'),
(45, 'C1', 'F45'),
(46, 'C1', 'F46'),
(47, 'C1', 'F47'),
(48, 'C1', 'F48'),
(49, 'C1', 'F49'),
(50, 'C1', 'F50'),
(51, 'C1', 'F51'),
(52, 'C1', 'F52'),
(53, 'C1', 'F53'),
(54, 'C1', 'F54'),
(55, 'C1', 'F55'),
(56, 'C1', 'F56'),
(57, 'C1', 'F57'),
(58, 'C1', 'F58'),
(59, 'C1', 'F59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vigencia`
--

CREATE TABLE `vigencia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vigencia`
--

INSERT INTO `vigencia` (`id`, `nombre`) VALUES
(1, 'Vigente'),
(2, 'Sin vigencia');

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
  ADD KEY `documento_ibfk_3` (`ubicacion_id`),
  ADD KEY `titulo_id` (`titulo_id`),
  ADD KEY `min_edu_id` (`min_edu_id`),
  ADD KEY `vigencia_id` (`vigencia_id`),
  ADD KEY `terminoPropuesto_id` (`terminoPropuesto_id`),
  ADD KEY `terminoControlado_id` (`terminoControlado_id`),
  ADD KEY `tipoDocumento_id` (`institucion_id`),
  ADD KEY `autor_id` (`autor_id`);

--
-- Indices de la tabla `entidad`
--
ALTER TABLE `entidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ministerio_educacion`
--
ALTER TABLE `ministerio_educacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `termino_controlado`
--
ALTER TABLE `termino_controlado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `termino_propuesto`
--
ALTER TABLE `termino_propuesto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `titulos`
--
ALTER TABLE `titulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vigencia`
--
ALTER TABLE `vigencia`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `descripfisica`
--
ALTER TABLE `descripfisica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `entidad`
--
ALTER TABLE `entidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `institucion`
--
ALTER TABLE `institucion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ministerio_educacion`
--
ALTER TABLE `ministerio_educacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `termino_controlado`
--
ALTER TABLE `termino_controlado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `termino_propuesto`
--
ALTER TABLE `termino_propuesto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `titulos`
--
ALTER TABLE `titulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `vigencia`
--
ALTER TABLE `vigencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `documento`
--
ALTER TABLE `documento`
  ADD CONSTRAINT `documento_ibfk_10` FOREIGN KEY (`institucion_id`) REFERENCES `institucion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `documento_ibfk_11` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `documento_ibfk_3` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `documento_ibfk_5` FOREIGN KEY (`titulo_id`) REFERENCES `titulos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `documento_ibfk_6` FOREIGN KEY (`min_edu_id`) REFERENCES `ministerio_educacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `documento_ibfk_7` FOREIGN KEY (`vigencia_id`) REFERENCES `vigencia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `documento_ibfk_8` FOREIGN KEY (`terminoPropuesto_id`) REFERENCES `termino_propuesto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `documento_ibfk_9` FOREIGN KEY (`terminoControlado_id`) REFERENCES `termino_controlado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
