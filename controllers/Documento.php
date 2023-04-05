<?php
    session_start();

    class DocumentoController
    {
        private $documento;

        public function __construct()
        {
            require_once 'models/DocumentoModel.php';
            $this->documento = new DocumentoModel;
        }

        public function index()
        {
            $data['titulo']="Listado de documentos";
            $data['documentos']=$this->documento->getDocumentos();

            require_once 'views/documentos/documentos.php';
        }

        public function create()
        {
            $data['titulo']="Crear registro";

            require_once 'views/documentos/create.php';
        }

        public function store()
        {
            $titulo=$_POST['titulo'];
            $expediente=$_POST['expediente'];
            $apellidoAutor=$_POST['apellidoAutor'];
            $nombreAutor=$_POST['nombreAutor'];

            $entidad=$_POST['entidad'];
            $fechaSuscripcion=$_POST['fechaSuscripcion'];
            $numPag=$_POST['numPag'];
            $numHojas=$_POST['numHojas'];
            $otros=$_POST['otros'];
            
            $formato=$_POST['formato'];
            $objeto=$_POST['objeto'];
            $docVinculado=$_POST['docVinculado'];
            $notaContenido=$_POST['notaContenido'];
            $lugarRedaccion=$_POST['lugarRedaccion'];

            $natuAlcanceForma=$_POST['natuAlcanceForma'];
            $vigencia=$_POST['vigencia'];
            $numDecreto=$_POST['numDecreto'];
            $aprobLey=$_POST['aprobLey'];
            $terminoPropuesto=$_POST['terminoPropuesto'];

            $carpeta=$_POST['carpeta'];
            $folio=$_POST['folio'];
            $documento=$_FILES['documento']['name'];
            $responsable=$_POST['responsable'];

            if(empty($titulo) || empty($expediente) || empty($nombreAutor) || empty($apellidoAutor) || empty($entidad) || empty($fechaSuscripcion) || empty($numPag) || empty($numHojas) || empty($otros) || empty($objeto) || empty($docVinculado) || empty($notaContenido) || empty($lugarRedaccion) || empty($natuAlcanceForma) || empty($vigencia) || empty($numDecreto) || empty($aprobLey) || empty($terminoPropuesto) || empty($carpeta) || empty($folio) || empty($documento) || empty($responsable)){
                $_SESSION['msj']="Error: Todos los campos son requeridos";
                $_SESSION['msj_type']="danger";

                header("location:index.php?c=Documento&m=create");
            }else{
                if($this->documento->existeTitulo($titulo)){
                    $_SESSION['msj']="Error: El título del documento ya existe, ingrese otro por favor";
                    $_SESSION['msj_type']="danger";

                    header("location:index.php?c=Documento&m=create");
                }elseif($this->documento->existeExpediente($expediente)){
                    $_SESSION['msj']="Error: El expediente ya existe, ingrese otro por favor";
                    $_SESSION['msj_type']="danger";

                    header("location:index.php?c=Documento&m=create");
                }elseif($this->documento->existeFechaSuscrip($fechaSuscripcion)){
                    $_SESSION['msj']="Error: La fecha de suscripción ya existe, ingrese otra por favor";
                    $_SESSION['msj_type']="danger";

                    header("location:index.php?c=Documento&m=create");
                }else{
                    $idAutor=$this->documento->insertAutor($nombreAutor,$apellidoAutor);
                    if($idAutor){
                        $idEntidad=$this->documento->insertEntidad($entidad);
                        if($idEntidad){
                            $idMencionResp=$this->documento->insertMencionResp($idAutor,$idEntidad);
                            if($idMencionResp){
                                $idNotas=$this->documento->insertNotas($objeto,$docVinculado,$notaContenido,$lugarRedaccion,$natuAlcanceForma,$vigencia,$numDecreto,$aprobLey);
                                if($idNotas){
                                    $idUbicacion=$this->documento->insertUbicacion($carpeta,$folio);
                                    if($idUbicacion){
                                        $idDescripFisica=$this->documento->insertDescripFisica($numPag,$numHojas,$formato,$otros);
                                        if($idDescripFisica){

                                            $fecha=new DateTime;
                                            $nombreDocumento=($documento!="")?$fecha->getTimestamp()."_".$documento:"";
                                            $tmpDocumento=$_FILES['documento']['tmp_name'];

                                            if($tmpDocumento!=""){
                                                move_uploaded_file($tmpDocumento,"assets/archivos/".$nombreDocumento);
                                            }

                                            $idDocumento=$this->documento->insertDocumento($titulo,$expediente,$idMencionResp,$fechaSuscripcion,$idDescripFisica,$idNotas,$terminoPropuesto,$idUbicacion,$responsable,$nombreDocumento);

                                            if($idDocumento){
                                                $_SESSION['msj']="Documento registrado con éxito";
                                                
                                                header("location:index.php");
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }