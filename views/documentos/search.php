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
                        <form action="index.php?c=Documento&m=resultsOfSearch" method="POST" autocomplete="off" class="row">

                            <div class="col-6">

                                <div class="mb-3">
                                    <label for="titulo" class="form-label fw-bold">Título</label>
                                    <input name="titulo" type="list" list="titulos" class="form-control">

                                    <datalist id="titulos">
                                        <?php foreach($data['titulos'] as $titulo): ?>
                                            <option value="<?= $titulo['nombre']; ?>"></option>
                                        <?php endforeach ?>
                                    </datalist>

                                </div>


                            </div>

                            <div class="col-6">

                                <div class="mb-3">
                                    <label for="ministerio" class="form-label fw-bold">Ministerio</label>
                                    <input id="ministerio" name="ministerio" type="list" list="ministerios" class="form-control">

                                    <datalist id="ministerios">
                                        <?php foreach($data['ministerios'] as $ministerio): ?>
                                            <option value="<?= $ministerio['nombre']; ?>"></option>
                                        <?php endforeach ?>
                                    </datalist>

                                </div>
                                
                              
                            </div>

                            <div class="col-12">
                                <div class="row">                          
                                    <div class="col-3">
                                        <div class="mb-3">
                                            <label for="fecha" class="form-label fw-bold">Fecha</label> 
                                            <select class="form-select form-select-sm" name="fecha" id="fecha">
                                                <option value="none" selected disabled hidden>Año</option>
                                                <?php for($i=2023; $i >= 1995; $i--):?>
                                                    <option value="<?= $i; ?>"><?= $i; ?></option>
                                                <?php endfor ?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-3">
                                        <div class="mb-3">
                                            <label for="vigencia" class="form-label fw-bold">Vigencia</label>
                                            <select class="form-select form-select-sm" name="vigencia" id="vigencia">
                                                <option value="none" selected disabled hidden>Estado</option>
                                                <?php foreach($data['vigencias'] as $vigencia): ?>
                                                    <option value="<?= $vigencia['nombre']; ?>"><?= $vigencia['nombre']; ?></option>
                                                <?php endforeach ?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-6">

                                        <div class="mb-3">
                                            <label for="institucion" class="form-label fw-bold">Institución</label>
                                            <input id="institucion" name="institucion" type="list" list="instituciones" class="form-control">

                                            <datalist id="instituciones">
                                                <?php foreach($data['instituciones'] as $institucion): ?>
                                                    <option value="<?= $institucion['nombre']; ?>"></option>
                                                <?php endforeach ?>
                                            </datalist>
                                        </div>

                                    </div>

                                </div>
                            </div>
   
                          <div class="col-12">
                            <div class="row">
                                <div class="col-6">

                                    <div class="mb-3">
                                        <label for="autor" class="form-label fw-bold">Firmante</label>
                                        <input id="autor" name="autor" type="list" list="autores" class="form-control">

                                        <datalist id="autores">
                                            <?php foreach($data['autores'] as $autor): ?>
                                                <option value="<?= $autor['id']; ?>"><?= $autor['firmante']; ?></option>
                                            <?php endforeach ?>
                                        </datalist>
                                    </div>


                                </div>

                                <div class="col-6">
                                                
                                    <div class="row">
                                        <div class="col-12 d-flex justify-content-evenly">
                                            <a name="" id="" class="btn btn-danger mt-4 px-5 " href="index.php?c=Documento&m=search" role="button">Cancelar</a>

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

        <!-- HAY QUE AGREGAR EL AUTOR Y LA ENTIDAD A LA TABLA DOCUMENTO -->

       
         
<?php require_once 'views/templates/footer.php'; ?>

