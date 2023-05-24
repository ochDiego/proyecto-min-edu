<?php require_once 'views/templates/header.php'; ?>
        <div class="row my-3">
            <div class="col-12">
                <h2 class="text-center lead fs-3"><?= $data['titulo'] ?></h2>

                <a name="" id="" class="btn btn-primary btn-sm" href="index.php" role="button">Lista de documentos</a>
            </div>
        </div>

        <div class="row my-3">
            <div class="col-12">

                <?php if(isset($_SESSION['msj'])): ?>

                    <div class="alert alert-<?= $_SESSION['msj_type']; ?> alert-dismissible fade show" role="alert">
                      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    
                      <small><?= $_SESSION['msj']; ?></small>
                    </div>
                    

                <?php session_unset(); endif ?>
               
                <div class="card">
                    <div class="card-header">
                        Datos del documento
                    </div>
                    <div class="card-body">
                       <form class="row" action="index.php?c=Documento&m=store" method="POST" autocomplete="off" enctype="multipart/form-data">
                            <div class="col-3">
                                <div class="mb-3">
                                  <label for="titulo" class="form-label">Título:</label>
                                  <input type="text" name="titulo" id="titulo" class="form-control" placeholder="Ingrse el título" aria-describedby="helpId" autofocus required>
                                </div>
                            </div>

                            <div class="col-3">
                                <div class="mb-3">
                                  <label for="expediente" class="form-label">Expediente:</label>
                                  <input type="text" name="expediente" id="expediente" class="form-control" placeholder="Ingrese el expediente" aria-describedby="helpId" required>
                                </div>
                            </div>

                            <div class="col-3">
                                <div class="mb-3">
                                  <label for="nombreAutor" class="form-label">Nombre del autor:</label>
                                  <input type="text" name="nombreAutor" id="nombreAutor" class="form-control" placeholder="Ingrese el nombre" aria-describedby="helpId" required>
                                </div>
                            </div>

                            <div class="col-3">
                                <div class="mb-3">
                                  <label for="apellidoAutor" class="form-label">Apellido del autor:</label>
                                  <input type="text" name="apellidoAutor" id="apellidoAutor" class="form-control" placeholder="Ingrese el apellido" aria-describedby="helpId" required>
                                </div>
                            </div>

                            <div class="col-3">
                                <div class="mb-3">
                                  <label for="entidad" class="form-label">Entidad:</label>
                                  <input type="text" name="entidad" id="entidad" class="form-control" placeholder="Ingrese la entidad" aria-describedby="helpId" required>
                                </div>
                            </div>

                            <div class="col-3">
                                <div class="row">
                                  <label for="" class="mb-2">Fecha de suscripción:</label>
                                  <div class="col-4">
                                    <div class="mb-3">
                                      <select class="form-select form-select" name="dia" id="">
                                        <option selected>Día</option>
                                        <option value="">New Delhi</option>
                                        <option value="">Istanbul</option>
                                        <option value="">Jakarta</option>
                                      </select>
                                    </div>
                                  </div>
                                  <div class="col-4">
                                    <div class="mb-3">
                                    <select class="form-select form-select" name="mes" id="">
                                        <option selected>Mes</option>
                                        <option value="">New Delhi</option>
                                        <option value="">Istanbul</option>
                                        <option value="">Jakarta</option>
                                      </select>
                                    </div>
                                  </div>
                                  <div class="col-4">
                                    <div class="mb-3">
                                    <select class="form-select form-select" name="anio" id="">
                                        <option selected>Año</option>
                                        <option value="">New Delhi</option>
                                        <option value="">Istanbul</option>
                                        <option value="">Jakarta</option>
                                      </select>
                                    </div>
                                  </div>
                                </div>




                                <!-- <div class="mb-3">
                                  <label for="fechaSuscripcion" class="form-label">Fecha de suscripción:</label>
                                  <input type="date" name="fechaSuscripcion" id="fechaSuscripcion" class="form-control" placeholder="Ingrese la fecha" aria-describedby="helpId" required>
                                </div> -->
                            </div>

                             <div class="col-2">
                                <div class="mb-3">
                                  <label for="numPag" class="form-label">Número de paginas:</label>
                                  <input type="number" name="numPag" id="numPag" class="form-control" placeholder="Ingrese el número" aria-describedby="helpId" required>
                                </div>
                            </div>

                            <div class="col-2">
                                <div class="mb-3">
                                  <label for="numHojas" class="form-label">Número de hojas:</label>
                                  <input type="number" name="numHojas" id="numHojas" class="form-control" placeholder="Ingrese el número" aria-describedby="helpId" required>
                                </div>
                            </div>

                            <div class="col-2">
                                <div class="mb-3">
                                  <label for="otros" class="form-label">Otros:</label>
                                  <input type="text" name="otros" id="otros" class="form-control" placeholder="Otros..." aria-describedby="helpId" required>
                                </div>
                            </div>

                            <div class="col-2">
                                <div class="mb-3">
                                  <label for="formato" class="form-label">Formato:</label>
                                  <input type="text" name="formato" id="formato" class="form-control" placeholder="Ingrese el formato" aria-describedby="helpId" required>
                                </div>
                            </div>

                            <div class="col-2">
                                <div class="mb-3">
                                  <label for="objeto" class="form-label">Objeto:</label>
                                  <input type="text" name="objeto" id="objeto" class="form-control" placeholder="Ingrese el objeto" aria-describedby="helpId" required>
                                </div>
                            </div>

                            <div class="col-3">
                                <div class="mb-3">
                                  <label for="docVinculado" class="form-label">Documento vínculado:</label>
                                  <input type="text" name="docVinculado" id="docVinculado" class="form-control" placeholder="Ingrese el documento" aria-describedby="helpId" required>
                                </div>
                            </div>

                            <div class="col-3">
                                <div class="mb-3">
                                  <label for="notaContenido" class="form-label">Nota contenido:</label>
                                  <input type="text" name="notaContenido" id="notaContenido" class="form-control" placeholder="Ingrese la nota" aria-describedby="helpId" required>
                                </div>
                            </div>

                            <div class="col-2">
                                <div class="mb-3">
                                  <label for="lugarRedaccion" class="form-label">Lugar de redacción:</label>
                                  <input type="text" name="lugarRedaccion" id="lugarRedaccion" class="form-control" placeholder="Ingrese el lugar" aria-describedby="helpId" required>
                                </div>
                            </div>

                            <div class="col-3">
                                <div class="mb-3">
                                  <label for="natuAlcanceForma" class="form-label">Naturaleza-Alcance-Forma:</label>
                                  <input type="text" name="natuAlcanceForma" id="natuAlcanceForma" class="form-control" placeholder="Ingrese su naturaleza,alcance y forma" aria-describedby="helpId" required>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="mb-3">
                                  <label for="vigencia" class="form-label">Vigencia:</label>
                                  <input type="date" name="vigencia" id="vigencia" class="form-control" placeholder="Ingrese su naturaleza,alcance y forma" aria-describedby="helpId" required>
                                </div>
                            </div>

                            <div class="col-2">
                                <div class="mb-3">
                                  <label for="numDecreto" class="form-label">Número de decreto:</label>
                                  <input type="number" name="numDecreto" id="numDecreto" class="form-control" placeholder="Ingrese el número" aria-describedby="helpId" required>
                                </div>
                            </div>

                            <div class="col-2">
                                <div class="mb-3">
                                  <label for="aprobLey" class="form-label">Aprobado por ley:</label>
                                  <input type="number" name="aprobLey" id="aprobLey" class="form-control" placeholder="Ingrese el número" aria-describedby="helpId" required>
                                </div>
                            </div>

                            <div class="col-3">
                                <div class="mb-3">
                                  <label for="terminoPropuesto" class="form-label">Término propuesto:</label>
                                  <input type="text" name="terminoPropuesto" id="terminoPropuesto" class="form-control" placeholder="Ingrese el término" aria-describedby="helpId" required>
                                </div>
                            </div>

                            <div class="col-3">
                                <div class="mb-3">
                                  <label for="carpeta" class="form-label">Carpeta:</label>
                                  <input type="text" name="carpeta" id="carpeta" class="form-control" placeholder="Ingrese la carpeta" aria-describedby="helpId" required>
                                </div>
                            </div>

                            <div class="col-3">
                                <div class="mb-3">
                                  <label for="folio" class="form-label">Folio:</label>
                                  <input type="text" name="folio" id="folio" class="form-control" placeholder="Ingrese el folio" aria-describedby="helpId" required>
                                </div>
                            </div>

                            <div class="col-3">
                                <div class="mb-3">
                                  <label for="documento" class="form-label">Documento:</label>
                                  <input type="file" name="documento" id="documento" class="form-control" placeholder="Adjunte el archivo" aria-describedby="helpId" required>
                                </div>
                            </div>

                            <div class="col-3">
                                <div class="mb-3">
                                  <label for="responsable" class="form-label">Responsable:</label>
                                  <input type="text" name="responsable" id="responsable" class="form-control" placeholder="Ingrese el nombre y apellido" aria-describedby="helpId"  required>
                                </div>
                            </div>

                            <div class="col-3">
                                <div class="mb-3">
                                  <label for="autorInstitucional" class="form-label">Autor institucional:</label>
                                  <input type="text" name="autorInstitucional" id="autorInstitucional" class="form-control" placeholder="Ingrese la carpeta" aria-describedby="helpId">
                                </div>
                            </div>

                            <div class="col-3">
                                <div class="mb-3">
                                  <label for="terminoControlado" class="form-label">Término controlado:</label>
                                  <input type="text" name="terminoControlado" id="terminoControlado" class="form-control" placeholder="Ingrese la carpeta" aria-describedby="helpId">
                                </div>
                            </div>

                            <div class="col-3">

                            </div>
                            <div class="col-3">
                              
                            </div>

                            <div class="d-grid col-4 mx-auto">
                                <button type="submit" class="btn btn-success">Guardar</button>
                            </div>

                           
                       </form>
                    </div>
                    <div class="card-footer text-muted">
                        
                    </div>
                </div>
                
            </div>
        </div>

<?php require_once 'views/templates/footer.php'; ?>

