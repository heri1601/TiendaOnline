<script>
	$(document).ready(function(){
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------*/

		$("#mySend").click(function(){
            
            var txtNombre=$("#inNombre").val();
			var txtDescripcion=$("#inDescripcion").val();
			var txtPrecio=$("#inDescripcion").val();

			//Serializing data to be sent
			var myData = new FormData();
			myData.append("method","registrar")
			myData.append("inNombre",txtNombre)
			myData.append("inDescripcion",txtDescripcion)
			myData.append("inPrecio",txtPrecio)
			inp=$("#inFile")[0].files[0]
			myData.append("inImagen",inp,inp.name)
			var url='http://localhost:8502/Administradores/C_Productos.cfc'
		
			$.ajax({
                url:url,
				type:"POST",
				contentType: false,
    			processData: false,
				data:myData,
                complete: function (response) {
					if(eval("("+response.responseText+")") !=""){
                        <!---Muestra una alerta de "registro guardado" en la pantalla--->
						alert("Registro guardado");
				        <!---Resetea los campos de texto--->
						document.getElementById("myForm").reset();
						var miNumero=1;
						<!---Actualiza la pagina--->
						location.reload(true);
                        }
                        else{
                            alert("No se guardo bien");
                            }
                },
                error: function () {
                    alert("Error, intentalo de nuevo");
                }
            });
                 
             
        });	
			
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
			$("#myModify").click(function(){

			var textopkRegistro =	$("#inPkRegistro").val();
			var textoNombre =		$("#Name").val();
			var textoEdad =			$("#Edad").val();
			var textoNum =			$("#Num").val();
			var textoEntidad =		$("#inNacional").val();
			var textoPais =			$("#inNacional").val();
			var myData = 			new FormData();
			if($("#checkExtranjero").prop('checked')==true){
				myData.append("method","ActualizarRegistroExtranjero")
				myData.append("Pais",textoPais)
			}
			else{
				myData.append("method","ActualizarRegistroNacional")
				myData.append("Entidad",textoEntidad)

			}
			myData.append("Pk_registro",textopkRegistro)
			myData.append("Nombre",textoNombre)
			myData.append("Edad",textoEdad)
			myData.append("Num_Tel",textoNum)
			/*-----alert(textoEntidad);----*/
			var miUrl='http://localhost:8502/Personal/CC_Personal.cfc'
			/*var miUrl='http://localhost:8502/DAO_inputUser.cfc?method=actualizarDatosRegistro&Pk_registro='+textopkRegistro+'&Nombre='+textoNombre+'&Edad='+textoEdad+'&Num_Tel='+textoNum+'&Entidad='+textoEntidad	*/
				/*-----alert(miUrl);-----*/
			$.ajax({
                url:miUrl,
				type:"POST",
				contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
    			processData: false, // NEEDED, DON'T OMIT THIS
				data:myData,
				<!---recibe la respusta de la url--->
                complete: function (response) {
					<!---Hace la comparacion de la respuesta recibida, que se diferente de vacio--->
					if(eval("("+response.responseText+")") !=""){
                        <!---Muestra una alerta de "registro guardado" en la pantalla--->
						alert("Registro Modificado");
				        <!---Resetea los campos de texto--->
						document.getElementById("myForm").reset();
						<!---Actualiza la pagina--->
						location.reload(true);
                        }
                        else{
                            alert("No se guardo bien");
                            }
                },
                error: function () {
                    alert("Error, intentalo de nuevo");
                },
            });
        });




	});	
	
</script>