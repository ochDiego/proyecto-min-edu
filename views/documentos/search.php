<!-- Opciones de buusqueda:
-Autor Institucional
-Titulo
-Fecha de suscripcion
-Vigencia: opciones desplegables -->

<?php require_once 'views/templates/header.php'; ?>
        <div class="row my-3">
            <div class="col-12">
                

                <a name="" id="" class="btn btn-primary btn-sm" href="index.php" role="button">Lista de documentos</a>
            </div>
        </div>

        <div class="row my-3">
            <div class="col-10 mx-auto py-3">

                <div class="card">
                    <div class="card-header">
                        <span class="fw-bold fs-4"><?= $data['titulo'] ?></span>
                    </div>
                    <div class="card-body">
                        <form action="index.php?c=Documento&m=resultsOfSearch" method="post" autocomplete="off" class="row">

                            <div class="col-6">
                                <div class="mb-3">
                                    <label for="titulo" class="form-label fw-bold">Tipo</label>
                                    <select class="form-select form-select-sm" name="titulo" id="titulo">
                                        <option value="none" selected disabled hidden>Título</option>
                                        <?php foreach($data['titulos'] as $titulo): ?>
                                            <option value="<?= $titulo['nombre']; ?>"><?= $titulo['nombre']; ?></option>
                                        <?php endforeach ?>
                                    </select>
                                </div>
                            </div>

                            <div class="col-6">
                                 
                                <div class="mb-3">
                                    <label for="titulo" class="form-label fw-bold">Ministerio</label>
                                    <select class="form-select form-select-sm" name="titulo" id="titulo">
                                        <option value="none" selected disabled hidden>Ministerios</option>
                                        <?php foreach($data['ministerios'] as $ministerio): ?>
                                            <option value="<?= $ministerio['nombre']; ?>"><?= $ministerio['nombre']; ?></option>
                                        <?php endforeach ?>
                                    </select>
                                </div>
                              
                            </div>

                            <div class="col-12">
                                <div class="row">                          
                                    <div class="col-3">
                                        <div class="mb-3">
                                            <label for="" class="form-label fw-bold">Fecha</label> 
                                            <select class="form-select form-select-sm" name="anio" id="">
                                                <option value="none" selected disabled hidden>Año</option>
                                                <?php for($i=2022; $i >= 1995; $i--):?>
                                                    <option value="<?= $i; ?>"><?= $i; ?></option>
                                                <?php endfor ?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-3">
                                        <div class="mb-3">
                                            <label for="titulo" class="form-label fw-bold">Vigencia</label>
                                            <select class="form-select form-select-sm" name="titulo" id="titulo">
                                                <option value="none" selected disabled hidden>Estado</option>
                                                <?php foreach($data['vigencias'] as $vigencia): ?>
                                                    <option value="<?= $vigencia['nombre']; ?>"><?= $vigencia['nombre']; ?></option>
                                                <?php endforeach ?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-6">
                                        <div class="mb-3">
                                            <label for="titulo" class="form-label fw-bold">Documento</label>
                                            <select class="form-select form-select-sm" name="titulo" id="titulo">
                                                <option value="none" selected disabled hidden>Tipo de documento</option>
                                                <?php foreach($data['tipoDocumentos'] as $tipoDocumento): ?>
                                                    <option value="<?= $tipoDocumento['nombre']; ?>"><?= $tipoDocumento['nombre']; ?></option>
                                                <?php endforeach ?>
                                            </select>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        
                            <!--  <div class="col-12">
                                    <div class="row">
                                        <span class="fw-bold fs-5 my-2">Vigencia</span>
                            

                                        <div class="col-6">
                                            <div class="mb-3">
                                                <label for="" class="form-label fw-bold">Otro:</label>
                                                <select class="form-select form-select-md" name="" id="">
                                                    <option selected>Año</option>
                                                    <option value="">New Delhi</option>
                                                    <option value="">Istanbul</option>
                                                    <option value="">Jakarta</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            -->


                          <div class="col-12">
                            <div class="row">
                                <div class="col-6">
                                    <div class="mb-3">
                                        <label for="titulo" class="form-label fw-bold">Firmante</label>
                                        <select class="form-select form-select-sm" name="titulo" id="titulo">
                                            <option value="none" selected disabled hidden>Nombre y apellido</option>
                                            <?php foreach($data['autores'] as $autor): ?>
                                                <option value="<?= $autor['firmante']; ?>"><?= $autor['firmante']; ?></option>
                                            <?php endforeach ?>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-6">
                                                
                                    <div class="row">
                                        <div class="col-12 d-flex justify-content-end">
                                            <a name="" id="" class="btn btn-danger mt-4 px-5" href="index.php?c=Documento&m=search" role="button">Cancelar</a>

                                            <button type="submit" class="btn btn-success mt-4 px-5"> <i class="fa fa-search"></i> Buscar</button>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                          </div>
                        
                       
                        </form>
                    </div>


                    <div class="card-footer text-muted">
                      
                    </div>
                </div>
               
                
            </div>
        </div>


       
         
<?php require_once 'views/templates/footer.php'; ?>

