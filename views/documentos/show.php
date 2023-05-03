<?php require_once 'views/templates/header.php'; ?>

        <div class="row my-3">
            <div class="col-12">
                <a name="" id="" class="btn btn-primary btn-sm" href="index.php" role="button">Documentos</a>

                <a name="" id="" class="btn btn-danger btn-sm px-4" href="assets/archivos/<?= $data['documento']['archivoAdjunto']; ?>" target="_BLANK"  role="button">pdf</a>
                
                
                <?php if(isset($_SESSION['usuario'])):?>
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
            <h5><strong class="lead">Título:</strong> <?= $data['documento']['titulo'] ?></h5>
            <h5><strong class="lead">Expediente:</strong> <?= $data['documento']['expediente'] ?></h5>

            <h5><strong class="lead">Fecha de suscripción:</strong> <?= modificarFecha($data['documento']['fechaSuscripcion']); ?></h5>
            <h5><strong class="lead">Nombre del autor:</strong> <?= $data['documento']['nombreAutor']; ?> <?= $data['documento']['apellidoAutor']; ?></h5>
            <hr>
            <h5><strong class="lead">Entidad:</strong> <?= $data['documento']['entidad'] ?></h5>
            <h5><strong class="lead">Formato:</strong> <?= $data['documento']['formato'] ?></h5>
            <h5><strong class="lead">Número de hojas:</strong> <?= $data['documento']['numHojas'] ?></h5>
            <h5><strong class="lead">Número de páginas:</strong> <?= $data['documento']['numPag'] ?></h5>
            <h5><strong class="lead">Otros:</strong> <?= $data['documento']['otros'] ?></h5>
            <hr>
            <h5><strong class="lead">Documento vinculado:</strong> <?= $data['documento']['doc_vinculado'] ?></h5>
            <h5><strong class="lead">Lugar de radacción:</strong> <?= $data['documento']['lugar_redaccion'] ?></h5>
            <h5><strong class="lead">Naturaleza, alcance y forma:</strong> <?= $data['documento']['naturaleza_alcance_forma'] ?></h5>
            <h5><strong class="lead">Nota contenido:</strong> <?= $data['documento']['nota_contenido'] ?></h5>
            <h5><strong class="lead">Número de decreto:</strong> <?= $data['documento']['numero_decreto'] ?></h5>
            <h5><strong class="lead">Objeto:</strong> <?= $data['documento']['objeto'] ?></h5>
            <h5><strong class="lead">Aprobado por ley:</strong> <?= $data['documento']['aprobado_ley'] ?></h5>
            <hr>
            <h5><strong class="lead">Vigencia:</strong> <?= $data['documento']['doc_vinculado'] ?></h5>
            <h5><strong class="lead">Término propuesto:</strong> <?= $data['documento']['lugar_redaccion'] ?></h5>
            <h5><strong class="lead">Carpeta:</strong> <?= $data['documento']['naturaleza_alcance_forma'] ?></h5>
            <h5><strong class="lead">Folio:</strong> <?= $data['documento']['nota_contenido'] ?></h5>
            <h5><strong class="lead">Responsable:</strong> <?= $data['documento']['numero_decreto'] ?></h5>

               
            </div>
        </div>

<?php require_once 'views/templates/footer.php'; ?>



