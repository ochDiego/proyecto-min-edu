<?php require_once 'views/templates/header.php'; ?>
    <?php if(isset($_SESSION['msj'])): ?>

        <script>
            Swal.fire({
            title: '<?= $_SESSION['msj']; ?>',
            icon: 'success'
            })
        </script>

    <?php session_unset(); endif ?>


        <div class="row my-3">
            <div class="col-12">
                
                   
                            <a name="" id="" class="btn btn-primary btn-sm" href="index.php" role="button">Documentos</a>

                            <a name="" id="" class="btn btn-secondary btn-sm px-4" href="assets/archivos/<?= $data['documento']['archivoAdjunto']; ?>" target="_BLANK"  role="button">PDF</a>
                       
                    
                
                <?php if(isset($_SESSION['usuario']) && $_SESSION['usuario'] == "Administrador"):?>

                    
                       
                            <a name="" id="" class="btn btn-primary btn-sm" href="index.php?c=Documento&m=create" role="button">Nuevo registro</a>
                
                            <a name="" id="" class="btn btn-info btn-sm" href="index.php?c=Documento&m=edit&id=<?= $data['id']; ?>&token=<?= hash_hmac('sha1',$data['id'],KEY_TOKEN); ?>" role="button">Editar</a>

                            <a class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#confirmarModal<?= $data['id']; ?>">Eliminar</a>
                       
                  
                                 
                <?php endif ?>
                    <!-- Modal -->
                    <div class="modal fade" id="confirmarModal<?= $data['id']; ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">¿Desea eliminar este registro?</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Una vez eliminado no se podrá recuperar el registro...
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                            
                                    <a name="" id="" class="btn btn-danger" href="index.php?c=Documento&m=destroy&id=<?= $data['id']; ?>&token=<?= hash_hmac('sha1',$data['id'],KEY_TOKEN); ?>" role="button">Confirmar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                


    
            </div>
        </div>
        <hr>
        <div class="row my-3">
            <div class="col-12">
                <h5><strong class="fw-bold fs-5">Carpeta:</strong> <?= $data['documento']['carpeta'] ?></h5>
                <h5><strong class="fw-bold fs-5">Folio:</strong> <?= $data['documento']['folio'] ?></h5>

                <h5><strong class="fw-bold fs-5">Autor institucional:</strong> <?= $data['documento']['ministerio'] ?></h5>
                <h5><strong class="fw-bold fs-5">Firmante:</strong> <?= $data['documento']['nombreAutor']; ?>, <?= $data['documento']['apellidoAutor']; ?></h5>
                <h5><strong class="fw-bold fs-5">Título:</strong> <?= $data['documento']['titulo'] ?></h5>

                <h5><strong class="fw-bold fs-5">Fecha de suscripción:</strong> <?=$data['documento']['fechaSuscripcion']; ?></h5>
                <h5><strong class="fw-bold fs-5">Vigencia:</strong> <?=$data['documento']['vigencia']; ?></h5>
            </div>
        </div>

<?php require_once 'views/templates/footer.php'; ?>



