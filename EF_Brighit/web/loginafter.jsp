<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true"%>
<%
    HttpSession sesion=request.getSession();
    Object uid = sesion.getAttribute("uid");
    if(uid != null){
        response.sendRedirect("./servicios?accion=listar");
    }
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesión</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>Iniciar Sesión</h1>
                    <form action="./sesion?accion=login" method="post">
                        <div class="input-group my-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text" id="basic-addon1">Correo</span>
                            </div>
                            <input type="email" name="correo" class="form-control" placeholder="Correo" aria-label="correo" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group my-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1">Contraseña</span>
                            </div>
                            <input type="password" name="clave" class="form-control" placeholder="Clave" aria-label="clave" aria-describedby="basic-addon1">
                        </div>
                        
                        <input type='hidden' name="accion" value="login"/>
                        <button type="submit" class="btn btn-primary">
                            Iniciar Sesión
                        </button>
                        <a href='./sesion?accion=registro' class="btn btn-link">Registrarse</a>
                    </form>
                </div>
            </div>
        </div>
        
    </body>
</html>
