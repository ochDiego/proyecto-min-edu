<?php

    class DocumentoModel
    {
        private $db;

        public function __construct()
        {
            $this->db = Database::conectar();
        }

        public function getDocumentos()
        {
            $sentencia=$this->db->query("CALL sp_select_documentos()");
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumento($id)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documento(?)");
            $sentencia->bindParam(1,$id);
            $sentencia->execute();
            $response=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $response;
        }

        public function existeTitulo($titulo)
        {
            $sentencia=$this->db->prepare("CALL sp_existe_titulo(?)");
            $sentencia->bindParam(1,$titulo);
            $sentencia->execute();
            $response=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $response['response'];
        }

        public function existeExpediente($expediente)
        {
            $sentencia=$this->db->prepare("CALL sp_existe_expediente(?)");
            $sentencia->bindParam(1,$expediente);
            $sentencia->execute();
            $response=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $response['response'];
        }

        public function existeFechaSuscrip($fechaSuscrip)
        {
            $sentencia=$this->db->prepare("CALL sp_existe_fechaSuscripcion(?)");
            $sentencia->bindParam(1,$fechaSuscrip);
            $sentencia->execute();
            $response=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $response['response'];
        }

        public function insertAutor($nombre,$apellido)
        {
            $sentencia=$this->db->prepare("CALL sp_insert_autor(?,?)");
            $sentencia->bindParam(1,$nombre);
            $sentencia->bindParam(2,$apellido);
            $sentencia->execute();
            $idInsert=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $idInsert['response'];
        }

        public function insertEntidad($nombre)
        {
            $sentencia=$this->db->prepare("CALL sp_insert_entidad(?)");
            $sentencia->bindParam(1,$nombre);
            $sentencia->execute();
            $idInsert=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $idInsert['response'];
        }

        public function insertMencionResp($autorID,$entidadID)
        {
            $sentencia=$this->db->prepare("CALL sp_insert_mencionResponsabilidad(?,?)");
            $sentencia->bindParam(1,$autorID);
            $sentencia->bindParam(2,$entidadID);
            $sentencia->execute();
            $idInsert=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $idInsert['response'];
        }

        public function insertNotas($objeto,$docVinculado,$notaContenido,$lugarRedaccion,$natuAlcanceForma,$vigencia,$numDecreto,$aprobadoLey)
        {
            $sentencia=$this->db->prepare("CALL sp_insert_notas(?,?,?,?,?,?,?,?)");
            $sentencia->bindParam(1,$objeto);
            $sentencia->bindParam(2,$docVinculado);
            $sentencia->bindParam(3,$notaContenido);
            $sentencia->bindParam(4,$lugarRedaccion);
            $sentencia->bindParam(5,$natuAlcanceForma);
            $sentencia->bindParam(6,$vigencia);
            $sentencia->bindParam(7,$numDecreto);
            $sentencia->bindParam(8,$aprobadoLey);
            $sentencia->execute();
            $idInsert=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $idInsert['response'];
        }

        public function insertUbicacion($carpeta,$folio)
        {
            $sentencia=$this->db->prepare("CALL sp_insert_ubicacion(?,?)");
            $sentencia->bindParam(1,$carpeta);
            $sentencia->bindParam(2,$folio);
            $sentencia->execute();
            $idInsert=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $idInsert['response'];
        }

        public function insertDescripFisica($numPag,$numHojas,$formato,$otros)
        {
            $sentencia=$this->db->prepare("CALL sp_insert_descripFisica(?,?,?,?)");
            $sentencia->bindParam(1,$numPag);
            $sentencia->bindParam(2,$numHojas);
            $sentencia->bindParam(3,$formato);
            $sentencia->bindParam(4,$otros);
            $sentencia->execute();
            $idInsert=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $idInsert['response'];
        }

        public function insertDocumento($titulo,$expediente,$mencionRespID,$fechaSuscrip,$descripFisicaID,$notasID,$terminoPropuesto,$ubicacionID,$responsable,$archivoAdjunto)
        {
            $sentencia=$this->db->prepare("CALL sp_insert_documento(?,?,?,?,?,?,?,?,?,?)");
            $sentencia->bindParam(1,$titulo);
            $sentencia->bindParam(2,$expediente);
            $sentencia->bindParam(3,$mencionRespID);
            $sentencia->bindParam(4,$fechaSuscrip);
            $sentencia->bindParam(5,$descripFisicaID);
            $sentencia->bindParam(6,$notasID);
            $sentencia->bindParam(7,$terminoPropuesto);
            $sentencia->bindParam(8,$ubicacionID);
            $sentencia->bindParam(9,$responsable);
            $sentencia->bindParam(10,$archivoAdjunto);
            $sentencia->execute();
            $idInsert=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $idInsert['response'];
        }

        public function deleteDocumento($id)
        {
            $sentencia=$this->db->prepare("CALL sp_delete_documento(?)");
            $sentencia->bindParam(1,$id);
            $sentencia->execute();
            $response=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $response['response'];
        }
    }