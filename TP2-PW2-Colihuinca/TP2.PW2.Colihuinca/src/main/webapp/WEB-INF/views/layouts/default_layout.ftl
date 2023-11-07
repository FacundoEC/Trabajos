<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="${context_path}/css/estilos.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <title>Trabajo Practioc N°2- Programacion Web 2</title>
    </head>
    <body>
        <div class="header">
            <h1>Trabajo Practico N°2- Programacion Web 2</h1>

        </div>
        
        <div class="contenido">
           
            ${page_content?no_esc}
        </div>
        <#if session.nombre_usuario?has_content>
        <p> Conectado como: ${session.nombre_usuario} <a href="${context_path}/empleado/cerrar"> Cerrar sesion</a> </p>
            <#else> 
                
                <a href="${context_path}/empleado"><button type="submit" class="btn btn-outline-info">Ingresar</button></a>
        </#if>

    </body>
</html>