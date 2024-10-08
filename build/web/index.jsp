<%-- 
    Document   : index
    Created on : 7/10/2024, 3:49:22 p. m.
    Author     : Kevin Lima
--%>
<%@page import="modelo.Puesto" %>
<%@page import="modelo.Empleado" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page import="java.util.HashMap" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Empleados</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
      <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <body>
    <h1>Formulario Empleados</h1>
    
    <!-- Button to Open the Modal -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_empleado">
  Nuevo
</button>
    
    
    <div class="container">
        
        <div class="modal" id="modal_empleado">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      <form action="sr_empleado" method="post"class="form-group">
              <label for="lbl_id"><b>ID</label>
              <input type="text" name="txt_id" id="txt_id" class="form-control" value ="0" required>              
              <label for="lbl_codigo"><b>codigo:</label>
              <input type="text" name="txt_codigo" id="txt_codigo" class="form-control" placeholder="Ejemplo:E001" required>
              <label for="lbl_nombres"><b>Nombres:</label>
              <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre 1 Nombre 2" required>
              <label for="lbl_apellidos"><b>Apellidos:</label>
              <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo:apellido 1 apellido 2" required>
              <label for="lbl_direccion"><b>Direccion:</label>
              <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo:# Casa Calle Zona Ciudad" required>
              <label for="lbl_telefono"><b>Telefono:</label>
              <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo:22222222" required>
              <label for="lbl_fecha_nacimiento"><b>Fecha de Nacimiento:</label>
              <input type="date" name="txt_fecha_nacimiento" id="txt_fecha_nacimiento" class="form-control" placeholder="dd/mm/aa" required>
              <label for="lbl_puesto"><b>Tipo de puesto:</label>
              <select name="drop_puesto" id="drop_puesto" class="form-control">
                  <%
                  Puesto puesto = new Puesto();
                  HashMap<String, String> drop = puesto.drop_sangre(); 
                  for (String i:drop.keySet()){
                      out.println("<option value= '"+ i +"'>" + drop.get(i) + "</option>");
                      }
                  
                  %>
                  
                  
                  
              </select>
              <br>
              
              <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Agregar</button>
              <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>
              <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea eliminar?'))return false">Eliminar</button>
        </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
        
        
        

                  <table class="table table-striped">
                      <thead>
                          <tr>
                              <th>Codigo</th>
                              <th>Nombres</th>
                              <th>Apellidos</th>
                              <th>Direccion</th>
                              <th>Telefono</th>
                              <th>Nacimiento</th>
                              <th>Puesto</th>
                          </tr>
                      </thead>
                      <tbody id="tbl_empleados">

                          <%
                          Empleado empleado = new Empleado();
                          DefaultTableModel tabla = new DefaultTableModel();
                           tabla = empleado.leer();
                           for (int t=0;t<tabla.getRowCount();t++){
                                out.println("<tr data-id=" + tabla.getValueAt(t, 0) + "data-id_p=" + tabla.getValueAt(t, 8)+ ">");
                                out.println("<td>" + tabla.getValueAt(t, 1)+ "</td>");
                                out.println("<td>" + tabla.getValueAt(t, 2)+ "</td>");
                                out.println("<td>" + tabla.getValueAt(t, 3)+ "</td>");
                                out.println("<td>" + tabla.getValueAt(t, 4)+ "</td>");
                                out.println("<td>" + tabla.getValueAt(t, 5)+ "</td>");
                                out.println("<td>" + tabla.getValueAt(t, 6)+ "</td>");                                
                                out.println("<td>" + tabla.getValueAt(t, 7)+ "</td>");                                
                                out.println("</tr>");
                              }

                          %>

                      </tbody>
                  </table>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script type="text/javascript">
        $('#tbl=empleados').on('click','tr td',function(evt)){
           var target,id, id_p,codigo,nombres,apellidos,direccion,telefono,nacimiento; 
            target = $ (event.target);
            id = target.parent().data('id');
            id_p = target.parent().data('id_p');
            codigo = target.parent("tr").find("td").eq(0).html();
            nombres = target.parent("tr").find("td").eq(1).html();
            apellidos = target.parent("tr").find("td").eq(2).html();
            direccion = target.parent("tr").find("td").eq(3).html();
            telefono = target.parent("tr").find("td").eq(4).html();
            nacimiento = target.parent("tr").find("td").eq(5).html();
           $("#txt_id").val(id);
           $("#txt_codigo").val(codigo);
           $("#txt_nombres").val(nombres);
           $("#txt_apellidos").val(apellidos);
           $("#txt_direccion").val(direccion);
           $("#txt_telefono").val(telefono);
           $("#txt_fecha_nacimiento").val(nacimiento);
           $("#drop_puesto").val(id_p);
           $("#modal_empleado").modal('show');
          
        });
   
    </script>
  
  </body>
</html>
