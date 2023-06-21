<?php
    

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
            $anio=$_POST['anio'];
            $mes=$_POST['mes'];
            $dia=$_POST['dia'];

            $fechaSuscripcion = $dia . $mes . $anio;


            $titulo=$_POST['titulo'];
            $expediente=$_POST['expediente'];
            $apellidoAutor=$_POST['apellidoAutor'];
            $nombreAutor=$_POST['nombreAutor'];

            $entidad=$_POST['entidad'];
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

            $autorInstitucional=$_POST['autorInstitucional'];
            $terminoControlado=$_POST['terminoControlado'];

            if(empty($titulo) || empty($expediente) || empty($nombreAutor) || empty($apellidoAutor) || empty($entidad) || empty($numPag) || empty($numHojas) || empty($otros) || empty($objeto) || empty($docVinculado) || empty($notaContenido) || empty($lugarRedaccion) || empty($natuAlcanceForma) || empty($vigencia) || empty($numDecreto) || empty($aprobLey) || empty($terminoPropuesto) || empty($carpeta) || empty($folio) || empty($documento) || empty($responsable)){
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

                                            $idDocumento=$this->documento->insertDocumento($titulo,$expediente,$idMencionResp,$fechaSuscripcion,$idDescripFisica,$idNotas,$terminoPropuesto,$idUbicacion,$responsable,$nombreDocumento,$autorInstitucional,$terminoControlado);

                                            if($idDocumento){
                                                $_SESSION['msj']="Documento registrado con éxito";
                                                

                                                $token=hash_hmac('sha1',$idDocumento,KEY_TOKEN);
                                                
                                                header("location:index.php?c=Documento&m=show&id=$idDocumento&token=$token");
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

        public function edit($id=null,$token=null)
        {

            $tmpToken=hash_hmac('sha1',$id,KEY_TOKEN);

            if($tmpToken!=$token){
                header("location:index.php");
            }else{
                $data['id']=$id;
                $data['token']=$token;
                $data['documento']=$this->documento->getDocumento($id);
                $data['titulo']="Editar registro";
    
                require_once 'views/documentos/edit.php';

            }

        }

        public function update()
        {
            $token=$_POST['token'];
            $documentoID=$_POST['id'];

            $notasID=$_POST['notasID'];
            $entidadID=$_POST['entidadID'];
            $ubicacionID=$_POST['ubicacionID'];
            $descripFisicaID=$_POST['descripFisicaID'];
            $autorID=$_POST['autorID'];
            
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
            $responsable=$_POST['responsable'];

            $autorInstitucional=$_POST['autorInstitucional'];
            $terminoControlado=$_POST['terminoControlado'];

            $archivo=(isset($_FILES['archivo']['name']))?$_FILES['archivo']['name']:"";

            if(empty($titulo) || empty($expediente) || empty($nombreAutor) || empty($apellidoAutor) || empty($entidad) || empty($fechaSuscripcion) || empty($numPag) || empty($numHojas) || empty($otros) || empty($formato) || empty($objeto) || empty($docVinculado) || empty($notaContenido) || empty($lugarRedaccion) || empty($natuAlcanceForma) || empty($vigencia) || empty($numDecreto) || empty($aprobLey) || empty($carpeta) || empty($terminoPropuesto) || empty($folio) || empty($responsable)){
                $_SESSION['msj']="Error: Todos los campos son requeridos";
                $_SESSION['msj_type']="danger";

                header("location:index.php?c=Documento&m=edit&id=$documentoID&token=$token");
            }else{
                if($this->documento->existeTituloUpdate($documentoID,$titulo)){
                    $_SESSION['msj']="Error: El título ya existe, ingrese otro por favor";
                    $_SESSION['msj_type']="danger";

                    header("location:index.php?c=Documento&m=edit&id=$documentoID&token=$token");                  
                }elseif($this->documento->existeExpedienteUpdate($documentoID,$expediente)){
                    $_SESSION['msj']="Error: El expediente ya existe, ingrese otro por favor";
                    $_SESSION['msj_type']="danger";

                    header("location:index.php?c=Documento&m=edit&id=$documentoID&token=$token");
                }elseif($this->documento->existeFechaSuscripUpdate($documentoID,$fechaSuscripcion)){
                    $_SESSION['msj']="Error: La fecha de suscripción ya existe, ingrese otra por favor";
                    $_SESSION['msj_type']="danger";

                    header("location:index.php?c=Documento&m=edit&id=$documentoID&token=$token");
                }else{
                    $updateAutor=$this->documento->updateAutor($autorID,$nombreAutor,$apellidoAutor);
                    if($updateAutor){
                        $updateEntidad=$this->documento->updateEntidad($entidadID,$entidad);
                        if($updateEntidad){
                            $updateNotas=$this->documento->updateNotas($notasID,$objeto,$docVinculado,$notaContenido,$lugarRedaccion,$natuAlcanceForma,$vigencia,$numDecreto,$aprobLey);
                            if($updateNotas){
                                $updateUbicacion=$this->documento->updateUbicacion($ubicacionID,$carpeta,$folio);
                                if($updateUbicacion){
                                    $updateDescripFisica=$this->documento->updateDescripFisica($descripFisicaID,$numPag,$numHojas,$formato,$otros);
                                    if($updateDescripFisica){
                                        $updateDocumento=$this->documento->updateDocumento($documentoID,$titulo,$expediente,$fechaSuscripcion,$terminoPropuesto,$responsable,$autorInstitucional,$terminoControlado);
                                        if($updateDocumento){
                                            $_SESSION['msj']="Documento actualizado con éxito!";

                                                $token=hash_hmac('sha1',$documentoID,KEY_TOKEN);
                                                
                                                header("location:index.php?c=Documento&m=show&id=$documentoID&token=$token");
                                        }
                                    }
                                }
                            }
                        }
                    }

                    if($archivo!=""){
                        $fecha=new DateTime;
                        $nombreArchivo=($archivo!="")?$fecha->getTimestamp()."_".$archivo:"";
                        $tmpArchivo=$_FILES['archivo']['tmp_name'];
                        move_uploaded_file($tmpArchivo,"assets/archivos/".$nombreArchivo);

                        $archivoAdjunto=$this->documento->getArchivo($documentoID);
                        
                        if(isset($archivoAdjunto['archivoAdjunto']) && $archivoAdjunto['archivoAdjunto']!=""){
                            if(file_exists("assets/archivos/".$archivoAdjunto['archivoAdjunto'])){
                                unlink("assets/archivos/".$archivoAdjunto['archivoAdjunto']);
                            }
                        }

                        $updateArchivo=$this->documento->updateArchivo($documentoID,$nombreArchivo);
                        if($updateArchivo){
                            $_SESSION['msj']="Documento actualizado con éxito!";

                            $token=hash_hmac('sha1',$documentoID,KEY_TOKEN);
                                                
                            header("location:index.php?c=Documento&m=show&id=$documentoID&token=$token");
                        }
                    }
                }
            }
        }

        public function destroy($id=null,$token=null)
        {

            $tmpToken=hash_hmac('sha1',$id,KEY_TOKEN);

            if($tmpToken!=$token){
                header("location:index.php");
            }else{
                $delDocumento=$this->documento->deleteDocumento($id);
    
                if($delDocumento){
                    $_SESSION['msj']="Documento eliminado con éxito!";
                    $_SESSION['usuario']="Administrador";
    
                    header("location:index.php");
                }

            }

        }

        public function show($id=null,$token=null)
        {
            $tmpToken=hash_hmac('sha1',$id,KEY_TOKEN);

            if($tmpToken!=$token){
                header("location:index.php");
            }else{
                $data['documento']=$this->documento->getDocumento($id);
                $data['id']=$id;

                require_once 'views/documentos/show.php';
            }
        }

        public function login()
        {
            require_once 'views/documentos/login.php';
        }

        public function procesarLogin()
        {    
            session_start();
            $usuario=$_POST['usuario'];
            $password=$_POST['password'];

            if(empty($usuario) || empty($password)){
                $_SESSION['msj']="Ingrese un usuario y contraseña";

                header("location:index.php?c=Documento&m=login");
            }else{
                if($usuario!="Administrador" || $password!="administrador"){
                    $_SESSION['msj']="Usuario o contraseña incorrectos";

                    header("location:index.php?c=Documento&m=login");
                }else{
                    $_SESSION['usuario']="Administrador";

                    header("location:index.php");
                }
            }
        }

        public function cerrar()
        {
            require_once 'views/documentos/cerrar.php';
        }

        public function search()
        {
            $data['titulo']="Busqueda avanzada";
            $data['titulos']=$this->documento->getTitles();
            $data['ministerios']=$this->documento->getMinisterio();
            $data['vigencias']=$this->documento->getVigencia();
            $data['instituciones']=$this->documento->getInstitucion();
            $data['autores']=$this->documento->getAutor();

            require_once 'views/documentos/search.php';
        }

        public function resultsOfSearch()
        {
            $data["titulo"] = (isset($_POST['titulo'])) ? $_POST['titulo'] : "";
            $data["ministerio"] = (isset($_POST['ministerio'])) ? $_POST['ministerio'] : "";
            $data["fecha"] = (isset($_POST['fecha'])) ? $_POST['fecha'] : "";
            $data["vigencia"] = (isset($_POST['vigencia'])) ? $_POST['vigencia'] : "";
            $data["institucion"] = (isset($_POST["institucion"])) ? $_POST["institucion"] : "";
            $data["autor"] = (isset($_POST['autor'])) ? $_POST['autor'] : "";

            if(!empty($data["titulo"])){
                $data['documentos']=$this->documento->getDocumentosForTitle($data["titulo"]);

                require_once 'views/documentos/resultsOfSearch.php';
            }else{
                if(!empty($data["fecha"])){
                    $data['documentos']=$this->documento->getDocumentosForFecha($data["fecha"]);
                    
                    require_once 'views/documentos/resultsOfSearch.php';
                }else{
                    if(!empty($data["ministerio"])){
                        $data['documentos']=$this->documento->getDocumentosForMinisterio($data["ministerio"]);
                        
                        require_once 'views/documentos/resultsOfSearch.php';
                    }else{
                        if(!empty($data["vigencia"])){
                            $data['documentos']=$this->documento->getDocumentosForVigencia($data["vigencia"]);
                            
                            require_once 'views/documentos/resultsOfSearch.php';
                        }else{
                            if(!empty($data["institucion"])){
                                $data['documentos']=$this->documento->getDocumentosForInstitucion($data["institucion"]);
                                
                                require_once 'views/documentos/resultsOfSearch.php';
                            }else{
                                if(isset($data["autor"])){
                                    $data['documentos']=$this->documento->getDocumentosForAutor($data["autor"]);

                                    $data["autor"] = $this->documento->getNameAutor($data["autor"]);
                                    
                                    require_once 'views/documentos/resultsOfSearch.php';
                                }else{
                                    if(!empty($data["titulo"]) && !empty($data["ministerio"])){
                                        $data['documentos']=$this->documento->getDocumentosForTituloMinisterio($data["titulo"],$data["ministerio"]);
                                    
                                        require_once 'views/documentos/resultsOfSearch.php';

                                    }else{
                                        if(!empty($data["titulo"]) && !empty($data["fecha"])){
                                            $data['documentos']=$this->documento->getDocumentosForTituloFecha($data["titulo"],$data["fecha"]);
                                        
                                            require_once 'views/documentos/resultsOfSearch.php';
    
                                        }else{
                                            if(!empty($data["titulo"]) && !empty($data["vigencia"])){
                                                $data['documentos']=$this->documento->getDocumentosForTituloVigencia($data["titulo"],$data["vigencia"]);
                                            
                                                require_once 'views/documentos/resultsOfSearch.php';
        
                                            }else{
                                                if(!empty($data["titulo"]) && !empty($data["institucion"])){
                                                    $data['documentos']=$this->documento->getDocumentosForTituloInstitucion($data["titulo"],$data["institucion"]);
                                                
                                                    require_once 'views/documentos/resultsOfSearch.php';
            
                                                }else{
                                                    if(!empty($data["titulo"]) && !empty($data["autor"])){
                                                        $data['documentos']=$this->documento->getDocumentosForTituloAutor($data["titulo"],$data["autor"]);

                                                       
                                                        $data["autor"] = $this->documento->getNameAutor($data["autor"]);
                                                    
                                                        require_once 'views/documentos/resultsOfSearch.php';
                
                                                    }else{
                                                        if(!empty($data["titulo"]) && !empty($data["ministerio"]) && !empty($data["fecha"])){
                                                            $data['documentos']=$this->documento->getDocumentosForTituloMinisterioFecha($data["titulo"],$data["ministerio"],$data["fecha"]);
                                                        
                                                            require_once 'views/documentos/resultsOfSearch.php';
                    
                                                        }else{
                                                            if(!empty($data["titulo"]) && !empty($data["ministerio"]) && !empty($data["vigencia"])){
                                                                $data['documentos']=$this->documento->getDocumentosForTituloMinisterioVigencia($data["titulo"],$data["ministerio"],$data["vigencia"]);
                                                            
                                                                require_once 'views/documentos/resultsOfSearch.php';
                        
                                                            }else{
                                                                if(!empty($data["titulo"]) && !empty($data["ministerio"]) && !empty($data["institucion"])){
                                                                    $data['documentos']=$this->documento->getDocumentosForTituloMinisterioInstitucion($data["titulo"],$data["ministerio"],$data["institucion"]);
                                                                
                                                                    require_once 'views/documentos/resultsOfSearch.php';
                            
                                                                }else{
                                                                    if(!empty($data["titulo"]) && !empty($data["ministerio"]) && !empty($data["autor"])){
                                                                        $data['documentos']=$this->documento->getDocumentosForTituloMinisterioAutor($data["titulo"],$data["ministerio"],$data["autor"]);

                                                                        //$data["autor"] = $this->documento->getNameAutor($data["autor"]);
                                                                    
                                                                        require_once 'views/documentos/resultsOfSearch.php';
                                
                                                                    }else{
                                                                        if(!empty($data["titulo"]) && !empty($data["ministerio"]) && !empty($data["fecha"]) && !empty($data["vigencia"])){
                                                                            $data['documentos']=$this->documento->getDocumentosForTituloMinisterioFechaVigencia($data["titulo"],$data["ministerio"],$data["fecha"],$data["vigencia"]);
                                                                        
                                                                            require_once 'views/documentos/resultsOfSearch.php';
                                    
                                                                        }else{
                                                                            if(!empty($data["titulo"]) && !empty($data["ministerio"]) && !empty($data["fecha"]) && !empty($data["institucion"])){
                                                                                $data['documentos']=$this->documento->getDocumentosForTituloMinisterioFechaInstitucion($data["titulo"],$data["ministerio"],$data["fecha"],$data["institucion"]);
                                                                            
                                                                                require_once 'views/documentos/resultsOfSearch.php';
                                        
                                                                            }else{
                                                                                if(!empty($data["titulo"]) && !empty($data["ministerio"]) && !empty($data["fecha"]) && !empty($data["autor"])){
                                                                                    $data['documentos']=$this->documento->getDocumentosForTituloMinisterioFechaAutor($data["titulo"],$data["ministerio"],$data["fecha"],$data["autor"]);

                                                                                   // $data["autor"] = $this->documento->getNameAutor($data["autor"]);
                                                                                
                                                                                    require_once 'views/documentos/resultsOfSearch.php';
                                            
                                                                                }else{
                                                                                    if(!empty($data["titulo"]) && !empty($data["ministerio"]) && !empty($data["fecha"]) && !empty($data["vigencia"]) && !empty($data["institucion"])){
                                                                                        $data['documentos']=$this->documento->getDocumentosForTituloMinisterioFechaVigenciaInstitucion($data["titulo"],$data["ministerio"],$data["fecha"],$data["vigencia"],$data["institucion"]);
                                                                                    
                                                                                        require_once 'views/documentos/resultsOfSearch.php';
                                                
                                                                                    }else{
                                                                                        if(!empty($data["titulo"]) && !empty($data["ministerio"]) && !empty($data["fecha"]) && !empty($data["vigencia"]) && !empty($data["autor"])){
                                                                                            $data['documentos']=$this->documento->getDocumentosForTituloMinisterioFechaVigenciaAutor($data["titulo"],$data["ministerio"],$data["fecha"],$data["vigencia"],$data["autor"]);

                                                                                            //$data["autor"] = $this->documento->getNameAutor($data["autor"]);
                                                                                        
                                                                                            require_once 'views/documentos/resultsOfSearch.php';
                                                    
                                                                                        }else{
                                                                                            if(!empty($data["titulo"]) && !empty($data["ministerio"]) && !empty($data["fecha"]) && !empty($data["vigencia"]) && !empty($data["institucion"]) && !empty($data["autor"])){
                                                                                                $data['documentos']=$this->documento->getDocumentosForTituloMinisterioFechaVigenciaInstitucionAutor($data["titulo"],$data["ministerio"],$data["fecha"],$data["vigencia"],$data["institucion"],$data["autor"]);

                                                                                                //$data["autor"] = $this->documento->getNameAutor($data["autor"]);
                                                                                            
                                                                                                require_once 'views/documentos/resultsOfSearch.php';
                                                        
                                                                                            }else{
            if(!empty($data["ministerio"]) && !empty($data["fecha"])){
                $data['documentos']=$this->documento->getDocumentosForMinisterioFecha($data["ministerio"],$data["fecha"]);
                                                                                                
                require_once 'views/documentos/resultsOfSearch.php';
                                                            
            }else{
                if(!empty($data["ministerio"]) && !empty($data["vigencia"])){
                    $data['documentos']=$this->documento->getDocumentosForMinisterioVigencia($data["ministerio"],$data["vigencia"]);
                                                                                                    
                    require_once 'views/documentos/resultsOfSearch.php';
                                                                
                }else{
                    if(!empty($data["ministerio"]) && !empty($data["institucion"])){
                        $data['documentos']=$this->documento->getDocumentosForMinisterioInstitucion($data["ministerio"],$data["institucion"]);
                                                                                                        
                        require_once 'views/documentos/resultsOfSearch.php';
                                                                    
                    }else{
                        if(!empty($data["ministerio"]) && !empty($data["autor"])){
                            $data['documentos']=$this->documento->getDocumentosForMinisterioAutor($data["ministerio"],$data["autor"]);

                           // $data["autor"] = $this->documento->getNameAutor($data["autor"]);
                                                                                                            
                            require_once 'views/documentos/resultsOfSearch.php';
                                                                        
                        }else{
                            if(!empty($data["ministerio"]) && !empty($data["fecha"]) && !empty($data["vigencia"])){
                                $data['documentos']=$this->documento->getDocumentosForMinisterioFechaVigencia($data["ministerio"],$data["fecha"],$data["vigencia"]);
                            
                                require_once 'views/documentos/resultsOfSearch.php';

                            }else{
                                if(!empty($data["ministerio"]) && !empty($data["fecha"]) && !empty($data["institucion"])){
                                    $data['documentos']=$this->documento->getDocumentosForMinisterioFechaInstitucion($data["ministerio"],$data["fecha"],$data["institucion"]);
                                
                                    require_once 'views/documentos/resultsOfSearch.php';
    
                                }else{
                                    if(!empty($data["ministerio"]) && !empty($data["fecha"]) && !empty($data["autor"])){
                                        $data['documentos']=$this->documento->getDocumentosForMinisterioFechaAutor($data["ministerio"],$data["fecha"],$data["autor"]);

                                       // $data["autor"] = $this->documento->getNameAutor($data["autor"]);
                                    
                                        require_once 'views/documentos/resultsOfSearch.php';
        
                                    }else{
                                        if(!empty($data["ministerio"]) && !empty($data["fecha"]) && !empty($data["vigencia"]) && !empty($data["institucion"])){
                                            $data['documentos']=$this->documento->getDocumentosForMinisterioFechaVigenciaInstitucion($data["ministerio"],$data["fecha"],$data["vigencia"],$data["institucion"]);
                                        
                                            require_once 'views/documentos/resultsOfSearch.php';
            
                                        }else{
                                            if(!empty($data["ministerio"]) && !empty($data["fecha"]) && !empty($data["vigencia"]) && !empty($data["autor"])){
                                                $data['documentos']=$this->documento->getDocumentosForMinisterioFechaVigenciaAutor($data["ministerio"],$data["fecha"],$data["vigencia"],$data["autor"]);

                                                //$data["autor"] = $this->documento->getNameAutor($data["autor"]);
                                            
                                                require_once 'views/documentos/resultsOfSearch.php';
                
                                            }else{
                                                if(!empty($data["ministerio"]) && !empty($data["fecha"]) && !empty($data["vigencia"]) && !empty($data["institucion"]) && !empty($data["autor"])){
                                                    $data['documentos']=$this->documento->getDocumentosForMinisterioFechaVigenciaInstitucionAutor($data["ministerio"],$data["fecha"],$data["vigencia"],$data["institucion"],$data["autor"]);

                                                    //$data["autor"] = $this->documento->getNameAutor($data["autor"]);
                                                
                                                    require_once 'views/documentos/resultsOfSearch.php';
                    
                                                }else{
            if(!empty($data["fecha"]) && !empty($data["vigencia"])){
                $data['documentos']=$this->documento->getDocumentosForFechaVigencia($data["fecha"],$data["vigencia"]);
                                                                                                                                        
                require_once 'views/documentos/resultsOfSearch.php';
                                                                                                    
            }else{
                if(!empty($data["fecha"]) && !empty($data["institucion"])){
                    $data['documentos']=$this->documento->getDocumentosForFechaInstitucion($data["fecha"],$data["institucion"]);
                                                                                                                                            
                    require_once 'views/documentos/resultsOfSearch.php';
                                                                                                        
                }else{
                    if(!empty($data["fecha"]) && !empty($data["autor"])){
                        $data['documentos']=$this->documento->getDocumentosForFechaAutor($data["fecha"],$data["autor"]);
                        
                       // $data["autor"] = $this->documento->getNameAutor($data["autor"]);

                        require_once 'views/documentos/resultsOfSearch.php';
                                                                                                            
                    }else{
                        if(!empty($data["fecha"]) && !empty($data["vigencia"]) && !empty($data["institucion"])){
                            $data['documentos']=$this->documento->getDocumentosForFechaVigenciaInstitucion($data["fecha"],$data["vigencia"],$data["institucion"]);
                        
                            require_once 'views/documentos/resultsOfSearch.php';

                        }else{
                            if(!empty($data["fecha"]) && !empty($data["vigencia"]) && !empty($data["autor"])){
                                $data['documentos']=$this->documento->getDocumentosForFechaVigenciaAutor($data["fecha"],$data["vigencia"],$data["autor"]);

                               // $data["autor"] = $this->documento->getNameAutor($data["autor"]);
                            
                                require_once 'views/documentos/resultsOfSearch.php';
    
                            }else{
                                if(!empty($data["fecha"]) && !empty($data["vigencia"]) && !empty($data["institucion"]) && !empty($data["autor"])){
                                    $data['documentos']=$this->documento->getDocumentosForFechaVigenciaInstitucionAutor($data["fecha"],$data["vigencia"],$data["institucion"],$data["autor"]);

                                    //$data["autor"] = $this->documento->getNameAutor($data["autor"]);
                                
                                    require_once 'views/documentos/resultsOfSearch.php';
    
                                }else{
            if(!empty($data["vigencia"]) && !empty($data["institucion"])){
                $data['documentos']=$this->documento->getDocumentosForVigenciaInstitucion($data["vigencia"],$data["institucion"]);
                                                                                                                      
                require_once 'views/documentos/resultsOfSearch.php';
                                                                                                                            
            }else{
                if(!empty($data["vigencia"]) && !empty($data["autor"])){
                    $data['documentos']=$this->documento->getDocumentosForVigenciaAutor($data["vigencia"],$data["autor"]);

                    //$data["autor"] = $this->documento->getNameAutor($data["autor"]);
                                                                                                                      
                    require_once 'views/documentos/resultsOfSearch.php';
                                                                                                                          
                }else{
                    if(!empty($data["vigencia"]) && !empty($data["institucion"]) &&!empty($data["autor"])){
                        $data['documentos']=$this->documento->getDocumentosForVigenciaInstitucionAutor($data["vigencia"],$data["institucion"],$data["autor"]);

                        //$data["autor"] = $this->documento->getNameAutor($data["autor"]);
                                                                                                                   
                        require_once 'views/documentos/resultsOfSearch.php';
                                                                                                                        
                    }else{
                        if(!empty($data["institucion"]) && !empty($data["autor"])){
                            $data['documentos']=$this->documento->getDocumentosForInstitucionAutor($data["institucion"],$data["autor"]);

                           // $data["autor"] = $this->documento->getNameAutor($data["autor"]);

                            require_once 'views/documentos/resultsOfSearch.php';
                                                                                                                           
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

    