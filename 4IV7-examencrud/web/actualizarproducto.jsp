<%-- 
    Document   : actualizarproducto
    Created on : 2/05/2021, 05:21:18 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar Registro</title>
    </head>
    <body>
        
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
                    String nomp , tamp , prep , q;
                    int grap , precp ;
                    int id = Integer.parseInt(request.getParameter("id2"));
                    nomp =  request.getParameter("nombre2") ;
                    tamp =  request.getParameter("tamano2") ;
                    grap =Integer.parseInt(request.getParameter("gramos2"));
                    prep=request.getParameter("present2");
                    precp=Integer.parseInt(request.getParameter("precio2"));
                    
                    set = con.createStatement();
                    
                    q = "update cproducto set nom_prod = '"+nomp+"', tamano_prod = '"+tamp+"', "
                            + "gramos_prod = '"+grap+"', presentacion_prod = '"+prep+"', "
                            + "precio_prod = '"+precp+"' where id_prod = "+id+"";
                    
                    set = con.createStatement();
                    
                    int actuzalizar = set.executeUpdate(q);
                    
                    %>
            <h1>Registro Actualizado con Exito</h1>        
                    <%
                    set.close();
                
                }catch(SQLException ed){
                    System.out.println("Error al actualizar el registro de la tabla");
                    System.out.println(ed.getMessage());
                    %>
            <h1>Registro No Actualizado con Exito, error en el recurso, solo juguito again</h1>        
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
        
        <br>
                    <a href="index.html" >Regresar al Menú Principal</a>
                    <br>
                    <a href="consultarproducto.jsp" >Consulta de Tabla General de Productos</a> 
        
    </body>
</html>
