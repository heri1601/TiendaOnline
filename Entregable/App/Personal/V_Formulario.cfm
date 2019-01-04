<cfinclude  template="V_Formulario_js.cfm">
<form id="myForm">

	<input type="hidden" name="method" value="insertUser">
		
	<div class="container-fluid">
	<center><h2>Informacion</h2></center>
	<div class="text-center">
	
	<img id="myIMG" src="http://subirimagen.me/uploads/20181128181616.png" style="width:500px">
	</div>
	<p>
<div class="container">

	<button id= "info" type="button" class="button" ><img src="https://i.ibb.co/ckvrm3R/info-1459077-640.png" width="30" height="30"> </button>

	
	<label class="control-label col-sm-2" style="color:#F6F3F3">Nombre:</label>
      <div class="form-group">          
        <input id="Name" type="text" class="form-control" name="Nombre">
      </div>
	  
	<p>
	
		<label class="control-label col-sm-2" style="color:#F6F3F3">Edad:</label>
      <div class="form-group">          
        <input id="Edad" type="text" class="form-control" name="Edad">
		</div>

	<p>
	
    <label class="control-label col-sm-2" style="color:#F6F3F3">Numero Telefonico:</label>  
      <div class="form-group">     
        <input id="Num" type="text" class="form-control" name="Num_Tel">
      </div>
	 
	 <label class="control-label col-sm-2" style="color:#F6F3F3">Extranjero:</label>
      <div class="form-group">          
        <input id="checkExtranjero" type="checkbox" class="only-one" name="inExtranjero" value="1">
      </div>

	  <label class="control-label col-sm-2" style="color:#F6F3F3">Archivo:</label>
      <div class="form-group">          
        <input id="archivo" type="file" class="only-one" name="archivo" >
      </div>


	
<!---------------------------------------------------------------------------------------------------------------->
		<cfoutput>
		<cfset myNumber="#Request.resultadoQueryEntidad.recordcount#"-1>
		<select id="inNacional" name="Nacional">
		<option value="0">Seleccione una opci&oacute;n</option>
		<cfloop index="i" from="1" to=#myNumber#>
        <option value=#i#>#Request.resultadoQueryEntidad['ENTIDADES'][++i]#</option>
        </cfloop>
      	</select>
		</cfoutput>
<!---------------------------------------------------------------------------------------------------------------->		
</div>       

<!---------------------------------------------------------------------------------------------------------------->		
			
        <input type="hidden" id="inPkRegistro" name="pkRegistro" >
    

   	<center>
	   <p>
	 <button id= "mySendExtranjero" type="button"  class="btn btn-success">Enviar</button>
	 <button id= "mySend" type="button"  class="btn btn-success">Enviar</button>
	 <button id= "myModify" type="button" class="btn btn-success">Modificar</button>
	 <button id= "myCancel" type="button" class="btn btn-success">Cancelar</button>
	</center>
	

</form>

