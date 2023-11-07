<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>

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
    <div class="container">
        <#if session.ver>

            <#if session.modificar>
                <section id="action">
                    <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Agregar Empleado
                    </a>
                </section>
                <@render partial="agregar" />

            </#if>

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

                        <th>ACCIONES</th>

                    </tr>
                </thead>
                <tbody>
                    <#list usuarios as item>
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.nombre}</td>
                            <td>${item.apellido}</td>
                            <td>${item.fecha_alta}</td>
                            <td>${item.mail_principal}</td>
                            <td>${item.mail_secundario}</td>
                            <td>${item.alias_e}</td>
                            <td>${item.tiposUsuarios.nombre}</td>
                            <td>
                                <#if session.modificar>
                                    <a href="#" onclick="confirmarEliminacion(${item.id})"><button
                                            class="btn btn-danger">ELIMINAR</button></a>
                                    <a href="${context_path}/empleado/modificar/${item.id}"> <button
                                            class="btn btn-warning">MODIFICAR</button></a>
                                </#if>
                                <a href="${context_path}/empleado/informacion/${item.id}"><button
                                        class="btn btn-primary">VER </button></a>
                            </td>
                        </tr>
                    </#list>
                </tbody>

            </table>
        </#if>
    </div>

</body>

</html>