<script>
	$(document).ready(function(){
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------*/

		$("#mySend").click(function(){
            
            var txtNombre=$("#inNombre").val();
			var txtDescripcion=$("#inDescripcion").val();
			var txtPrecio=$("#inPrecio").val();

			//Serializing data to be sent
			var myData = new FormData();
			myData.append("method","registrar")
			myData.append("inNombre",txtNombre)
			myData.append("inDescripcion",txtDescripcion)
			myData.append("inPrecio",txtPrecio)
			inp=$("#inFile")[0].files[0]
			myData.append("inImagen",inp,inp.name)
			myData.append("inImagenName",inp.name)
			var url='/Administradores/Productos/C_Productos.cfc'
		
			$.ajax({
                url:url,
				type:"POST",
				contentType: false,
    			processData: false,
				data:myData,
                complete: function (response) {
					if(eval("("+response.responseText+")") =="1"){
						alert("Registro almacenado correctamente.");
				        <!---Resetea los campos de texto--->
						document.getElementById("myForm").reset();
						var miNumero=1;
						<!---Actualiza la pagina--->
						location.reload(true);
                        }
                        else{
                            alert("Error de conexion. Por favor intentalo nuevamente.");
                            }
                },
                error: function () {
                    alert("Error de conexion. Por favor intentalo nuevamente.");
                }
            });
                 
             
        });	
			
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
			



	});	
	
</script>