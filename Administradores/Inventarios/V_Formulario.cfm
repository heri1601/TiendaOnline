<cfinclude  template="V_Formulario_js.cfm">
<form id="myForm">
	<input type="hidden" name="method" value="insertUser">
	<div class="container-fluid">
	<div class="">
  <div class="container text-center">
		<div class="text-center">
		<img id="myIMG" src="/img/productIcon.png" style="width:70px">
	<font color=#000000 face="arial" size=5>
    Administraci&oacute;n de inventarios
    </font>   
	</div>
    <p>
  </div>
</div>

<div class="container">
	<label class="control-label col-sm-2">Tienda:</label>
			<div class="form-group">          
				<select id="inTienda"  class="form-control" name="inTienda">
					<cfloop index="i" from="1" to="#Request.cTiendas.recordcount#">
					<cfoutput>
						<option value="#Request.cTiendas.PK[i]#">#Request.cTiendas.TXT[i]#</option>
					</cfoutput>
					</cfloop>
				</select>
			</div>
	<label class="control-label col-sm-2">Producto:</label>
			<div class="form-group">          
				<select id="inProducto" type="text" class="form-control" name="inProducto">
					<cfloop index="i" from="1" to="#Request.cProductos.recordcount#">
					<cfoutput>
						<option value="#Request.cProductos.PK[i]#">#Request.cProductos.TXT[i]#</option>
					</cfoutput>
					</cfloop>
				</select>
			</div>
	<label class="control-label col-sm-2">Cantidad:</label>
			<div class="form-group">          
				<input id="inCantidad" type="text" class="form-control" name="inCantidad">
			</div>
		<label class="control-label col-sm-2">Descripcion:</label>
      <div class="form-group">          
        <input id="inDescripcion" type="text" class="form-control" name="inDescripcion">
		</div>
</div>       			
        <input type="hidden" id="inPkRegistro" name="pkRegistro" >
   	<center>
	 <button id= "btnRegistrar" type="button"  class="btn btn-success">Guardar</button>
	 <button id= "btnCancelar" type="button" class="btn btn-success">Cancelar</button>
	</center>
	

</form>

