<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
</head>

<body>
    <div class="container">
        <a href="${context_path}/empleado"><button type="submit" class="btn btn-outline-info">Volver a la lista de
                empleados</button></a>
        <h2>Modificar Empleado</h2>

        <form method="POST" action="${context_path}/empleado/procesomod/${usuarios.id}">

            <div class="row">
                <div class="col-12 form-floating mb-3">

                    <input type="text" name="nombre" class="form-control" id="nombre" value="${usuarios.nombre}"
                        required>
                    <label for="nombre">Nombre</label>
                </div>
            </div>
            <div class="row">
                <div class="col-12 form-floating mb-3">
                    <input type="text" name="apellido" class="form-control" id="apellido" value="${usuarios.apellido}"
                        required>
                    <label for="apellido">Apellido</label>
                </div>
            </div>

            <div class="row">
                <div class="col-12 form-floating mb-3">
                    <input type="text" name="mail_principal" class="form-control" id="mail_principal"
                        value="${usuarios.mail_principal}" required>
                    <label for="mail_principal">Mail principal</label>
                </div>
            </div>
            <div class="row">
                <div class="col-12 form-floating mb-3">
                    <input type="text" name="mail_secundario" class="form-control" id="mail_secundario"
                        value="${usuarios.mail_secundario}" required>
                    <label for="mail_secundario">Mail secundario</label>
                </div>
            </div>
            <div class="row">
                <div class="col-12 form-floating mb-3">
                    <input type="text" name="alias_e" class="form-control" id="alias_e" value="${usuarios.alias_e}"
                        required>
                    <label for="alias_e">Alias</label>
                </div>
            </div>
            <div class="row">
                <div class="col-12 form-floating mb-3">
                    <input type="text" name="contrasenia" class="form-control" id="contrasenia"
                        value="${usuarios.contrasenia}" required>
                    <label for="contrasenia">Contrase&ntilde;a</label>
                </div>
            </div>
            <div class="row">
                <div class="col-12 form-floating mb-3">
                    <input type="text" name="nro_celular" class="form-control" id="nro_celular"
                        value="${usuarios.nro_celular}" required>
                    <label for=" nro_celular">Numero de Celular</label>
                </div>
            </div>
            <div class="row">
                <div class="col-12 form-floating mb-3">
                    <select class="form-select" name="id_tipo_usuario">

                        <#list tipoUsuarios as item>
                            <option value="${item.id}" <#if "${item.id}"=="${usuarios.id_tipo_usuario}"> selected </#if>
                                >${item.nombre}</option>
                        </#list>
                    </select>
                </div>
            </div>


            <button type="submit" class="btn btn-primary">Guardar cambios</button>
        </form>

    </div>
</body>

</html>