<?php require_once 'views/templates/header.php'; ?>
           
<div id="layoutAuthentication_content">
                <main>
                    <div class="container py-5">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5 bg-dark">
                                    <div class="card-header">
                                        <h3 class="text-center text-light font-weight-light my-4">Iniciar sesión</h3>
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
                                                
                                                <!-- <a name="" id="" class="btn btn-secondary" href="index.php" role="button">Ir al sistema</a> -->

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



<?php require_once 'views/templates/footer.php'; ?>
