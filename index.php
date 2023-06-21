<?php

    require_once 'assets/config/config.php';
    require_once 'assets/core/routes.php';
    require_once 'assets/config/Database.php';
    require_once 'controllers/Documento.php';

    if(!empty($_GET['c'])){
        $controlador=cargarControlador($_GET['c']);
        if(isset($_GET['m'])){
            if(isset($_GET['id'])){
                if(isset($_GET['token'])){
                    cargarMetodo($controlador,$_GET['m'],$_GET['id'],$_GET['token']);
                }else{
                    cargarMetodo($controlador,$_GET['m'],$_GET['id']);
                }
            }else{
                cargarMetodo($controlador,$_GET['m']);
            }
        }else{
            cargarMetodo($controlador,METODO_PRINCIPAL);
        }
    }else{
        $controlador=cargarControlador(CONTROLADOR_PRINCIPAL);
        $controlador->{METODO_PRINCIPAL}();
    }