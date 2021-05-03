<%-- 
    Document   : editarproducto
    Created on : 2/05/2021, 06:22:33 AM
    Author     : mauri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Cuenta</title>
    </head>
    <body>
        <h1>Tabla de Datos de la Cuenta</h1>
        <form method="post" name="formularioeditar" action="actualizarproducto.jsp" >
            <table border="2" >
                
                <%
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
                            int id = Integer.parseInt(request.getParameter("id"));
                            String q = "select * from cproducto "
                                     + "where id_prod ="+id;
                            
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            while(rs.next()){
                                %>
            <tr>
                    <td>ID</td>
                    <td> <input type="hidden" name="id2" value="<%=rs.getInt("id_prod")%>" > </td>
                </tr>
                <tr>
                    <td>Nombre producto</td>
                    <td> <input type="text" name="nombre2" value="<%=rs.getString("nom_prod")%>" > </td>
                </tr>
                <tr>
                    <td>Tamaño</td>
                    <td> <input type="text" name="tamano2" value="<%=rs.getString("tamano_prod")%>" > </td>
                </tr>
                <tr>
                    <td>Gramos</td>
                    <td> <input type="text" name="gramos2" value="<%=rs.getInt("gramos_prod")%>" > </td>
                </tr>  
                <tr>
                    <td>Presentacion</td>
                    <td> <input type="text" name="present2" value="<%=rs.getString("presentacion_prod")%>" > </td>
                </tr>  
                <tr>
                    <td>Precio</td>
                    <td> <input type="text" name="precio2" value="<%=rs.getInt("precio_prod")%>" > </td>
                </tr>  
                                <%
                            
                            }
                            rs.close();
                            set.close();
                        
                        }catch(SQLException ed){
                            System.out.println("Error al consultar la tabla");
                            System.out.println(ed.getMessage());
                            %>
                <tr>
                    <td>ID</td>
                    <td> <input type="hidden" name="id2" value="" > </td>
                </tr>
                <tr>
                    <td>Nombre producto</td>
                    <td> <input type="text" name="nombre2" value="" > </td>
                </tr>
                <tr>
                    <td>Tamaño</td>
                    <td> <input type="text" name="tamano2" value="" > </td>
                </tr>
                <tr>
                    <td>Gramos</td>
                    <td> <input type="text" name="gramos2" value="" > </td>
                </tr>  
                <tr>
                    <td>Presentacion</td>
                    <td> <input type="text" name="present2" value="" > </td>
                </tr>  
                <tr>
                    <td>Precio</td>
                    <td> <input type="text" name="precio2" value="" > </td>
                </tr>             
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
                
                
            </table>
                    <input type="submit" value="Actualizar Producto" >
                    <input type="reset" value="Borrar Datos" >
            
        </form>
    </body>
</html>