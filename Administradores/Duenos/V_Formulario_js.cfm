<script>
	$(document).ready(function(){
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------*/

		$("#btnCancelar").click(function(){
                        $("#myForm").trigger("reset");
                         });

		$("#btnRegistrar").click(function(){
			var txtPkregistro=$("#inPkRegistro").val();
            var txtNombre=$("#inNombre").val();
			var txtApellidos=$("#inApellidos").val();
			var txtEmail=$("#inEmail").val();
			var txtPassword=$("#inPassword").val();

			//Serializing data to be sent
			var myData = new FormData();
			if(txtPkregistro!='')myData.append("method","modificar")
			else myData.append("method","registrar")
			
			myData.append("inPkRegistro",txtPkregistro)
			myData.append("inNombre",txtNombre)
			myData.append("inApellidos",txtApellidos)
			myData.append("inEmail",txtEmail)
			myData.append("inPassword",txtPassword)
			var url='/Administradores/Duenos/C_Duenos.cfc'
		
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