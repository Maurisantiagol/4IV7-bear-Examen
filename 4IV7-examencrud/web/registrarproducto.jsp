<%-- 
    Document   : registrarproducto
    Created on : 2/05/2021, 04:39:11 AM
    Author     : mauri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Usuarios</title>
    </head>
    <body>
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
            //voy a lanzar una vista para cuando hace la insercion, cuando 
            //hay error en la lectura de la tabla
            //hay error por parte de bd
            
            try{
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                
                try{
                     String nomp , tamp , prep , q;
                    int idp , grap , precp ;
                    idp =Integer.parseInt(request.getParameter("prod"));
                    nomp =  request.getParameter("nom") ;
                    tamp =  request.getParameter("tam") ;
                    grap =Integer.parseInt(request.getParameter("gram"));
                    prep=request.getParameter("pres");
                    precp=Integer.parseInt(request.getParameter("pre"));
                    set = con.createStatement();

                    q = "insert into cproducto (id_prod, nom_prod, tamano_prod, gramos_prod, presentacion_prod, precio_prod) "
                            + "values ('"+idp+"','"+nomp+"', '"+tamp+"','"+grap+"','"+prep+"','"+precp+"')";
                    int registro = set.executeUpdate(q);

                    
                    %>
        <h1>Registro Exitoso</h1>            
                    <%
                        set.close();
                
                }catch(SQLException ed){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(ed.getMessage());
                    %>
        <h1>Registro No Exitoso, error en la lectura de la tabla</h1>            
                    <%
                
                }
                con.close();
            
            }catch(Exception e){
                System.out.println("Error al conectar la bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            %>
        <h1>Sitio en Construcción</h1>            
                    <%
            }
            %>
        
        
            <a href="index.html" >Regresar al menú principal</a>
        
    </body>
</html>
