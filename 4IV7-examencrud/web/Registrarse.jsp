<%-- 
    Document   : registrar
    Created on : 30/04/2021, 04:14:21 PM
    Author     : demon
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
            
            url = "jdbc:mysql://localhost:3307/crudexamen";
            userName = "root";
            password = "elchinodragonball";
            driver = "com.mysql.jdbc.Driver";
            //voy a lanzar una vista para cuando hace la insercion, cuando 
            //hay error en la lectura de la tabla
            //hay error por parte de bd
            
            try{
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                
                try{
                     String nom, appat,appmat,dom , q;
                    int tel_part ,tel_fij, dia, mes, año;

                    nom =  request.getParameter("nombreform") ;
                    appat = request.getParameter("appatform")  ;
                    appmat = request.getParameter("appmatform");   
                    dia=Integer.parseInt(request.getParameter("dianac"));
                    mes=Integer.parseInt(request.getParameter("mesnac"));
                    año=Integer.parseInt(request.getParameter("anonac"));
                    dom=  request.getParameter("domform");  
                    tel_part=Integer.parseInt(request.getParameter("telparform"));
                    tel_fij=Integer.parseInt(request.getParameter("telfijform"));
                    set = con.createStatement();

                    q = "insert into MUsuario (nom_usu, appat_usu ,appmat_usu ,dia_nac, mes_nac,año_nac,dom_usu ,tel_part ,tel_fij) "
                            + "values ('"+nom+"','"+appat+"', '"+appmat+"','"+dia+"','"+mes+"','"+año+"', '"+dom+"','"+tel_part+"', '"+tel_fij+"')";
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
