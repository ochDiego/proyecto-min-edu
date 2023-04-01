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
    }