<%-- 
    Document   : GestionarPromociones
    Created on : 1/05/2021, 03:36:07 PM
    Author     : mauri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <title>Benito&Jorge</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/style.css"><link rel="stylesheet" href="CSS/tabla.css">
		<script src="https://kit.fontawesome.com/712575d4a5.js" crossorigin="anonymus"></script>
		<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="container-form">
        
			<div class="con">		
			<nav>
				<div class="miguel">
					<div class="buscar">
					<input type="text" placeholder="Buscar" size="100px" maxlength="40">
					<div class="btn"><i class="fas fa-search" icon></i></div>
				  </div>
					<div class="BotonesMenu">
						 <a  href="index.html" >Benito&Jorge</a>	
					</div>
				</div>
           </nav>
            </div>
	 
		 
		 
		 
		<div id="main-container">

	  <table>
			<thead>
				<tr>
					<th>Producto</th><th>Precio</th><th>Promocion/Descuento</th><th>Precio Final</th><th>CRUD</th>
				</tr>
			</thead>
				<div class="BotonesTabla"><div class="BotonAgregar"><input type="button" value="Agregar Promocion"></div></div>
			<tr>
				<td></td><td></td><td></td><td></td><td><div class="BotonesTabla">
				<div class="BotonEditar"><input type="button" value="Editar"></div>
				<div class="BotonBorrar"><input type="button" value="Borrar"></div>
				</div></td>
			</tr>
			<tr>
				<td></td><td></td><td></td><td></td><td><div class="BotonesTabla">
				<div class="BotonEditar"><input type="button" value="Editar"></div>
				<div class="BotonBorrar"><input type="button" value="Borrar"></div>
				</div></td>
			</tr>
			<tr>
				<td></td><td></td><td></td><td></td><td><div class="BotonesTabla">
				<div class="BotonEditar"><input type="button" value="Editar"></div>
				<div class="BotonBorrar"><input type="button" value="Borrar"></div>
				</div></td>
			</tr>
			<tr>
				<td></td><td></td><td></td><td></td><td><div class="BotonesTabla">
				<div class="BotonEditar"><input type="button" value="Editar"></div>
				<div class="BotonBorrar"><input type="button" value="Borrar"></div>
				</div></td>
			</tr>
		</table>
	</div>
				</div>
		</div>
</body>
</html>