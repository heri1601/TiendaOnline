<cfinclude  template="V_Formulario_js.cfm">
<form id="myForm">
	<input type="hidden" name="method" value="insertUser">
	<div class="container-fluid">
	<div class="">
  <div class="container text-center">
		<div class="text-center">
		<img id="myIMG" src="/img/productIcon.png" style="width:70px">
	<font color=#000000 face="arial" size=5>
    Administraci&oacute;n de due&ntilde;os
    </font>   
	</div>
  </div>
</div>

<div class="container">
	<label class="control-label col-sm-2">Nombre:</label>
	<div class="form-group">          
		<input id="inNombre" type="text" class="form-control" name="inNombre">
	</div>

	<label class="control-label col-sm-2">Apellidos:</label>
	<div class="form-group">          
		<input id="inApellidos" type="text" class="form-control" name="inApellidos">
	</div>

	<label class="control-label col-sm-2">E-mail:</label>
	<div class="form-group">          
		<input id="inEmail" type="text" class="form-control" name="inEmail">
	</div>

	<label class="control-label col-sm-2">Password:</label>
	<div class="form-group">          
		<input id="inPassword" type="text" class="form-control" name="inPassword">
	</div>
</div>       
        <input type="hidden" id="inPkRegistro" name="pkRegistro" >
   	<center>	 
	 <button id= "btnRegistrar" type="button"  class="btn btn-success">Guardar</button>
	 <button id= "btnCancelar" type="button" class="btn btn-success">Cancelar</button>
	</center>
	

</form>

