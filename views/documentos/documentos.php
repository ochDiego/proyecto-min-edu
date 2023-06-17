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
                <h2 class="text-center lead fs-3"><?= $data['titulo'] ?></h2>

                <?php if(isset($_SESSION['usuario']) && $_SESSION['usuario'] == "Administrador"):?>
                        <a name="" id="" class="btn btn-primary btn-sm" href="index.php?c=Documento&m=create" role="button">Nuevo registro</a>
                <?php endif ?>

                <a name="" id="" class="btn btn-secondary btn-sm" href="index.php?c=Documento&m=search" role="button">Busqueda avanzada</a>
            </div>
        </div>

       

        <div class="row my-3">
            <div class="col-12">

                    <div class="table-responsive-sm">
                        <table class="table table-striped table-bordered shadow-lg table-sm" style="width:100%">
                            <thead class="bg-dark text-white">
                                <tr>
                                    <th class="text-center align-middle" scope="col">Título</th>
                                    <th class="text-center align-middle" scope="col">Ministerio</th>
                                    <th class="text-center align-middle" scope="col">Fecha de suscripción</th>
                                    <th class="text-center align-middle" scope="col">Vigencia</th>
                                    <!-- <th class="text-center align-middle" scope="col">Ubicación</th> -->
                                    <th class="text-center align-middle" scope="col">Autor</th>
                                    <th class="text-center align-middle" scope="col" style="width: 100;">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                                    <?php foreach($data['documentos'] as $documento): ?>
                                        <tr class="">
                                            <td class="text-center align-middle" scope="row"><small><?= $documento['titulo']; ?></small></td>
                                            <td class="text-center align-middle"><small><?= $documento['ministerio']; ?></small></td>
                                            <td class="text-center align-middle"><small><?= modificarFecha($documento['fechaSuscripcion']); ?></small></td>
                                            <td class="text-center align-middle"><small><?= $documento['vigencia']; ?></small></td>
                                            
                                            <!-- <td class="text-center"><small><?php //$documento['ubicacion']; ?></small></td> -->
                                            <td class="text-center align-middle"><small><?= $documento['autor']; ?></small></td>
                                            <td class="text-center align-middle">
                                                
                                                <a name="" id="" class="btn btn-primary btn-sm d-block" href="index.php?c=Documento&m=show&id=<?= $documento['idDocumento'];?>&token=<?= hash_hmac('sha1',$documento['idDocumento'],KEY_TOKEN); ?>" role="button">Ver más</a>

                                                <a name="" id="" class="btn btn-secondary btn-sm px-4 d-block" href="assets/archivos/<?= $documento['archivoAdjunto']; ?>" target="_BLANK" role="button">PDF</a>

                                            <?php if(isset($_SESSION['usuario']) && $_SESSION['usuario'] == "Administrador"): ?>
                                                <a name="" id="" class="btn btn-info btn-sm d-block" href="index.php?c=Documento&m=edit&id=<?= $documento['idDocumento']; ?>&token=<?= hash_hmac('sha1',$documento['idDocumento'],KEY_TOKEN); ?>" role="button">Editar</a>
                                                
                                                <!-- Button trigger modal -->
                                                <a class="btn btn-danger btn-sm d-block" data-bs-toggle="modal" data-bs-target="#confirmarModal<?= $documento['idDocumento']; ?>">Eliminar</a>
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
                                
                            </tbody>
                        </table>
                    </div>
           
                
            </div>
        </div>

<?php require_once 'views/templates/footer.php'; ?>
<script src="js/dataTables.js"></script>


