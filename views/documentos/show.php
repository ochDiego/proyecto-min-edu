<?php require_once 'views/templates/header.php'; ?>

        <div class="row my-3">
            <div class="col-12">
                <a name="" id="" class="btn btn-primary btn-sm" href="index.php" role="button">Documentos</a>
                <a name="" id="" class="btn btn-info btn-sm" href="index.php" role="button">Editar</a>
                <a name="" id="" class="btn btn-danger btn-sm" href="index.php" role="button">Eliminar</a>              

    
            </div>
        </div>
        <hr>
        <div class="row my-3">
            <div class="col-12">
            <h5><strong>Título:</strong> <?= $data['documento']['titulo'] ?></h5>
            <h5><strong>Expediente:</strong> <?= $data['documento']['expediente'] ?></h5>
            <h5><strong>Fecha de suscripción:</strong> <?= $data['documento']['fechaSuscripcion'] ?></h5>
            <h5><strong>Nombre del autor:</strong> <?= $data['documento']['nombreAutor']; ?> <?= $data['documento']['apellidoAutor']; ?></h5>
            <hr>
            <h5><strong>Entidad:</strong> <?= $data['documento']['entidad'] ?></h5>
            <h5><strong>Formato:</strong> <?= $data['documento']['formato'] ?></h5>
            <h5><strong>Número de hojas:</strong> <?= $data['documento']['numHojas'] ?></h5>
            <h5><strong>Número de páginas:</strong> <?= $data['documento']['numPag'] ?></h5>
            <h5><strong>Otros:</strong> <?= $data['documento']['otros'] ?></h5>
            <hr>
            <h5><strong>Documento vinculado:</strong> <?= $data['documento']['doc_vinculado'] ?></h5>
            <h5><strong>Lugar de radacción:</strong> <?= $data['documento']['lugar_redaccion'] ?></h5>
            <h5><strong>Naturaleza, alcance y forma:</strong> <?= $data['documento']['naturaleza_alcance_forma'] ?></h5>
            <h5><strong>Nota contenido:</strong> <?= $data['documento']['nota_contenido'] ?></h5>
            <h5><strong>Número de decreto:</strong> <?= $data['documento']['numero_decreto'] ?></h5>
            <h5><strong>Objeto:</strong> <?= $data['documento']['objeto'] ?></h5>
            <h5><strong>Aprobado por ley:</strong> <?= $data['documento']['aprobado_ley'] ?></h5>
            <hr>
            <h5><strong>Vigencia:</strong> <?= $data['documento']['doc_vinculado'] ?></h5>
            <h5><strong>Término propuesto:</strong> <?= $data['documento']['lugar_redaccion'] ?></h5>
            <h5><strong>Carpeta:</strong> <?= $data['documento']['naturaleza_alcance_forma'] ?></h5>
            <h5><strong>Folio:</strong> <?= $data['documento']['nota_contenido'] ?></h5>
            <h5><strong>Responsable:</strong> <?= $data['documento']['numero_decreto'] ?></h5>

               
            </div>
        </div>

<?php require_once 'views/templates/footer.php'; ?>