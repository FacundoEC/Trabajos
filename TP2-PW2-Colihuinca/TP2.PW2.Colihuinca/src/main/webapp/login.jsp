<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        
        <title>Iniciar Sesion</title>
    </head>
    <body style="height: 100vh;" class="container d-grid">
        
        <div class="row align-content-center justify-content-center text-center "> 
            <div class="col-6 p-3 bg-info bg-opacity-10 border border-info border-start-0 rounded-end">
                <h1>Iniciar sesion</h1>
                <form name="j_security_form" method="post" action="j_security_check">

                    <div class="form-floating mb-3">
                        <input type="text" name="j_username" class="form-control" id="floatingUser" placeholder="Usuario">
                        <label for="floatingUser">Usuario</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="password" name="j_password" class="form-control" id="floatingPassword" placeholder="Password">
                        <label for="floatingPassword">Contraseña</label>
                    </div>

                    <p><button type="submit" class="btn btn-outline-info">Ingresar</button></p>
                </form>
            </div>
        </div>
        
        <div class="text-center">
            <a href="<c:url value="/home/index"/>" class="btn btn-outline-dark">Volver al inicio</a>
        </div>
        
    </body>
</html>
