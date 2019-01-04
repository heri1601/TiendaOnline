  <title>Plantilla Base de Datos</title>
  <meta charset="utf-8">
  
<cfinclude  template="T_dataBaseBeta_js.cfm">

    <style>
  .bg-1 { 
      background-color: #1abc9c; /* Green */
      background-size: cover;
  }
  .bg-2 { 
      background-color: #474e5d; /* Dark Blue */
      color: #ffffff;
  }
  .bg-3 { 
      background-color: #fff; /* White */
      color: #555555;
  }
    .back{
        background-color: #474e5d;
        background-image:url(https://image.ibb.co/iYB30A/bg-pattern.png);
        }
    body{
        background-color: #474e5d;
        background-image:url(https://image.ibb.co/iYB30A/bg-pattern.png);
    }
    
     h1,p{
    color: #000000;
}
  </style> 

<div class="jumbotron back">
  <div class="container text-center">
    <font color=#d9d9d9 face="arial" size=7>
    Tablas de Informaci&oacute;n
    </font>   
    <p>
    <font color=#d9d9d9 face="arial" size=3>
    Tablas de Informaci&oacute;n
    </font>     
    

<div class="back bg-1">

<div class="container bg-1">
  <h3>Tabla</h3>
  <p>Tabla de base de datos</p>
  
<cfoutput>
    <h2>El numero de registros en la tabla es de #Request.resultadoQuery.recordcount#</h2>
    <!---<cfdump var=#resultadoQuery#>--->
   
    <table class="hover order-column stripe ui celled table" id="myTable" style="width:100%"String>
    <thead>
      <tr>
        <th>Num.</th>
        <th>Nombre</th>
        <th>Edad</th>
        <th>Numero telefonico</th>
        <th>Estado</th>     
        <th>Entidad</th>
        <th>Pa&iacute;s</th>  
        <th>Acciones</th>  
      </tr>
    </thead>

    <cfloop from="1" to=#Request.resultadoQuery# index="i">
      <tr>
        <td>#i#</td>
        <td>#Request.resultadoQuery['NOMBRE'][i]#</td>
        <td>#Request.resultadoQuery['EDAD'][i]#</td>
        <td>#Request.resultadoQuery['NUM_TEL'][i]#</td>
        <td>#Request.resultadoQuery['ESTADO'][i]#</td>
        <td>#Request.resultadoQuery['ENTIDADES'][i]#</td>
        <td>#Request.resultadoQuery['PAIS'][i]#</td>
        <td>
            
            <cfif #Request.resultadoQuery['ESTADO'][i]# EQ 1>
            <button id= "myElimi" type="button" class="button" onclick="EliminarDatosRegistro(#Request.resultadoQuery['PK_REGISTRO'][i]#)"><img src="https://image.flaticon.com/icons/svg/61/61848.svg" style="width:25px"> </button>
            <button id= "myOk" type="button" class="button" onclick="modificarDatosRegistro(#Request.resultadoQuery['PK_REGISTRO'][i]#)"><img src="https://image.flaticon.com/icons/svg/58/58679.svg" style="width:25px"></button>
            <button id= "myUPDATE" type="button" class="button" onclick="obtenerDatosRegistro(#Request.resultadoQuery['PK_REGISTRO'][i]#)" ><img src="https://image.flaticon.com/icons/svg/54/54551.svg" style="width:25px"></button>
            <cfelseif #Request.resultadoQuery['ESTADO'][i]# EQ 2> 
            <button id= "myModal" type="button" class="button" onclick="myZoom(#Request.resultadoQuery['PK_REGISTRO'][i]#)" ><img src="https://images.vexels.com/media/users/3/143437/isolated/preview/390e394e1ea17f2b8361c8a16d88364e-lupa-icono-simple-by-vexels.png" style="width:25px"></button>
            </cfif>
            
        </td>
        
        

      </tr>
    </cfloop>



    </tbody>
    </table>
    

 
<input type="button" class="btn btn-success" onclick="openInNewTab('/Personal/CC_Personal.cfc?method=PDF')" value="Descargar" name="boton" /> 
<!---<button id="myModal" type="button" class="btn btn-info btn-lg" >Open Modal</button>--->

</cfoutput>
</div>
</div>
</div>
</div>
