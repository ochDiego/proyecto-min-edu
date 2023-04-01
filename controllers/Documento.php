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
    }