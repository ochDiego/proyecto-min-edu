<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Gestor de documentos</title>
    <link href="css/style.min.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/boxicons.min.css">

    <!-- Bootstrap CSS v5.2.1 and dataTables -->
    <link rel="stylesheet" href="css/jquery.dataTables.min.css">

    <!-- Select2 -->
    <link rel="stylesheet" href="css/select2.min.css">

    <!-- SweetAlert -->
    <script src="js/sweetalert2@11.js"></script>

    <script src="js/all.js" crossorigin="anonymous"></script>
    
    <!-- Custom Style -->
    <link rel="stylesheet" href="css/customStyle.css">
</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="index.php">Gestor de documentos</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                class="fas fa-bars"></i></button>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-auto me-0 me-md-3 my-2 my-md-0">
            <li class="nav-item dropdown">

            <?php if(isset($_SESSION['usuario']) && $_SESSION['usuario'] == "Administrador"):?>
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false">Administrador</a>
            <?php else: ?>

                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false">Acceso</a>

            <?php endif ?>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    
                    <?php if(!isset($_SESSION['usuario'])):?>
                        <li>
                            <a class="dropdown-item" href="index.php?c=Documento&m=login">Iniciar sesión</a></li>
                        <li>
                    <?php endif ?>

                    

                    </li>
                    <?php if(isset($_SESSION['usuario'])): ?>
                        <li>
                            <a class="dropdown-item" href="index.php?c=Documento&m=cerrar">Cerrar sesión</a>
                        </li>
                    <?php endif ?>
                </ul>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Sistema</div>

                            <a class="nav-link" href="index.php">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Ministerio de educación
                            </a>
                            

                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo"
                            data-bs-parent="#sidenavAccordion">
                            
                        </div>
                    </div>
                </div>
            </nav>
        </div>

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">