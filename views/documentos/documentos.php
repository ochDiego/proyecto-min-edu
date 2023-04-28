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
                <h2 class="text-center lead"><?= $data['titulo'] ?></h2>

                <a name="" id="" class="btn btn-primary btn-sm" href="index.php?c=Documento&m=create" role="button">Nuevo registro</a>
            </div>
        </div>

        <div class="row my-3">
            <div class="col-12">
                <div class="table-responsive-sm">
                    <table class="table table-striped table-bordered shadow-lg table-sm" style="width:100%">
                        <thead class="bg-dark text-white">
                            <tr>
                                <th class="text-center" scope="col">Título</th>
                                <th class="text-center" scope="col">Expte</th>
                                <th class="text-center" scope="col">Término propuesto</th>
                                <th class="text-center" scope="col">Ubicación</th>
                                <th class="text-center" scope="col">Autor</th>
                                <th class="text-center" scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if(count($data['documentos']) > 0){ ?>
                                <?php foreach($data['documentos'] as $documento): ?>
                                    <tr class="">
                                        <td class="text-center" scope="row"><?= $documento['titulo']; ?></td>
                                        <td class="text-center"><?= $documento['expediente']; ?></td>
                                        <td class="text-center"><?= $documento['terminoPropuesto']; ?></td>
                                        <td class="text-center"><?= $documento['ubicacion']; ?></td>
                                        <td class="text-center"><?= $documento['autor']; ?></td>
                                        <td class="text-center">

                                            <a name="" id="" class="btn btn-primary btn-sm" href="index.php?c=Documento&m=show&id=<?= $documento['idDocumento'];?>&token=<?= hash_hmac('sha1',$documento['idDocumento'],KEY_TOKEN); ?>" role="button">Ver</a>

                                        <?php if(isset($_SESSION['usuario'])): ?>
                                            <a name="" id="" class="btn btn-info btn-sm" href="index.php?c=Documento&m=edit&id=<?= $documento['idDocumento']; ?>&token=<?= hash_hmac('sha1',$documento['idDocumento'],KEY_TOKEN); ?>" role="button">Editar</a>
                                            
                                            <!-- Button trigger modal -->
                                            <a class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#confirmarModal<?= $documento['idDocumento']; ?>">Eliminar</a>
                                        <?php endif ?>
                                            <!-- Modal -->
                                            <div class="modal fade" id="confirmarModal<?= $documento['idDocumento']; ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                                        
                                                        <a name="" id="" class="btn btn-danger" href="index.php?c=Documento&m=destroy&id=<?= $documento['idDocumento']; ?>&token=<?= hash_hmac('sha1',$documento['idDocumento'],KEY_TOKEN); ?>" role="button">Confirmar</a>
                                                    </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            <?php }else{ ?>
                                    <tr>
                                        <td colspan="6" class="text-center">No hay datos actualmente</td>
                                    </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
                
            </div>
        </div>

<?php require_once 'views/templates/footer.php'; ?>
<script src="js/dataTables.js"></script>

