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

        public function getArchivo($id)
        {
            $sentencia=$this->db->prepare("CALL sp_select_archivo(?)");
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

        public function insertDocumento($titulo,$expediente,$mencionRespID,$fechaSuscrip,$descripFisicaID,$notasID,$terminoPropuesto,$ubicacionID,$responsable,$archivoAdjunto,$autorInstitucional,$terminoControlado)
        {
            $sentencia=$this->db->prepare("CALL sp_insert_documento(?,?,?,?,?,?,?,?,?,?,?,?)");
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
            $sentencia->bindParam(11,$autorInstitucional);
            $sentencia->bindParam(12,$terminoControlado);
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

        public function existeTituloUpdate($id,$titulo)
        {
            $sentencia=$this->db->prepare("CALL sp_existe_titulo_update(?,?)");
            $sentencia->bindParam(1,$id);
            $sentencia->bindParam(2,$titulo);
            $sentencia->execute();
            $resp=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $resp['response'];
        }

        public function existeExpedienteUpdate($id,$expediente)
        {
            $sentencia=$this->db->prepare("CALL sp_existe_expediente_update(?,?)");
            $sentencia->bindParam(1,$id);
            $sentencia->bindParam(2,$expediente);
            $sentencia->execute();
            $resp=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $resp['response'];
        }

        public function existeFechaSuscripUpdate($id,$fechaSuscrip)
        {
            $sentencia=$this->db->prepare("CALL sp_existe_fechaSuscrip_update(?,?)");
            $sentencia->bindParam(1,$id);
            $sentencia->bindParam(2,$fechaSuscrip);
            $sentencia->execute();
            $resp=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $resp['response'];
        }

        public function updateAutor($id,$nombre,$apellido)
        {
            $sentencia=$this->db->prepare("CALL sp_update_autor(?,?,?)");
            $sentencia->bindParam(1,$id);
            $sentencia->bindParam(2,$nombre);
            $sentencia->bindParam(3,$apellido);
            $sentencia->execute();
            $resp=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $resp['response'];

        }

        public function updateDescripFisica($id,$numPag,$numHojas,$formato,$otros)
        {
            $sentencia=$this->db->prepare("CALL sp_update_descripFisica(?,?,?,?,?)");
            $sentencia->bindParam(1,$id);
            $sentencia->bindParam(2,$numPag);
            $sentencia->bindParam(3,$numHojas);
            $sentencia->bindParam(4,$formato);
            $sentencia->bindParam(5,$otros);
            $sentencia->execute();
            $resp=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $resp['response'];
        }

        public function updateEntidad($id,$nombre)
        {
            $sentencia=$this->db->prepare("CALL sp_update_entidad(?,?)");
            $sentencia->bindParam(1,$id);
            $sentencia->bindParam(2,$nombre);
            $sentencia->execute();
            $resp=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $resp['response'];
        }

        public function updateNotas($id,$objeto,$docVinculado,$notaContenido,$lugarRedaccion,$natuAlcanceForma,$vigencia,$numDecreto,$aprobadoLey)
        {
            $sentencia=$this->db->prepare("CALL sp_update_notas(?,?,?,?,?,?,?,?,?)");
            $sentencia->bindParam(1,$id);
            $sentencia->bindParam(2,$objeto);
            $sentencia->bindParam(3,$docVinculado);
            $sentencia->bindParam(4,$notaContenido);
            $sentencia->bindParam(5,$lugarRedaccion);
            $sentencia->bindParam(6,$natuAlcanceForma);
            $sentencia->bindParam(7,$vigencia);
            $sentencia->bindParam(8,$numDecreto);
            $sentencia->bindParam(9,$aprobadoLey);
            $sentencia->execute();
            $resp=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $resp['response'];
        }

        public function updateUbicacion($id,$carpeta,$folio)
        {
            $sentencia=$this->db->prepare("CALL sp_update_ubicacion(?,?,?)");
            $sentencia->bindParam(1,$id);
            $sentencia->bindParam(2,$carpeta);
            $sentencia->bindParam(3,$folio);
            $sentencia->execute();
            $resp=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $resp['response'];
        }

        public function updateDocumento($id,$titulo,$expediente,$fechaSuscrip,$terminoPropuesto,$responsable,$autorInstitucional,$terminoControlado)
        {
            $sentencia=$this->db->prepare("CALL sp_update_documento(?,?,?,?,?,?,?,?)");
            $sentencia->bindParam(1,$id);
            $sentencia->bindParam(2,$titulo);
            $sentencia->bindParam(3,$expediente);
            $sentencia->bindParam(4,$fechaSuscrip);
            $sentencia->bindParam(5,$terminoPropuesto);
            $sentencia->bindParam(6,$responsable);
            $sentencia->bindParam(7,$autorInstitucional);
            $sentencia->bindParam(8,$terminoControlado);
            $sentencia->execute();
            $resp=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $resp['response'];
        }

        public function updateArchivo($id,$archivo)
        {
            $sentencia=$this->db->prepare("CALL sp_update_archivo(?,?)");
            $sentencia->bindParam(1,$id);
            $sentencia->bindParam(1,$archivo);
            $sentencia->execute();
            $resp=$sentencia->fetch(PDO::FETCH_ASSOC);

            return $resp['response'];
        }

        public function getTitles(){
            $sentencia = $this->db->query("CALL sp_select_titulos()");
            $response = $sentencia->fetchAll(PDO::FETCH_ASSOC);
            
            return $response;
        }

        public function getVigencia(){
            $sentencia = $this->db->query("CALL sp_select_vigencia()");
            $response = $sentencia->fetchAll(PDO::FETCH_ASSOC);
            
            return $response;
        }

        public function getMinisterio(){
            $sentencia = $this->db->query("CALL sp_select_ministerio()");
            $response = $sentencia->fetchAll(PDO::FETCH_ASSOC);
            
            return $response;
        }

        public function getInstitucion(){
            $sentencia = $this->db->query("CALL sp_select_inst()");
            $response = $sentencia->fetchAll(PDO::FETCH_ASSOC);
            
            return $response;
        }

        public function getAutor(){
            $sentencia = $this->db->query("CALL sp_select_autor()");
            $response = $sentencia->fetchAll(PDO::FETCH_ASSOC);
            
            return $response;
        }

        public function getNameAutor($id)
        {
            $sentencia = $this->db->prepare("CALL sp_select_name_autor(?)");
            $sentencia->bindParam(1,$id);
            $sentencia->execute();
            $response = $sentencia->fetch(PDO::FETCH_ASSOC);
            
            return $response["nombre"];
        }


        public function getDocumentosForTitle($title)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_titulo(?)");
            $sentencia->bindParam(1,$title);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForInstitucion($institucion)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_inst(?)");
            $sentencia->bindParam(1,$institucion);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForMinisterio($ministerio)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_ministerio(?)");
            $sentencia->bindParam(1,$ministerio);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForFecha($fecha)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_fecha(?)");
            $sentencia->bindParam(1,$fecha);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForVigencia($vigencia)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_vigencia(?)");
            $sentencia->bindParam(1,$vigencia);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForAutor($autor)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_autor(?)");
            $sentencia->bindParam(1,$autor);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForTituloMinisterio($title,$ministerio)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_titulo_ministerio(?,?)");
            $sentencia->bindParam(1,$title);
            $sentencia->bindParam(2,$ministerio);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForTituloFecha($title,$fecha)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_titulo_fecha(?,?)");
            $sentencia->bindParam(1,$title);
            $sentencia->bindParam(2,$fecha);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForTituloVigencia($title,$vigencia)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_titulo_vigencia(?,?)");
            $sentencia->bindParam(1,$title);
            $sentencia->bindParam(2,$vigencia);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForTituloInstitucion($title,$institucion)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_titulo_inst(?,?)");
            $sentencia->bindParam(1,$title);
            $sentencia->bindParam(2,$institucion);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForTituloAutor($title,$autor)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_titulo_autor(?,?)");
            $sentencia->bindParam(1,$title);
            $sentencia->bindParam(2,$autor);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        
        public function getDocumentosForTituloMinisterioFecha($title,$ministerio,$fecha)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_titulo_ministerio_fecha(?,?,?)");
            $sentencia->bindParam(1,$title);
            $sentencia->bindParam(2,$ministerio);
            $sentencia->bindParam(3,$fecha);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForTituloMinisterioVigencia($title,$ministerio,$vigencia)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_titulo_ministerio_vigencia(?,?,?)");
            $sentencia->bindParam(1,$title);
            $sentencia->bindParam(2,$ministerio);
            $sentencia->bindParam(3,$vigencia);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForTituloMinisterioInstitucion($title,$ministerio,$institucion)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_titulo_ministerio_inst(?,?,?)");
            $sentencia->bindParam(1,$title);
            $sentencia->bindParam(2,$ministerio);
            $sentencia->bindParam(3,$institucion);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForTituloMinisterioAutor($title,$ministerio,$autor)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_titulo_ministerio_autor(?,?,?)");
            $sentencia->bindParam(1,$title);
            $sentencia->bindParam(2,$ministerio);
            $sentencia->bindParam(3,$autor);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForTituloMinisterioFechaVigencia($title,$ministerio,$fecha,$vigencia)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_titulo_ministerio_fecha_vigencia(?,?,?,?)");
            $sentencia->bindParam(1,$title);
            $sentencia->bindParam(2,$ministerio);
            $sentencia->bindParam(3,$fecha);
            $sentencia->bindParam(4,$vigencia);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForTituloMinisterioFechaInstitucion($title,$ministerio,$fecha,$institucion)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_titulo_ministerio_fecha_inst(?,?,?,?)");
            $sentencia->bindParam(1,$title);
            $sentencia->bindParam(2,$ministerio);
            $sentencia->bindParam(3,$fecha);
            $sentencia->bindParam(4,$institucion);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForTituloMinisterioFechaAutor($title,$ministerio,$fecha,$autor)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_titulo_ministerio_fecha_autor(?,?,?,?)");
            $sentencia->bindParam(1,$title);
            $sentencia->bindParam(2,$ministerio);
            $sentencia->bindParam(3,$fecha);
            $sentencia->bindParam(4,$autor);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForTituloMinisterioFechaVigenciaInstitucion($title,$ministerio,$fecha,$vigencia,$institucion)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_titulo_ministerio_fecha_vigencia_inst(?,?,?,?,?)");
            $sentencia->bindParam(1,$title);
            $sentencia->bindParam(2,$ministerio);
            $sentencia->bindParam(3,$fecha);
            $sentencia->bindParam(4,$vigencia);
            $sentencia->bindParam(5,$institucion);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForTituloMinisterioFechaVigenciaAutor($title,$ministerio,$fecha,$vigencia,$autor)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_titulo_ministerio_fecha_vigencia_autor(?,?,?,?,?)");
            $sentencia->bindParam(1,$title);
            $sentencia->bindParam(2,$ministerio);
            $sentencia->bindParam(3,$fecha);
            $sentencia->bindParam(4,$vigencia);
            $sentencia->bindParam(5,$autor);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForTituloMinisterioFechaVigenciaInstitucionAutor($title,$ministerio,$fecha,$vigencia,$institucion,$autor)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_titulo_min_fecha_vigencia_inst_autor(?,?,?,?,?,?)");
            $sentencia->bindParam(1,$title);
            $sentencia->bindParam(2,$ministerio);
            $sentencia->bindParam(3,$fecha);
            $sentencia->bindParam(4,$vigencia);
            $sentencia->bindParam(5,$institucion);
            $sentencia->bindParam(6,$autor);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForMinisterioFecha($ministerio,$fecha)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_ministerio_fecha(?,?)");
            $sentencia->bindParam(1,$ministerio);
            $sentencia->bindParam(2,$fecha);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForMinisterioVigencia($ministerio,$vigencia)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_ministerio_vigencia(?,?)");
            $sentencia->bindParam(1,$ministerio);
            $sentencia->bindParam(2,$vigencia);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForMinisterioInstitucion($ministerio,$institucion)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_ministerio_inst(?,?)");
            $sentencia->bindParam(1,$ministerio);
            $sentencia->bindParam(2,$institucion);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForMinisterioAutor($ministerio,$autor)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_ministerio_autor(?,?)");
            $sentencia->bindParam(1,$ministerio);
            $sentencia->bindParam(2,$autor);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        
        public function getDocumentosForMinisterioFechaVigencia($ministerio,$fecha,$vigencia)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_ministerio_fecha_vigencia(?,?,?)");
            $sentencia->bindParam(1,$ministerio);
            $sentencia->bindParam(2,$fecha);
            $sentencia->bindParam(3,$vigencia);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForMinisterioFechaInstitucion($ministerio,$fecha,$institucion)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_ministerio_fecha_inst(?,?,?)");
            $sentencia->bindParam(1,$ministerio);
            $sentencia->bindParam(2,$fecha);
            $sentencia->bindParam(3,$institucion);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForMinisterioFechaAutor($ministerio,$fecha,$autor)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_ministerio_fecha_autor(?,?,?)");
            $sentencia->bindParam(1,$ministerio);
            $sentencia->bindParam(2,$fecha);
            $sentencia->bindParam(3,$autor);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForMinisterioFechaVigenciaInstitucion($ministerio,$fecha,$vigencia,$institucion)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_ministerio_fecha_vigencia_inst(?,?,?,?)");
            $sentencia->bindParam(1,$ministerio);
            $sentencia->bindParam(2,$fecha);
            $sentencia->bindParam(3,$vigencia);
            $sentencia->bindParam(4,$institucion);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForMinisterioFechaVigenciaAutor($ministerio,$fecha,$vigencia,$autor)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_ministerio_fecha_vigencia_autor(?,?,?,?)");
            $sentencia->bindParam(1,$ministerio);
            $sentencia->bindParam(2,$fecha);
            $sentencia->bindParam(3,$vigencia);
            $sentencia->bindParam(4,$autor);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForMinisterioFechaVigenciaInstitucionAutor($ministerio,$fecha,$vigencia,$institucion,$autor)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_ministerio_fecha_vigencia_inst_autor(?,?,?,?,?)");
            $sentencia->bindParam(1,$ministerio);
            $sentencia->bindParam(2,$fecha);
            $sentencia->bindParam(3,$vigencia);
            $sentencia->bindParam(4,$institucion);
            $sentencia->bindParam(5,$autor);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForFechaVigencia($fecha,$vigencia)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_fecha_vigencia(?,?)");
            $sentencia->bindParam(1,$fecha);
            $sentencia->bindParam(2,$vigencia);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForFechaInstitucion($fecha,$institucion)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_fecha_inst(?,?)");
            $sentencia->bindParam(1,$fecha);
            $sentencia->bindParam(2,$institucion);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForFechaAutor($fecha,$autor)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_fecha_autor(?,?)");
            $sentencia->bindParam(1,$fecha);
            $sentencia->bindParam(2,$autor);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForFechaVigenciaInstitucion($fecha,$vigencia,$institucion)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_fecha_vigencia_inst(?,?,?)");
            $sentencia->bindParam(1,$fecha);
            $sentencia->bindParam(2,$vigencia);
            $sentencia->bindParam(3,$institucion);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForFechaVigenciaAutor($fecha,$vigencia,$autor)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_fecha_vigencia_autor(?,?,?)");
            $sentencia->bindParam(1,$fecha);
            $sentencia->bindParam(2,$vigencia);
            $sentencia->bindParam(3,$autor);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForFechaVigenciaInstitucionAutor($fecha,$vigencia,$institucion,$autor)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_fecha_vigencia_inst_autor(?,?,?,?)");
            $sentencia->bindParam(1,$fecha);
            $sentencia->bindParam(2,$vigencia);
            $sentencia->bindParam(3,$institucion);
            $sentencia->bindParam(4,$autor);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForVigenciaInstitucion($vigencia,$institucion)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_vigencia_inst(?,?)");
            $sentencia->bindParam(1,$vigencia);
            $sentencia->bindParam(2,$institucion);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForVigenciaAutor($vigencia,$autor)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_vigencia_autor(?,?)");
            $sentencia->bindParam(1,$vigencia);
            $sentencia->bindParam(2,$autor);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForVigenciaInstitucionAutor($vigencia,$institucion,$autor)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_vigencia_inst_autor(?,?,?)");
            $sentencia->bindParam(1,$vigencia);
            $sentencia->bindParam(2,$institucion);
            $sentencia->bindParam(3,$autor);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

        public function getDocumentosForInstitucionAutor($institucion,$autor)
        {
            $sentencia=$this->db->prepare("CALL sp_select_documentos_inst_autor(?,?)");
            $sentencia->bindParam(1,$institucion);
            $sentencia->bindParam(2,$autor);
            $sentencia->execute();
            $response=$sentencia->fetchAll(PDO::FETCH_ASSOC);

            return $response;
        }

    }