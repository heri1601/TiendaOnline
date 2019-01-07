  <script>
    $(document).ready(function() {
        $('#myTable').DataTable();


        
    } );


    function obtenerDatosRegistro(pkRegistro){
        var myData = new FormData();
        var miUrl='/Administradores/Duenos/C_Duenos.cfc'
            myData.append("method","obtenerRegistro")
			myData.append("pkRegistro",pkRegistro)
            $.ajax({
                url:miUrl,
                type:"POST",
				contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
    			processData: false, // NEEDED, DON'T OMIT THIS
				data:myData,
                complete: function (response) {
                    var reposnseObject=eval("("+response.responseText+")");
                    console.log(reposnseObject);

                    $("#inNombre").val(reposnseObject.DATA[0][1])
                    $("#inApellidos").val(reposnseObject.DATA[0][2])
                    $("#inEmail").val(reposnseObject.DATA[0][3])
                    $("#inPassword").val(reposnseObject.DATA[0][4])
                    $("#inPkRegistro").val(reposnseObject.DATA[0][0])
                    
                    $("#myCancel").show();
                    
                },
                error: function () {
                    alert("Error, intentalo de nuevo");
                },
            });
    }

    function eliminar(pkRegistro){
        var myData = new FormData();
        var miUrl='/Administradores/Duenos/C_Duenos.cfc'
            myData.append("method","eliminar")
			myData.append("inPkRegistro",pkRegistro)
            $.ajax({
                url:miUrl,
                type:"POST",
				contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
    			processData: false, // NEEDED, DON'T OMIT THIS
				data:myData,
                complete: function (response) {
                    var reposnseObject=eval("("+response.responseText+")");
                    if(reposnseObject=="1"){
                        alert("Registro eliminado correctamente");
                        location.reload(true);
                    }else{
                        alert("Error, por favor intentelo de nuevo");
                    }
                },
                error: function () {
                    alert("Error, intentalo de nuevo");
                },
            });
    }

    function validar(pkRegistro){
        var myData = new FormData();
        var miUrl='/Administradores/Duenos/C_Duenos.cfc'
            myData.append("method","validar")
			myData.append("inPkRegistro",pkRegistro)
            $.ajax({
                url:miUrl,
                type:"POST",
				contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
    			processData: false, // NEEDED, DON'T OMIT THIS
				data:myData,
                complete: function (response) {
                    var reposnseObject=eval("("+response.responseText+")");
                    if(reposnseObject=="1"){
                        alert("Registro validado correctamente");
                        location.reload(true);
                    }else{
                        alert("Error, por favor intentelo de nuevo");
                    }
                },
                error: function () {
                    alert("Error, intentalo de nuevo");
                },
            });
    }

    function invalidar(pkRegistro){
        var myData = new FormData();
        var miUrl='/Administradores/Duenos/C_Duenos.cfc'
            myData.append("method","invalidar")
			myData.append("inPkRegistro",pkRegistro)
            $.ajax({
                url:miUrl,
                type:"POST",
				contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
    			processData: false, // NEEDED, DON'T OMIT THIS
				data:myData,
                complete: function (response) {
                    var reposnseObject=eval("("+response.responseText+")");
                    if(reposnseObject=="1"){
                        alert("Registro invalidado correctamente");
                        location.reload(true);
                    }else{
                        alert("Error, por favor intentelo de nuevo");
                    }
                },
                error: function () {
                    alert("Error, intentalo de nuevo");
                },
            });
    }



/*


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
        
     }*/

        

    
  
    
 
    

  </script>