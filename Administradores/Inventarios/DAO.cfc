<cfcomponent>
	<cffunction name="registrar" access="package">
		<cfargument name="inNombre"   		type="string" required="yes">
		<cfargument name="inDescripcion"    type="string"  required="yes">
		<cfscript>
		</cfscript>
		<cfquery  datasource="myDatasource" result="resultData">
			/* Formatted on 05/01/2019 07:12:58 a. m. (QP5 v5.269.14213.34769) */
INSERT INTO TIENDAS.C_CATEGORIAS (CCA_PK_CATEGORIA,
                                  CCA_NOMBRE,
                                  CCA_DESCRIPCION,
                                  CCA_FK_ESTADO)
     VALUES (0,
			'#inNombre#',
			'#inDescripcion#',
			1
             )
		</cfquery>
		<cfreturn resultData.GENERATEDKEY>
	</cffunction>

	<cffunction name="modificar" access="package">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfargument name="inNombre"   		type="string" required="yes">
		<cfargument name="inDescripcion"    type="string"  required="yes">
		<cfscript>
		</cfscript>
		<cfquery  datasource="myDatasource" result="resultData">
		UPDATE TIENDAS.C_CATEGORIAS
		SET   
			CCA_NOMBRE       = '#inNombre#',
			CCA_DESCRIPCION  = '#inDescripcion#'
		WHERE  CCA_PK_CATEGORIA = '#inPkRegistro#'
		</cfquery>
		<cfreturn resultData.RECORDCOUNT>
	</cffunction>

	<cffunction name="actualizarEstado" access="package">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfargument name="inEstado"   		type="numeric" required="yes">
		<cfscript>
		//writeDump(arguments);
		</cfscript>
		<cfquery  datasource="myDatasource" result="resultData">
			UPDATE  C_CATEGORIAS SET 
			CCA_FK_ESTADO='#inEstado#'
			WHERE 
			CCA_PK_CATEGORIA='#inPkRegistro#'
		</cfquery>
		<cfreturn resultData.RECORDCOUNT>
	</cffunction>

<cffunction  name="obtenerRegistros">
	<cfquery name="resultadoQuery" datasource="myDataSource">
			SELECT 
				CCA_PK_CATEGORIA PK, 
				CCA_NOMBRE NOMBRE, 
				CCA_DESCRIPCION DESCRIPCION, 
				CCA_FK_ESTADO ESTADO
				FROM TIENDAS.C_CATEGORIAS
				WHERE 
				CCA_FK_ESTADO>0
    </cfquery>
	<cfreturn resultadoQuery>
</cffunction>

<cffunction name="obtenerDatosRegistro" access="remote">
		<cfargument name="pkRegistro"					    type="any"	required="yes">
			<cfquery name="registro" datasource="myDataSource">
		SELECT 
				CCA_PK_CATEGORIA PK, 
				CCA_NOMBRE NOMBRE, 
				CCA_DESCRIPCION DESCRIPCION, 
				CCA_FK_ESTADO ESTADO
				FROM TIENDAS.C_CATEGORIAS
				WHERE 
				CCA_PK_CATEGORIA='#pkRegistro#'
        </cfquery>
	<cfreturn registro>
	</cffunction>

<cffunction  name="obtenerCatalogo" access="remote">
	<cfargument name="tableName">
	<cfargument name="KeyField">
	<cfargument name="TextField">
	<cfargument name="StateField">
	<cfquery name="resultadoQuery" datasource="myDataSource">
  		SELECT 
		  	#KeyField# PK,
			#TextField#	   TXT
		FROM #nombreTabla#
		WHERE
		#StateField# =2
		ORDER BY #TextField# ASC
        </cfquery>
	<cfreturn resultadoQuery>
</cffunction>



</cfcomponent>