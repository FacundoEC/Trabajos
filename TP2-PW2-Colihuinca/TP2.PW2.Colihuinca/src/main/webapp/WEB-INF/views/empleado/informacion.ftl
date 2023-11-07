<!DOCTYPE html>
<html lang="en">

<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

        <script>
        function confirmarEliminacion(id) {
        if (confirm('¿Está seguro de que desea eliminar este empleado?')) {
        // Si el usuario hace clic en "Aceptar", redirige a la URL de eliminación
        window.location.href = "${context_path}/empleado/eliminar/" + id;
        }
        }
        </script>
</head>

<body>
    <a href="${context_path}/empleado"><button type="submit" class="btn btn-outline-info">Volver a la lista de
            empleados</button></a>
    <h2>Mas informacion del Empleado</h2>

    <table class="table">
        <thead>
            <tr>
                <th>ID</th>
                <th>NOMBRE</th>
                <th>APELLIDO</th>
                <th>FECHA ALTA</th>
                <th>MAIL PRINCIPAL</th>
                <th>MAIL SECUNDARIO</th>
                <th>ALIAS</th>
                <th>TIPO</th>
                 <#if session.modificar>
                    <th>CONTRASE&Ntilde;A</th>
                </#if>
                
                <th>CELULAR</th>
                <#if session.modificar>
                    <th>ACCIONES</th>
                </#if>
            </tr>
        </thead>
        <tbody>

            <tr>
                <td>${usuarioInfo.id}</td>
                <td>${usuarioInfo.nombre}</td>
                <td>${usuarioInfo.apellido}</td>
                <td>${usuarioInfo.fecha_alta}</td>
                <td>${usuarioInfo.mail_principal}</td>
                <td>${usuarioInfo.mail_secundario}</td>
                <td>${usuarioInfo.alias_e}</td>
                <td>${usuarioInfo.tiposUsuarios.nombre}</td>
                 <#if session.modificar>
                     <td>${usuarioInfo.contrasenia}</td>
                </#if>  
                <td>${usuarioInfo.nro_celular}</td>
                <#if session.modificar>
                    <td>
                        <a href="#" onclick="confirmarEliminacion(${usuarioInfo.id})">
                            <button class="btn btn-danger">ELIMINAR</button>
                        </a>
                        <a href="${context_path}/empleado/modificar/${usuarioInfo.id}"> <button
                                class="btn btn-warning">MODIFICAR</button></a>

                    </td>
                </#if>
            </tr>
        </tbody>

    </table>
</body>

</html>