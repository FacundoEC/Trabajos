<div class="modal fade" id="exampleModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Agregar empleado</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <@form action="agregar" method="POST">
                <div class="modal-body">

                    <div class="row">
                        <div class="col-12 form-floating mb-3">
                            <input type="text" name="nombre" class="form-control" id="nombre" required>
                            <label for="nombre">Nombre</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 form-floating mb-3">
                            <input type="text" name="apellido" class="form-control" id="apellido" required>
                            <label for="apellido">Apellido</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 form-floating mb-3">
                            <input type="date" name="fecha_alta" class="form-control" id="fecha_alta" required>
                            <label for="fecha_alta">Fecha Alta</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 form-floating mb-3">
                            <input type="text" name="mail_principal" class="form-control" id="mail_principal" required>
                            <label for="mail_principal">Mail principal</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 form-floating mb-3">
                            <input type="text" name="mail_secundario" class="form-control" id="mail_secundario"
                                required>
                            <label for="mail_secundario">Mail secundario</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 form-floating mb-3">
                            <input type="text" name="alias_e" class="form-control" id="alias_e" required>
                            <label for="alias_e">Alias</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 form-floating mb-3">
                            <input type="text" name="contrasenia" class="form-control" id="contrasenia" required>
                            <label for="contrasenia">Contrase&ntilde;a</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 form-floating mb-3">
                            <input type="text" name="nro_celular" class="form-control" id="nro_celular" required>
                            <label for=" nro_celular">Numero de Celular</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 form-floating mb-3">
                            <select class="form-select" name="id_tipo_usuario">

                                <#list tipoUsuarios as item>
                                    <option value="${item.id}">${item.nombre}</option>
                                </#list>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 container-fluid text-center d-grid mx-auto">
                            <button type="submit" class="btn btn-outline-dark">Agregar</button>
                        </div>
                    </div>

                </div>
            </@form>
        </div>
    </div>
</div>