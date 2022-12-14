<%@page import="model.beans.Servicio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="servicios" scope="request" type="java.util.ArrayList<model.beans.Servicio>"/>
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
                        
                        <% if(!unombre.equals("admin")) { %>
                        <li class="nav-item">
                            <button type="button" class="btn btn-link" data-toggle="modal" data-target="#serv1">Nueva Impresion</button>
                        </li>
                        <li class="nav-item">
                            <button type="button" class="btn btn-link" data-toggle="modal" data-target="#serv2">Nuevo Corte Laser</button>
                        </li>
                        <li class="nav-item">
                            <button type="button" class="btn btn-link" data-toggle="modal" data-target="#serv3">Nueva Escaneo Digital 3D</button>
                        </li>
                        <% } %>
                        <li class="nav-item">
                            <a class="nav-link" href="./sesion?accion=salir">Salir</a>
                        </li>
                    </ul>
                </div>
              </nav>
            
            
            <div class="row">
                <div class="col-md-12">
                    <table class="table">
                        <tr>
                            <th>ID</th>
                            <th>Tipo de Servicio</th>
                            <th>Usuario</th>
                            <th>Fecha</th>
                            <th>Tiempo</th>
                            <th>Costo</th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                        <% for (Servicio item : servicios) { %>
                        <tr>
                            <td>
                                <%=item.id%>
                            </td>
                            <td>
                                <%=item.tipo%>
                            </td>
                            <td><%=item.usuario%> </td>
                            <td>
                                <%=item.fecha%>
                            </td>
                            <td> --  </td>
                            <td> --  </td>
                            
                        </tr>
                        <% } %>
                    </table>
                </div>
            </div>
        </div>
        <div class="modal fade" id="serv1" tabindex="-1" role="dialog">
            <form action="./servicios?accion=nuevos1" method="post">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Impresión 3D</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                    <label>Densidad de Pieza</label>
                    <select class="form-control" name="s1_densidadpieza">
                        <option value="10">10</option>
                        <option value="15">15</option>
                        <option value="20">20</option>
                        <option value="30">30</option>
                        <option value="50">50</option>
                        <option value="90">90</option>
                    </select>
                    <br/>
                    <label>Grosor</label>
                    <select class="form-control" name="s1_grosor">
                        <option value="Fino">Fino</option>
                        <option value="Normal">Normal</option>
                        <option value="Grueso">Grueso</option>
                    </select>
                    <br/>
                    <label>Alura de la Capa</label>
                    <select class="form-control" name="s1_alturacapa">
                        <option value="0.1">0.1</option>
                        <option value="0.2">0.2</option>
                        <option value="0.3">0.3</option>
                        <option value="0.4">0.4</option>
                    </select>
                    <br/>
                    <label>Material</label>
                    <select class="form-control" name="s1_material">
                        <option value="ABS">ABS</option>
                        <option value="PLA">PLA</option>
                        <option value="Flexible">Flexible</option>
                    </select>
                    <br/>
                    <label>URL de la imagen</label>
                    <input type="text" class="form-control" name="s1_urlimage">
                    <br/>
                    <label>Autoservicio</label>
                    <select class="form-control" name="s1_autoservicio">
                        <option value="si">si</option>
                        <option value="no">no</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <input type="hidden" value="nuevos1" name="accion" />
                  <button type="submit" class="btn btn-primary">Guardar</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                </div>
              </div>
            </div>
            </form>
        </div>
                
                
        <div class="modal fade" id="serv2" tabindex="-1" role="dialog">
            <form action="./servicios?accion=nuevos2" method="post">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Corte Laser</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                    <label>Grosor de Linea</label>
                    <select class="form-control" name="s2_grosorlinea">
                        <option value="Fino">Fino</option>
                        <option value="Grueso">Grueso</option>
                    </select>
                    <br/>
                    <label>Color de Linea</label>
                    <select class="form-control" name="s2_colorlinea">
                        <option value="Rojo">Rojo</option>
                        <option value="Negro">Negro</option>
                    </select>
                    <br/>
                    
                    <label>Material</label>
                    <select class="form-control" name="s2_material">
                        <option value="Acrilico">Acrilico</option>
                        <option value="MDF">MDF</option>
                        <option value="Carton">Carton</option>
                    </select>
                    <br/>
                    <label>Dimensiones</label>
                    <div class="row">
                        <div class="col-6">
                            <input type="text" class="form-control" name="s2_dim1">
                        </div>
                        <div class="col-6">
                            <input type="text" class="form-control" name="s2_dim2">
                        </div>
                    </div>
                    
                    
                    <br/>
                    <label>URL de la Imagen</label>
                    <input type="text" class="form-control" name="s2_ulrimagen">
                </div>
                <div class="modal-footer">
                    <input type="hidden" value="nuevos2" name="accion" />
                  <button type="submit" class="btn btn-primary">Guardar</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                </div>
              </div>
            </div>
            </form>
        </div>
                
                
        <div class="modal fade" id="serv3" tabindex="-1" role="dialog">
            <form action="./servicios?accion=nuevos3" method="post">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Escaneo Digital 3D</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                    
                    <label>Largo</label>
                    <input type="text" class="form-control" name="s3_largo">                    
                    <br/>
                    <label>Ancho</label>
                    <input type="text" class="form-control" name="s3_ancho">                    
                    <br/>
                    <label>Altura</label>
                    <input type="text" class="form-control" name="s3_altura">                    
                    <br/>
                    <label>Resolucion</label>
                    <select class="form-control" name="s3_resolucion">
                        <option value="Alta">Alta</option>
                        <option value="Media">Media</option>
                        <option value="Baja">Baja</option>
                    </select>
                    
                    
                </div>
                <div class="modal-footer">
                    <input type="hidden" value="nuevos3" name="accion" />
                  <button type="submit" class="btn btn-primary">Guardar</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                </div>
              </div>
            </div>
            </form>
        </div>
                
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
