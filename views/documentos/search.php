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
                                    <label for="titulo" class="form-label fw-bold">Tipo:</label>
                                    <select class="form-select form-select-md" name="titulo" id="titulo">
                                        <option value="none" selected disabled hidden>Título</option>
                                        <?php foreach($data['titulos'] as $titulo): ?>
                                        <option value="<?= $titulo['titulo']; ?>"><?= $titulo['titulo']; ?></option>
                                        <?php endforeach ?>
                                    </select>
                                </div>
                            </div>

                            <div class="col-6">
                                
                            </div>

                            <div class="col-12">
                                <div class="row">
                                <label for="" class="form-label fw-bold">Fecha:</label>

                                    <div class="col-2">
                                        <div class="mb-3">
                                            <select class="form-select form-select-md" name="dia" id="">
                                                <option value="none" selected disabled hidden>Día</option>
                                                <?php for($i=1; $i <= 31; $i++):?>
                                                    <option value="<?= $i; ?>"><?= $i;?></option>
                                                <?php endfor ?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-2">
                                        <div class="mb-3">

                                            <?php 
                                                $meses["01"]="Enero";
                                                $meses["02"]="Febrero";
                                                $meses["03"]="Marzo";
                                                $meses["04"]="Abril";
                                                $meses["05"]="Mayo";
                                                $meses["06"]="Junio";
                                                $meses["07"]="Julio";
                                                $meses["08"]="Agosto";
                                                $meses["09"]="Septiembre";
                                                $meses["10"]="Octubre";
                                                $meses["11"]="Noviembre";
                                                $meses["12"]="Diciembre";
                                            
                                            ?>


                                            <select class="form-select form-select-md" name="mes" id="">
                                                <option value="none" selected disabled hidden>Mes</option>
                                                <?php foreach($meses as $key => $mes): ?>
                                                    <option value="<?= $key; ?>"><?= $mes; ?></option>
                                                <?php endforeach ?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-2">
                                        <div class="mb-3">
                                            <select class="form-select form-select-md" name="anio" id="">
                                                <option value="none" selected disabled hidden>Año</option>
                                                <?php for($i=2023; $i >= 1995; $i--):?>
                                                <option value="<?= $i; ?>"><?= $i; ?></option>
                                                <?php endfor ?>
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


                            <div class="col-3 d-grid mt-3">
                                <button type="submit" class="btn btn-success">Buscar</button>
                            </div>
                        
                       
                        </form>
                    </div>


                    <div class="card-footer text-muted">
                      
                    </div>
                </div>
               
                
            </div>
        </div>

<?php require_once 'views/templates/footer.php'; ?>

