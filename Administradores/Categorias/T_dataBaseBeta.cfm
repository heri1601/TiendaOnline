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



    
    
     h1,p{
    color: #000000;
}
  </style> 


    

<div class="back ">

<div class="container ">
<div class="text-center"><h3>Elementos registrados</h3></div>
  
<cfoutput>
    <!---<h2>El numero de registros en la tabla es de #Request.registros.recordcount#</h2>--->
    <!---<cfdump var=#registros#>--->
   
    <table class="hover order-column stripe ui celled table" id="myTable" style="width:100%"String>
    <thead>
      <tr>
        <th>Num.</th>
        <th>Nombre</th>
        <th>Descripci&oacute;n</th>     
        <th>Estado</th> 
        <th>Acciones</th>  
      </tr>
    </thead>

    <cfloop from="1" to=#Request.registros.recordcount# index="i">
      <tr>
        <td>#i#</td>
        <td>#Request.registros['NOMBRE'][i]#</td>
        <td>#Request.registros['DESCRIPCION'][i]#</td>
        <td>#Request.registros['ESTADO'][i]#</td>
        <td>
            
            <cfif #Request.registros['ESTADO'][i]# EQ 1>
            <button id= "myElimi" type="button" class="button" onclick="eliminar(#Request.registros['PK'][i]#)"><img src="https://image.flaticon.com/icons/svg/61/61848.svg" style="width:25px"> </button>
            <button id= "myOk" type="button" class="button" onclick="validar(#Request.registros['PK'][i]#)"><img src="https://image.flaticon.com/icons/svg/58/58679.svg" style="width:25px"></button>
            <button id= "myUPDATE" type="button" class="button" onclick="obtenerDatosRegistro(#Request.registros['PK'][i]#)" ><img src="https://image.flaticon.com/icons/svg/54/54551.svg" style="width:25px"></button>
            <cfelseif #Request.registros['ESTADO'][i]# EQ 2> 
            <button id= "myModal" type="button" class="button" onclick="myZoom(#Request.registros['PK'][i]#)" ><img src="https://images.vexels.com/media/users/3/143437/isolated/preview/390e394e1ea17f2b8361c8a16d88364e-lupa-icono-simple-by-vexels.png" style="width:25px"></button>
            <button id= "myModal" type="button" class="button" onclick="invalidar(#Request.registros['PK'][i]#)" ><img src="https://cdn4.iconfinder.com/data/icons/proglyphs-files-and-folders/512/Visibility_Hidden-512.png" style="width:25px"></button>
            </cfif>
            
        </td>
        
        

      </tr>
    </cfloop>



    </tbody>
    </table>
    

 


</cfoutput>
</div>
</div>
</div>
</div>
