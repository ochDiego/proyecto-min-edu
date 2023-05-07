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

                    <a name="" id="" class="btn btn-danger btn-sm px-4" href="assets/archivos/<?= $data['documento']['archivoAdjunto']; ?>" target="_BLANK"  role="button">pdf</a>
                
                <?php if(isset($_SESSION['usuario']) && $_SESSION['usuario'] == "Administrador"):?>
                
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
            <h5><strong class="fw-bold fs-5">Título:</strong> <?= $data['documento']['titulo'] ?></h5>
            <h5><strong class="fw-bold fs-5">Expediente:</strong> <?= $data['documento']['expediente'] ?></h5>

            <h5><strong class="fw-bold fs-5">Fecha de suscripción:</strong> <?= modificarFecha($data['documento']['fechaSuscripcion']); ?></h5>
            <h5><strong class="fw-bold fs-5">Nombre del autor:</strong> <?= $data['documento']['nombreAutor']; ?> <?= $data['documento']['apellidoAutor']; ?></h5>
            <hr>
            <h5><strong class="fw-bold fs-5">Entidad:</strong> <?= $data['documento']['entidad'] ?></h5>
            <h5><strong class="fw-bold fs-5">Formato:</strong> <?= $data['documento']['formato'] ?></h5>
            <h5><strong class="fw-bold fs-5">Número de hojas:</strong> <?= $data['documento']['numHojas'] ?></h5>
            <h5><strong class="fw-bold fs-5">Número de páginas:</strong> <?= $data['documento']['numPag'] ?></h5>
            <h5><strong class="fw-bold fs-5">Otros:</strong> <?= $data['documento']['otros'] ?></h5>
            <hr>
            <h5><strong class="fw-bold fs-5">Documento vinculado:</strong> <?= $data['documento']['doc_vinculado'] ?></h5>
            <h5><strong class="fw-bold fs-5">Lugar de radacción:</strong> <?= $data['documento']['lugar_redaccion'] ?></h5>
            <h5><strong class="fw-bold fs-5">Naturaleza, alcance y forma:</strong> <?= $data['documento']['naturaleza_alcance_forma'] ?></h5>
            <h5><strong class="fw-bold fs-5">Nota contenido:</strong> <?= $data['documento']['nota_contenido'] ?></h5>
            <h5><strong class="fw-bold fs-5">Número de decreto:</strong> <?= $data['documento']['numero_decreto'] ?></h5>
            <h5><strong class="fw-bold fs-5">Objeto:</strong> <?= $data['documento']['objeto'] ?></h5>
            <h5><strong class="fw-bold fs-5">Aprobado por ley:</strong> <?= $data['documento']['aprobado_ley'] ?></h5>
            <hr>
            <h5><strong class="fw-bold fs-5">Vigencia:</strong> <?= $data['documento']['doc_vinculado'] ?></h5>
            <h5><strong class="fw-bold fs-5">Término propuesto:</strong> <?= $data['documento']['lugar_redaccion'] ?></h5>
            <h5><strong class="fw-bold fs-5">Carpeta:</strong> <?= $data['documento']['naturaleza_alcance_forma'] ?></h5>
            <h5><strong class="fw-bold fs-5">Folio:</strong> <?= $data['documento']['nota_contenido'] ?></h5>
            <h5><strong class="fw-bold fs-5">Responsable:</strong> <?= $data['documento']['numero_decreto'] ?></h5>

               
            </div>
        </div>

<?php require_once 'views/templates/footer.php'; ?>



