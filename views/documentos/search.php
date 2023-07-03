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
                                    <div class="mb-3">
                                        <label for="tituloBuscador" class="form-label">Título</label>
                                        <select class="form-select form-select-sm" name="titulo" id="tituloBuscador">
                                            
                                            <option value="none" selected disabled hidden></option>

                                            <?php foreach($data['titulos'] as $titulo): ?>
                                                <option value="<?= $titulo['nombre']; ?>"><?= $titulo['nombre']; ?></option>
                                            <?php endforeach ?>

                                        </select>
                                    </div>
                                </div>


                            </div>

                            <div class="col-6">


                                <div class="mb-3">
                                    <div class="mb-3">
                                        <label for="ministerioBuscador" class="form-label">Ministerio</label>
                                        <select class="form-select form-select-sm" name="ministerio" id="ministerioBuscador">
                                            
                                            <option value="none" selected disabled hidden></option>

                                            <?php foreach($data['ministerios'] as $ministerio): ?>
                                                <option value="<?= $ministerio['nombre']; ?>"><?= $ministerio['nombre']; ?></option>
                                            <?php endforeach ?>

                                        </select>
                                    </div>
                                </div>

                              
                            </div>

                            <div class="col-12">
                                <div class="row">                          
                                    <div class="col-3">
                                        <div class="mb-3">
                                            <label for="fechaBuscador" class="form-label">Año</label> 
                                            <select class="form-select form-select-sm" name="fecha" id="fechaBuscador">
                                                <option value="none" selected disabled hidden></option>
                                                <?php for($i=2023; $i >= 1995; $i--):?>
                                                    <option value="<?= $i; ?>"><?= $i; ?></option>
                                                <?php endfor ?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-3">
                                        <div class="mb-3">
                                            <label for="vigenciaBuscador" class="form-label">Vigencia</label>
                                            <select class="form-select form-select-sm" name="vigencia" id="vigenciaBuscador">
                                                <option value="none" selected disabled hidden></option>
                                                <?php foreach($data['vigencias'] as $vigencia): ?>
                                                    <option value="<?= $vigencia['nombre']; ?>"><?= $vigencia['nombre']; ?></option>
                                                <?php endforeach ?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-6">

                                        <div class="mb-3">
                                           
                                            <label for="institucionBuscador" class="form-label">Institución</label>
                                            <select class="form-select form-select-sm" name="institucion" id="institucionBuscador">
                                                    
                                                <option value="none" selected disabled hidden></option>

                                                <?php foreach($data['instituciones'] as $institucion): ?>
                                                    <option value="<?= $institucion['nombre']; ?>"><?= $institucion['nombre']; ?></option>
                                                <?php endforeach ?>

                                            </select>
                                           
                                        </div>

                                    </div>

                                </div>
                            </div>
   
                          <div class="col-12">
                            <div class="row">
                                <div class="col-6">

                                    <div class="mb-3">

                                        <label for="autorBuscador" class="form-label">Firmante</label>
                                        <select class="form-select form-select-sm" name="autor" id="autorBuscador">
                                                    
                                            <option value="none" selected disabled hidden></option>

                                            <?php foreach($data['autores'] as $autor): ?>
                                                <option value="<?= $autor['id']; ?>"><?= $autor['firmante']; ?></option>
                                            <?php endforeach ?>

                                        </select>

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

<script>
    $(document).ready(function(){
        $('#tituloBuscador').select2();
    })

    $(document).ready(function(){
        $('#ministerioBuscador').select2();
    })

    $(document).ready(function(){
        $('#institucionBuscador').select2();
    })

    $(document).ready(function(){
        $('#autorBuscador').select2();
    })

    $(document).ready(function(){
        $('#fechaBuscador').select2();
    })

    $(document).ready(function(){
        $('#vigenciaBuscador').select2();
    })
</script>

