<cfcomponent>
	<cffunction name="registrar" access="package">
		<cfargument name="inNombre"   		type="string" required="yes">
		<cfargument name="inApellidos"   		type="string" required="yes">
		<cfargument name="inEmail"   		type="string" required="yes">
		<cfargument name="inPassword"   		type="string" required="yes">
		<cfscript>
		</cfscript>
		<cfquery  datasource="myDatasource" result="resultData">
			/* Formatted on 05/01/2019 07:12:58 a. m. (QP5 v5.269.14213.34769) */
		INSERT INTO T_USUARIOS (
		TUS_PK_USUARIO, TUS_NOMBRE, TUS_APELLIDOS, 
		TUS_USERNAME, TUS_PASSWORD, TUS_EMAIL, 
		TUS_FK_ESTADO, TUS_FK_TIPO_USUARIO) 
		VALUES ( 0,
		'#inNombre#',
		'#inApellidos#',
		'#inEmail#',
		'#inPassword#',
		'#inEmail#',
		1,
		2 )
		</cfquery>
		<cfreturn resultData.GENERATEDKEY>
	</cffunction>

	<cffunction name="modificar" access="package">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfargument name="inNombre"   		type="string" required="yes">
		<cfargument name="inApellidos"   		type="string" required="yes">
		<cfargument name="inEmail"   		type="string" required="yes">
		<cfargument name="inPassword"    type="string"  required="yes">
		<cfscript>
		</cfscript>
		<cfquery  datasource="myDatasource" result="resultData">
		UPDATE T_USUARIOS
			SET  
				TUS_NOMBRE          ='#inNombre#',
				TUS_APELLIDOS       ='#inApellidos#',
				TUS_USERNAME        ='#inEmail#',
				TUS_PASSWORD        ='#inPassword#',
				TUS_EMAIL           ='#inEmail#'
			WHERE  TUS_PK_USUARIO      ='#inPkRegistro#'
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
			UPDATE T_USUARIOS
			SET   
				TUS_FK_ESTADO       = '#inEstado#'
			WHERE  TUS_PK_USUARIO      = '#inPkRegistro#'
		</cfquery>
		<cfreturn resultData.RECORDCOUNT>
	</cffunction>

<cffunction  name="obtenerRegistros">
	<cfquery name="resultadoQuery" datasource="myDataSource">
			SELECT 
			TUS_PK_USUARIO PK, 
			TUS_NOMBRE NOMBRE, 
			TUS_APELLIDOS APELLIDOS, 
			TUS_USERNAME USERNAME, 
			TUS_PASSWORD PASSWORD, 
			TUS_EMAIL EMAIL, 
			TUS_FK_ESTADO ESTADO
			FROM TIENDAS.T_USUARIOS
			WHERE 
			TUS_FK_TIPO_USUARIO=2 AND
			TUS_FK_ESTADO>0

    </cfquery>
	<cfreturn resultadoQuery>
</cffunction>

<cffunction name="obtenerDatosRegistro" access="remote">
		<cfargument name="pkRegistro"					    type="any"	required="yes">
			<cfquery name="registro" datasource="myDataSource">
					SELECT 
			TUS_PK_USUARIO PK, 
			TUS_NOMBRE NOMBRE, 
			TUS_APELLIDOS APELLIDOS, 
			TUS_USERNAME USERNAME, 
			TUS_PASSWORD PASSWORD, 
			TUS_EMAIL EMAIL, 
			TUS_FK_ESTADO ESTADO
			FROM TIENDAS.T_USUARIOS
			WHERE 
			TUS_FK_TIPO_USUARIO=2 AND
			TUS_PK_USUARIO='#pkRegistro#'
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