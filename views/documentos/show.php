<?php require_once 'views/templates/header.php'; ?>

        <div class="row my-3">
            <div class="col-12">
                <a name="" id="" class="btn btn-primary" href="index.php" role="button">Lista de documentos</a>

    
            </div>
        </div>

        <div class="row my-3">
            <div class="col-12">
            <h5><strong>Título:</strong> <?= $data['documento']['titulo'] ?></h5>
            <h5><strong>Expediente:</strong> <?= $data['documento']['expediente'] ?></h5>
            <h5><strong>Fecha de suscripción:</strong> <?= $data['documento']['fechaSuscripcion'] ?></h5>
            <h5><strong>Nombre del autor:</strong> <?= $data['documento']['nombreAutor']; ?> <?= $data['documento']['apellidoAutor']; ?></h5>
            <hr>
        
               
            </div>
        </div>

<?php require_once 'views/templates/footer.php'; ?>