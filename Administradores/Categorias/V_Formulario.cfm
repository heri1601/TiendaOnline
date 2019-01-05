<cfinclude  template="V_Formulario_js.cfm">
<form id="myForm">

	<input type="hidden" name="method" value="insertUser">
		
	<div class="container-fluid">
	
	<div class="">
  <div class="container text-center">
    
		<div class="text-center">
		<img id="myIMG" src="/img/productIcon.png" style="width:70px">
	<font color=#000000 face="arial" size=5>
    Registro de categor&iacute;as
    </font>   
	
	</div>
    <p>
  </div>
</div>


	
	<p>
<div class="container">



	
	<label class="control-label col-sm-2">Nombre:</label>
      <div class="form-group">          
        <input id="inNombre" type="text" class="form-control" name="inNombre">
      </div>
	  
	<p>
	
		<label class="control-label col-sm-2">Descripcion:</label>
      <div class="form-group">          
        <input id="inDescripcion" type="text" class="form-control" name="inDescripcion">
		</div>

	<p>
	
    
	 
			


	
		<!---<cfoutput>
		<cfset myNumber="#Request.resultadoQueryEntidad.recordcount#"-1>
		<select id="inNacional" name="Nacional">
		<option value="0">Seleccione una opci&oacute;n</option>
		<cfloop index="i" from="1" to=#myNumber#>
        <option value=#i#>#Request.resultadoQueryEntidad['ENTIDADES'][++i]#</option>
        </cfloop>
      	</select>
		</cfoutput>--->
<!---------------------------------------------------------------------------------------------------------------->		
</div>       

<!---------------------------------------------------------------------------------------------------------------->		
			
        <input type="hidden" id="inPkRegistro" name="pkRegistro" >
    

   	<center>
	   <p>
	 
	 <button id= "btnRegistrar" type="button"  class="btn btn-success">Guardar</button>
	 <button id= "btnCancelar" type="button" class="btn btn-success">Cancelar</button>
	</center>
	

</form>

