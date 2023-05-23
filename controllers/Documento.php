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

                                            $idDocumento=$this->documento->insertDocumento($titulo,$expediente,$idMencionResp,$fechaSuscripcion,$idDescripFisica,$idNotas,$terminoPropuesto,$idUbicacion,$responsable,$nombreDocumento);

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
                                        $updateDocumento=$this->documento->updateDocumento($documentoID,$titulo,$expediente,$fechaSuscripcion,$terminoPropuesto,$responsable);
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
    }

    