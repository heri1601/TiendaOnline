    <cfdocument format="pdf">
    Tabla de Informac&iacute;on 
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
      </tr>
    </thead>

    <cfloop from="1" to=#Request.resultadoQuery.recordcount# index="i">
      <tr>
        <td>#i#</td>
        <td>#Request.resultadoQuery['NOMBRE'][i]#</td>
        <td>#Request.resultadoQuery['EDAD'][i]#</td>
        <td>#Request.resultadoQuery['NUM_TEL'][i]#</td>
        <td>#Request.resultadoQuery['ESTADO'][i]#</td>
        <td>#Request.resultadoQuery['ENTIDADES'][i]#</td>
        <td>#Request.resultadoQuery['PAIS'][i]#</td>
      </tr>
    </cfloop>
    </tbody>
    </table>
</cfoutput>
    <cfdocumentitem type="header">
    </cfdocumentitem >
    <cfdocumentitem type="footer"> 
    <div align="center">
    <font color="navy" size="1" face="Tahoma">
    Page 
        <cfoutput>
    #cfdocument.currentpagenumber# 
        </cfoutput>/
        <cfoutput> 
            #cfdocument.totalpagecount# 
        </cfoutput>
    </font> 
    </div> 
    </cfdocumentitem> 
 </cfdocument>


