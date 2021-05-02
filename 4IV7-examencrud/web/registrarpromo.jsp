<%-- 
    Document   : registrarpromo
    Created on : 2/05/2021, 05:07:17 AM
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
                     String nompromo  , q;
                    int idpromo , idproduc , porcent , precfin;
                    idpromo =Integer.parseInt(request.getParameter("idprom"));
                    idproduc=Integer.parseInt(request.getParameter("idprod"));
                    nompromo=request.getParameter("nomprom");
                    porcent=Integer.parseInt(request.getParameter("porcentpromo"));
                    precfin=Integer.parseInt(request.getParameter("precfin"));
                     set = con.createStatement();
                    q = "insert into cpromo (id_promo, id_prod, nom_promo, porcent_desc, precio_final) "
                            + "values ( '"+idpromo+"', '"+idproduc+"', '"+nompromo+"', '"+porcent+"', '"+precfin+"' )";
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
