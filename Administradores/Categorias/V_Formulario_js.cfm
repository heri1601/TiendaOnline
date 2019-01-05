<script>
	$(document).ready(function(){
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------*/

		$("#btnCancelar").click(function(){
                        $("#myForm").trigger("reset");
                         });

		$("#btnRegistrar").click(function(){
			var txtPkregistro=$("#inPkRegistro").val();
            var txtNombre=$("#inNombre").val();
			var txtDescripcion=$("#inDescripcion").val();

			//Serializing data to be sent
			var myData = new FormData();
			if(txtPkregistro!='')myData.append("method","modificar")
			else myData.append("method","registrar")
			myData.append("inpkRegistro",txtPkregistro)
			myData.append("inNombre",txtNombre)
			myData.append("inDescripcion",txtDescripcion)
			
			var url='/Administradores/Categorias/C_Categorias.cfc'
		
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