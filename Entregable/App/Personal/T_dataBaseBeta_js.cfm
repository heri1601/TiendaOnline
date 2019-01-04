  <script>
    //Funcion que trae los datos de un registro y los carga en el formulario Javascript
    function obtenerDatosRegistro(pkRegistro){
        
        //var dat ={method:'obtenerDatosRegistro1',pkRegistro:pkRegistro}
        //var miUrl='http://localhost:8502/DAO_inputUser.cfc'
        var myData = new FormData();
        var miUrl='http://localhost:8502/Personal/CC_Personal.cfc'
            myData.append("method","obtenerRegistro")
			myData.append("pkRegistro",pkRegistro)
            alert("Archivo Cargado");

            $.ajax({
                url:miUrl,
                type:"POST",
				contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
    			processData: false, // NEEDED, DON'T OMIT THIS
				data:myData,
                complete: function (response) {
                    console.log(response.responseText);
                    var reposnseObject=eval("("+response.responseText+")");
                    console.log(reposnseObject);

                    pkRegistro=reposnseObject.DATA[0][0]
                    nombre=reposnseObject.DATA[0][1]
                    edad=reposnseObject.DATA[0][2]
                    num=reposnseObject.DATA[0][3]
                    ent=reposnseObject.DATA[0][5]
                    ext=reposnseObject.DATA[0][6]


                    $("#mySend").hide(); //muestro mediante id
			        $("#myModify").show();
                    $("#myCancel").show();
                    if(ent != 0){
                        inHtml= '<cfoutput>'+
                    '<cfset myNumber="#Request.resultadoQueryEntidad.recordcount#"-1>'+
                    '<select id="inNacional" name="Nacional">'+
                    '<option value="0">Seleccione una opci&oacute;n</option>'+
                    '<cfloop index="i" from="1" to=#myNumber#>'+
                    '<option value=#i#>#Request.resultadoQueryEntidad['ENTIDADES'][++i]#</option>'+
                    '</cfloop>'+
                    '</select>'+
                    '</cfoutput>'
                        $("#checkExtranjero").prop('checked', false);
                        $("#inNacional").html(inHtml);
                        $("#inNacional").val(ent);
                    }
                    if(ext != 0){
                        inHtml='<cfoutput>'+
		            '<cfset myNumber="#Request.resultadoQueryPais.recordcount#"-1>'+
		            '<select id="inNacional" name="Nacional">'+
		            '<option value="0">Seleccione una opci&oacute;n</option>'+
		            '<cfloop index="i" from="1" to=#myNumber#>'+
                    '<option value=#i#>#Request.resultadoQueryPais['PAIS'][++i]#</option>'+
		            '</cfloop>'+
      	            '</select>'+
		            '</cfoutput>'
                    $("#checkExtranjero").prop('checked', true);
                    $("#inNacional").html(inHtml);
                    $("#inNacional").val(ext);
                    }
                    $("#myCancel").click(function(){
                        location.reload(true);
                         });
                    
                    console.log(nombre)
                    $("#Name").val(nombre)
                    $("#Edad").val(edad)
                    $("#Num").val(num) 
                    $("#inPkRegistro").val(pkRegistro)
                },
                error: function () {
                    alert("Error, intentalo de nuevo");
                },
            });
            //alert("Editando registro "+pkRegistro)
    }

    function modificarDatosRegistro(pkRegistro){

        var myData = new FormData();
        var miUrl='http://localhost:8502/Personal/CC_Personal.cfc'
            myData.append("method","obtenerUpgrade")
			myData.append("pkRegistro",pkRegistro)
        //var myData = new FormData();
        //var miUrl='http://localhost:8502/DAO_inputUser.cfc'
        //var params = {Pk_registro:pkregistro,Estado:2}
        //var params='method=obtenerDatosRegistro&Pk_registro='+pkRegistro+'&Estado=2'
        
            $.ajax({
                url:miUrl,
                type:"POST",
				contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
    			processData: false, // NEEDED, DON'T OMIT THIS
				data:myData,
                
                complete: function (response) {
                     alert("Archivo Validado");
                    console.log(response.responseText);
                    var reposnseObject=eval("("+response.responseText+")");
                    console.log(reposnseObject);

                    //pkRegistro=reposnseObject.DATA[0][0]
                    //nombre=reposnseObject.DATA[0][1]
                    //edad=reposnseObject.DATA[0][2]
                    //num=reposnseObject.DATA[0][3]
                    
                    location.reload(true);
                },
                error: function () {
                    alert("Error, intentalo de nuevo");
                },
            });
            //alert("Editando registro "+pkRegistro)
    }

    function EliminarDatosRegistro(pkRegistro){

        var myData = new FormData();
        var miUrl='http://localhost:8502/Personal/CC_Personal.cfc'
            myData.append("method","obtenerUpgradeDelte")
			myData.append("pkRegistro",pkRegistro)
            myData.append("Estado","0")

        //var miUrl='http://localhost:8502/DAO_inputUser.cfc?method=obtenerDatosRegistro&Pk_registro='+pkRegistro+'&Estado=0'
                //var txt;
                var r = confirm("Desea Eliminarlo");
                if (r == true) { 
            $.ajax({
                url:miUrl,
                type:"POST",
				contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
    			processData: false, // NEEDED, DON'T OMIT THIS
				data:myData,
                complete: function (response) {
                    console.log(response.responseText);
                    var reposnseObject=eval("("+response.responseText+")");
                    console.log(reposnseObject);
                    //pkRegistro=reposnseObject.DATA[0][0]
                    //nombre=reposnseObject.DATA[0][1]
                    //edad=reposnseObject.DATA[0][2]
                    //num=reposnseObject.DATA[0][3]
                    location.reload(true);
                
                },
                error: function () {
                    alert("Error, intentalo de nuevo");
                },
            });
                } 
                else
                {
                    return
                }
            }

     function myZoom(pkRegistro){
        
        var myData = new FormData();
        var miUrl='http://localhost:8502/Personal/CC_Personal.cfc'
            myData.append("method","obtenerRegistroModal")
			myData.append("pkRegistro",pkRegistro)
                        $.ajax({
                url:miUrl,
                type:"POST",
				contentType: false, 
    			processData: false, 
				data:myData,
                complete: function (response) {
                    var divInfo=$(response.responseText);
                    divInfo.modal();
                },
                error: function () {
                    alert("Error, intentalo de nuevo");
                },
            });
        
     }

        

    
  
    $(document).ready(function() {
        $('#myTable').DataTable();
        

/*--------------------------------------------Modal----------------------------------------------*/   
        //$("#myModal").click(function(){
        //var pleaseWaitDiv = $('<div class="modal" tabindex="-1" role="dialog">  <div class="modal-dialog" role="document">    <div class="modal-content">      <div class="modal-header">        <h5 class="modal-title">Modal title</h5>        <button type="button" class="close" data-dismiss="modal" aria-label="Close">          <span aria-hidden="true">&times;</span>        </button>      </div>      <div class="modal-body">        <p>Modal body text goes here.</p>      </div>      <div class="modal-footer">        <button type="button" class="btn btn-primary">Save changes</button>        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>      </div>    </div>  </div></div>');
        //pleaseWaitDiv.modal();
    //});
 /*------------------------------------------------------------------------------------------*/  

    } );
 
function openInNewTab(url) {
  var win = window.open(url, '_blank');
  win.focus();
}

    

  </script>