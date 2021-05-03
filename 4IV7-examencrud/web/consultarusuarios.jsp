<%-- 
    Document   : consultarusuarios
    Created on : 2/05/2021, 05:53:06 AM
    Author     : mauri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
		<link rel="stylesheet" href="CSS/tabla.css">  <link rel="stylesheet" href="CSS/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Cuentas</title>
    </head>
    <body>
        <h1>Tabla de Cuentas General</h1>
        <br>
        <table border="2" width="100%" >
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellido paterno</th>
                    <th>Apellido Materno</th>
                    <th>dia </th>
                    <th>mes</th>
                    <th>año</th>
                    <th>domicilio</th>
                    <th>telefono particular</th>
                    <th>telefono fijo</th>
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
                            String q = "select * from musuario order by nom_usu asc";
                            
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            while(rs.next()){
                            
                %>
                <tr>
                    <td> <%=rs.getInt("id_usu")%> </td>
                <td> <%=rs.getString("nom_usu")%> </td>
                <td> <%=rs.getString("appat_usu")%> </td>
                    <td> <%=rs.getString("appmat_usu")%> </td>
                     <td> <%=rs.getInt("dia_nac")%> </td>
                     <td> <%=rs.getInt("mes_nac")%> </td>
                     <td> <%=rs.getInt("año_nac")%> </td>
                     <td> <%=rs.getString("dom_usu")%> </td>
                     <td> <%=rs.getString("tel_part")%> </td>
                      <td> <%=rs.getString("tel_fij")%> </td>
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
                    <a class="BotonesTabla" href="registrarse.html" >Registrar nuevo usuario</a>     
                    
                    <br>
                    <form method="post" name="formularioeliminarusu" action="borrarusuario.jsp">
                        <br><br>	
                     <label>Eliminar por id</label>
                    <input class="inputformulario" type="text" name="id" size="10" maxlength="6">
                    <br>
                    <input class="Botones" type="submit" value="Borrar id" >
                    </form>
    </body>
</html>
