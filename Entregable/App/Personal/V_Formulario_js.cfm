<script>
	$(document).ready(function(){
		$("#myModify").hide();
		$("#myCancel").hide();
		$("#mySendExtranjero").hide();
		$("#myIMG").click(function(){
			
			$( "myIMG" ).toggle();
		});
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------*/

		$("#mySend").click(function(){
            
            var textoNombre=$("#Name").val();
			var textoEdad=$("#Edad").val();
			var textoNum=$("#Num").val();
			//var textoEstado=$("#Estado").val();
			var textoNacionalidad=$("#inNacional").val();
			/*-------------------------*/
			var patternNum = /^[0-9]{8}$/
			var patternEdad = /^[0-9]+$/
			/*-------------------------*/
			var myData = new FormData();
			myData.append("method","registrar")
			myData.append("Nombre",textoNombre)
			myData.append("Edad",textoEdad)
			myData.append("Num_Tel",textoNum)
			//myData.append("Estado","1")
			myData.append("Entidad",textoNacionalidad)
			//myData.append("Pais","0")
			inp=$("#archivo")[0].files[0]
			//console.log(myData)
			myData.append("archivo",inp,'acta.txt')
			
		
			var miUrl='http://localhost:8502/Personal/CC_Personal.cfc'
				<!---Muestra una alerta en la pantalla--->
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------*/			
			console.log(textoNombre)
			if(textoNombre==""){
				alert("Campo vacio")
				$("#Name").focus();
				return
			}

		
			console.log(textoEdad)
			if(textoEdad=="")	{
				alert("Campo vacio")
				$("#Edad").focus();
				return
					}
			
			if(!patternEdad.test(textoEdad))
			{
			alert('Numero invalido');
			$("#Edad").focus();
			return
			}

			console.log(textoNum)
			if(textoNum=="")	{
				alert("Campo vacio")
				$("#Num").focus();
				return
					}

			if(!patternNum.test(textoNum))
			{
			alert('Numero invalido');
			$("#Num").focus();
			return
			}

			console.log(textoNacionalidad)
			if(textoNacionalidad=="0")	{
				alert("Seleccione una Entidad")
				$("#inNacional").focus();
				return
					}
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------*/
		console.log(myData)
		var r = confirm("Desea Enviarlo");
                if (r == true) { 
					$.ajax({
                url:miUrl,
				type:"POST",
				contentType: false,
    			processData: false,
				data:myData,				<!---recibe la respusta de la url--->
                complete: function (response) {
					<!---Hace la comparacion de la respuesta recibida, que se diferente de vacio--->
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
                },
            });
                } 
                else
                {
                    return
                }    
             
        });	
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------*/	

		$("#mySendExtranjero").click(function(){
            
            var textoNombre=$("#Name").val();
			var textoEdad=$("#Edad").val();
			var textoNum=$("#Num").val();
			//var textoEstado=$("#Estado").val();
			var textoNacionalidad=$("#inNacional").val();
			var myData = new FormData();
			myData.append("method","registrarExtranjero")
			myData.append("Nombre",textoNombre)
			myData.append("Edad",textoEdad)
			myData.append("Num_Tel",textoNum)
			//myData.append("Estado","1")
			//myData.append("Entidad","0")
			myData.append("Pais",textoNacionalidad)
			inp=$("#archivo")[0].files[0]
			myData.append("archivo",inp,'acta.txt')

			var miUrl='http://localhost:8502/Personal/CC_Personal.cfc'
				<!---Muestra una alerta en la pantalla--->
			
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------*/			
			console.log(textoNombre)
			if(textoNombre==""){
				alert("Campo vacio")
				$("#Name").focus();
				return
			}
		
			console.log(textoEdad)
			if(textoEdad=="")	{
				alert("Campo vacio")
				$("#Edad").focus();
				return
					}
			
			console.log(textoNum)
			if(textoNum=="")	{
				alert("Campo vacio")
				$("#Num").focus();
				return
					}

			console.log(textoNacionalidad)
			if(textoNacionalidad=="0")	{
				alert("Seleccione una Entidad")
				$("#inNacional").focus();
				return
					}
/*----------------------------------------------------------------------------------------------------------------------------------------------------------*/

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
                },
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

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

$("#checkExtranjero").click(function(){
		$("#mySend").hide();
		$("#mySendExtranjero").show();
		checked=$("#checkExtranjero").is(":checked")
		alert(checked);
		if(checked){
        inHtml='<cfoutput>'+
		'<cfset myNumber="#Request.resultadoQueryPais.recordcount#"-1>'+
		'<select id="inNacional" name="Nacional">'+
		'<option value="0">Seleccione una opci&oacute;n</option>'+
		'<cfloop index="i" from="1" to=#myNumber#>'+
        '<option value=#i#>#Request.resultadoQueryPais['PAIS'][++i]#</option>'+
		'</cfloop>'+
      	'</select>'+
		'</cfoutput>'
		$("#inNacional").html(inHtml);
		}
		else{
		$("#mySend").show();
		$("#mySendExtranjero").hide();
		inHtml= '<cfoutput>'+
		'<cfset myNumber="#Request.resultadoQueryEntidad.recordcount#"-1>'+
		'<select id="inNacional" name="Nacional">'+
		'<option value="0">Seleccione una opci&oacute;n</option>'+
		'<cfloop index="i" from="1" to=#myNumber#>'+
        '<option value=#i#>#Request.resultadoQueryEntidad['ENTIDADES'][++i]#</option>'+
		'</cfloop>'+
      	'</select>'+
		'</cfoutput>'
		}
      $("#inNacional").html(inHtml);
      
    });

/*------------------------------------------------------------------------------------------------------------------------------------------------------------------*/	
$("#info").click(function () {
        popover({
        })
})

	});	
	
</script>