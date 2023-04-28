<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Ministerio de educación - Iniciar sesión</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header">
                                        <h3 class="text-center font-weight-light my-4">Iniciar sesión</h3>
                                        <?php if(isset($_SESSION['msj'])):?>
                                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                            
                                                *<small><?= $_SESSION['msj']; ?></small>
                                            </div>
                                            
                                        <?php session_unset(); endif ?>                                  
                                    </div>
                                    <div class="card-body">
                                        <form action="index.php?c=Documento&m=procesarLogin" method="POST" autocomplete="off">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputEmail" type="text" placeholder="Ingrese su usuario" name="usuario"/>
                                                <label for="inputEmail">Nombre de usuario</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputPassword" type="password" placeholder="Ingrese su contraseña" name="password"/>
                                                <label for="inputPassword">Contraseña<a href=""></a></label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                
                                                <a name="" id="" class="btn btn-secondary" href="index.php" role="button">Cancelar</a>

                                                <button type="submit" class="btn btn-primary">Acceder</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Monitos geek - ISFTA 2023</div>
                           
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
