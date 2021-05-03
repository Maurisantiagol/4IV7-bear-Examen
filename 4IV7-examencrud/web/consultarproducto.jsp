<%-- 
    Document   : consultarproducto
    Created on : 2/05/2021, 05:31:47 AM
    Author     : mauri
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


		<link rel="stylesheet" href="CSS/tabla.css">  <link rel="stylesheet" href="CSS/style.css">

        <title>Consulta de Productos</title>
    </head>
    <body>
        <h1>Tabla de productos</h1>
        <br>
        <table border="2" width="100%" >
            <thead>
                <tr>
                    <th>Editar</th>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Tamaño</th>
                    <th>Gramos</th>
                    <th>Presentación</th>
                    <th>Precio</th>
                </tr>
            </thead>
            <tbody>
                
                <% 
                    
            //aqui va codigo java
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            
            String url, userName, password, driver;
            
            url = "jdbc:mysql://localhost:3306/crudexamen";
            userName = "root";
            password = "maika";
            driver = "com.mysql.jdbc.Driver";
                    try{
                        
                        Class.forName(driver);
                        con = DriverManager.getConnection(url, userName, password);
                        
                        try{
                            String q = "select * from cproducto order by nom_prod asc";
                            
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            while(rs.next()){
                            
                %>
                <tr>

                    <td> <a href="editarproducto.jsp?id=<%=rs.getInt("id_prod")%>" >Editar</a> </td>

                    

                    <td> <%=rs.getInt("id_prod")%> </td>
                    <td> <%=rs.getString("nom_prod")%> </td>
                    <td> <%=rs.getString("tamano_prod")%> </td>
                     <td> <%=rs.getInt("gramos_prod")%> </td>
                     <td> <%=rs.getString("presentacion_prod")%> </td>
                      <td> <%=rs.getInt("precio_prod")%> </td>
                   <!--<td> <a href="editar.jsp?id=<%//=rs.getInt("id_usu")%>" >Editar</a> </td>
                    <td> <a href="borrar.jsp?id=<%//=rs.getInt("id_usu")%>" >Borrar</a> </td> -->
                </tr>


                <%
                                
                                
                                
                            }
                            rs.close();
                            set.close();
                            
                        
                        }catch(SQLException ed){
                            System.out.println("Error al consultar la tabla");
                            System.out.println(ed.getMessage());
                            %>
            </tbody>
            <h1>Recurso no disponible solo juguito contigo UwU</h1>
                            <%
                        
                        }
                        con.close();
                    
                    }catch(Exception e){
                        System.out.println("Error al conectar con la bd");
                        System.out.println(e.getMessage());
                        System.out.println(e.getStackTrace());
                        %>
        <h1>Sitio en Construcción</h1>            
                    <%
                    
                    }
                    
                    %>
                
            </tbody>
        </table>
                    <br>
                    <a class="BotonesTabla" href="index.html" >Regresar al Menú Principal</a>
                    <br><br><br>
                    <a class="BotonesTabla" href="registrarproducto.html" >Registrar nuevo producto</a> 
                    <br>
                    <form method="post" name="formularioeliminarproducto" action="borrarproducto.jsp">
                        <br><br>
                     <label>Eliminar por id</label>
                    <input class="inputformulario" type="text" name="id" size="10" maxlength="6">
                    <br>
                    <input class="Botones" type="submit" value="Borrar id" >
                    </form>
    </body>
</html>