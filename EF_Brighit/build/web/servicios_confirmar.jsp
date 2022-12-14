<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    HttpSession sesion=request.getSession();
    String unombre = sesion.getAttribute("unombre").toString();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Servicios</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="#">Hola <%=unombre%></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                    
                        <li class="nav-item">
                            <a class="nav-link" href="./servicios?accion=listar">Servicios</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./sesion?accion=salir">Salir</a>
                        </li>
                    </ul>
                </div>
              </nav>
        </div>
    </body>
</html>