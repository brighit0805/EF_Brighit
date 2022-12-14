<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    String unombre = request.getAttribute("nombre").toString();
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REgistro Exitoso</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>Registro Exitoso</h1>
                    <p>
                        Hola <%=unombre%>, <br/>
                        gracias por registrarte en nuestra plataforma,
                        ingresa al sistema con tu usuario y clave
                    </p>
                    <a href='./sesion?accion=login' class="btn btn-link">Iniciar Sesión</a>
                </div>
            </div>
        </div>
        
    </body>
</html>
