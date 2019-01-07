<script>
	$(document).ready(function(){
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------*/

		$("#btnCancelar").click(function(){
                        $("#myForm").trigger("reset");
                         });

		$("#btnRegistrar").click(function(){
			var txtPkregistro=$("#inPkRegistro").val();
            var txtTienda=$("#inTienda").val();
			var txtProducto=$("#inProducto").val();
			var txtCantidad=$("#inCantidad").val();
			var txtDescripcion=$("#inDescripcion").val();

			//Serializing data to be sent
			var myData = new FormData();
			if(txtPkregistro!='')myData.append("method","modificar")
			else myData.append("method","registrar")
			myData.append("inpkRegistro",txtPkregistro)
			myData.append("inTienda",txtTienda)
			myData.append("inProducto",txtProducto)
			myData.append("inCantidad",txtCantidad)
			myData.append("inDescripcion",txtDescripcion)
			
			var url='/Administradores/Inventarios/C_Inventarios.cfc'
		
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