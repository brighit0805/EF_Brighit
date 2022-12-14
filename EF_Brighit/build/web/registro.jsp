<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <h1>Registro de Usuario</h1>
                    <form action="./sesion?accion=registro" method="post">
                        <div class="input-group my-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text" >Nombre</span>
                            </div>
                            <input type="text" name="nombre" class="form-control"  required>
                        </div>
                        <div class="input-group my-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" >Apellido</span>
                            </div>
                            <input type="text" name="apellido" class="form-control" required>
                        </div>
                        
                        <div class="input-group my-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" >Correo</span>
                            </div>
                            <input type="text" name="correo" class="form-control" required>
                        </div>
                        
                        <div class="input-group my-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Contraseña</span>
                            </div>
                            <input type="text" name="clave" class="form-control"  id="clave1" autocomplete="off" required>
                        </div>
                        
                        <div class="input-group my-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" >Repetir Contraseña</span>
                            </div>
                            <input type="text" name="clave2" class="form-control" id="clave2" autocomplete="off"  required>
                        </div>
                        
                        <div class="input-group my-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" >Tipo Usuario</span>
                            </div>
                            <select class="form-control" name="tipo">
                                <option value="EXTERNO"> Externo</option>
                                <option value="INTERNO"> Interno</option>
                            </select>
                        </div>
                        
                        <div id="mensaje"></div>
                        
                        <input type='hidden' name="accion" value="registro"/>
                        <button type="submit" class="btn btn-primary" id="botonRegistro">
                            Registrar
                        </button>
                        <a href='./sesion?accion=login' class="btn btn-link">Iniciar Sesión</a>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script type="text/javascript">
            
            $(document).ready(function(){
                
                $("#clave1").keyup(function(){
                    let c1 = $("#clave1").val();
                    let c2 = $("#clave2").val();
                    if(c1 != c2){
                        $("#mensaje").html("No coinciden")
                        $("#botonRegistro").attr("disabled", true);
                    }else{
                        $("#mensaje").html("")
                        $("#botonRegistro").attr("disabled", false);
                    }
                })
                
                $("#clave2").keyup(function(){
                    let c1 = $("#clave1").val();
                    let c2 = $("#clave2").val();
                    if(c1 != c2){
                        $("#mensaje").html("No coinciden")
                        $("#botonRegistro").attr("disabled", true);
                    }else{
                        $("#mensaje").html("")
                        $("#botonRegistro").attr("disabled", false);
                    }
                })
                
            })
            
        </script>
    </body>
</html>
