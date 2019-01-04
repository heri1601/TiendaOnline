<cfinclude  template="V_login_js.cfm">
<form id="myForm">
	<div class="container-fluid">
	<center><h2>Informacion</h2></center>
	<div class="text-center">
	
	<img id="myIMG" src="http://subirimagen.me/uploads/20181128181616.png" style="width:500px">
	</div>
	<p>
<div class="container">
	<label class="control-label col-sm-2" style="color:#F6F3F3">Nombre:</label>
      <div class="form-group">          
        <input id="Name" type="text" class="form-control" name="Nombre">
      </div>
	<p>
		<label class="control-label col-sm-2" style="color:#F6F3F3">Contraseña:</label>
      <div class="form-group">          
        <input id="Edad" type="password" class="form-control" name="Edad">
		</div>	
</div>       
  <center>
		<p>
	 	<button id= "mySend" type="button"  class="btn btn-success">Enviar</button>
	</center>
	

</form>