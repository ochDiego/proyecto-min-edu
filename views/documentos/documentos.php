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
                <h1 class="text-center"><?= $data['titulo'] ?></h1>

                <a name="" id="" class="btn btn-primary" href="index.php?c=Documento&m=create" role="button">Nuevo registro</a>
            </div>
        </div>

        <div class="row my-3">
            <div class="col-12">
                <div class="table-responsive-sm">
                    <table class="table table-striped table-bordered table-sm">
                        <thead class="table-dark">
                            <tr>
                                <th class="text-center" scope="col">Título</th>
                                <th class="text-center" scope="col">Expte</th>
                                <th class="text-center" scope="col">Término propuesto</th>
                                <th class="text-center" scope="col">Ubicación</th>
                                <th class="text-center" scope="col">Responsable</th>
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
                                        <td class="text-center"><?= $documento['responsable']; ?></td>
                                        <td class="text-center">
                                            <a name="" id="" class="btn btn-info btn-sm" href="#" role="button">Editar</a>
                                            <a name="" id="" class="btn btn-danger btn-sm" href="#" role="button">Eliminar</a>
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
<script src="assets/js/dataTables.js"></script>

