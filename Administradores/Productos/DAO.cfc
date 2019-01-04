<cfcomponent>
	<cffunction name="registrar" access="package">
		<cfargument name="inNombre"   		type="string" required="yes">
		<cfargument name="inDescripcion"    type="string"  required="yes">
		<cfargument name="inPrecio"     	type="number"  required="yes">
		<cfargument name="inImagen"     	type="string"  required="yes">
		<cfscript>
		</cfscript>
		<cfquery  datasource="myDatasource" result="resultData">
			INSERT INTO T_PRODUCTOS (
			TPR_PK_PRODUCTO, TPR_NOMBRE, TPR_DESCRIPCION, 
			TPR_PRECIO, TPR_IMAGEN, TPR_FK_ESTADO, 
			TPR_FECHA_REGISTRO) 
			VALUES ( 0,
			'#inNombre#',
			'#inDescripcion#',
			'#inPrecio#',
			'#inImagen#',
			1,
			sysdate )
		</cfquery>

		<cfquery  datasource="myDatasource" name="resultData2">
			SELECT 
			TPR_PK_PRODUCTO
			FROM TIENDAS.T_PRODUCTOS
			WHERE 
			ROWID='#resultData.GENERATEDKEY#'
		</cfquery>

		<cfreturn resultData2.TPR_PK_PRODUCTO>
	</cffunction>
/*----------------------------------------------------------------------------------------------------------------*/
	<cffunction name="obtenerDatosRegistro" access="remote">

		<cfargument name="Pk_registro"							type="numeric"	required="yes">
		<cfargument name="Estado"					    		type="numeric"	required="yes">
		<cfstoredproc PROCEDURE="MYUSER.MYPACKAGE.MODIFICAR_EMPLEADO" datasource="myDataSource">
				<cfprocparam value="#Pk_registro#" 					cfsqltype="cf_sql_number" 	type="in">
				<cfprocparam value="#Estado#" 				        cfsqltype="cf_sql_number" 	type="in">
				<cfprocparam variable="pkregistro"					cfsqltype="cf_sql_integer" 	type="out">
			</cfstoredproc>
			<cfoutput>
			#SerializeJSON(Pk_registro)#//Mal
			<!---#pkEmpleado# --->
			</cfoutput>
	</cffunction>

/*-----------------------------------------------------------------------------------------------------------------------*/
	<cffunction name="actualizarDatosRegistro" access="remote">

		<cfargument name="Pk_registro"					type="numeric"	required="yes">
		<cfargument name="Nombre"					    type="string"	required="yes">
		<cfargument name="Edad"							type="numeric"	required="yes">
		<cfargument name="Num_Tel"					    type="numeric"	required="yes">
		<cfargument name="Entidad"					    type="numeric"	required="yes">
		<cfargument name="Pais"					    	type="numeric"	required="yes">
		<cfstoredproc PROCEDURE="MYUSER.MYPACKAGE.ACTUALIZAR_EMPLEADO" datasource="myDataSource">
				<cfprocparam value="#Pk_registro#" 					cfsqltype="cf_sql_number" 	type="in">
				<cfprocparam value="#Nombre#" 					    cfsqltype="cf_sql_varchar" 	type="in">
				<cfprocparam value="#Edad#" 						cfsqltype="cf_sql_number" 	type="in">
				<cfprocparam value="#Num_Tel#" 				        cfsqltype="cf_sql_number" 	type="in">
				<cfprocparam value="#Entidad#" 				        cfsqltype="cf_sql_number" 	type="in">
				<cfprocparam value="#Pais#" 				        cfsqltype="cf_sql_number" 	type="in">
				<cfprocparam variable="pkregistro"					cfsqltype="cf_sql_integer" 	type="out">
			</cfstoredproc>
			<cfoutput>
            <!---PK_REGISTRO='#arguments.pkRegistro#'
			--->
			#SerializeJSON(Pk_registro)#//Mal
			</cfoutput>
	</cffunction>

/*-----------------------------------------------------------------------------------------------------------------------*/
	<cffunction name="People" access="remote">
	<cfquery name="resultadoQuery" datasource="myDataSource">

		SELECT 
            PK_REGISTRO, 
            NOMBRE, 
            EDAD, 
            NUM_TEL,
            ESTADO
		FROM MYUSER.DATASCHOOL
		ORDER BY PK_REGISTRO ASC

        </cfquery>
    
    <cfscript>
		writedump(resultadoQuery);
	</cfscript>--->

    <cfinclude template="dataBase.cfm">
	</cffunction>
<!------------------------------------------------------------------------------------------->
<cffunction name="obtenerDatosRegistro1" access="remote">
		<cfargument name="pkRegistro"					    type="any"	required="yes">
			<cfquery name="resultadoQuery" datasource="myDataSource">
		SELECT 
            PK_REGISTRO, 
            NOMBRE, 
            EDAD, 
            NUM_TEL,
            ESTADO,
			FK_ENTIDAD,
			FK_PAIS
FROM MYUSER.DATASCHOOL
WHERE 
PK_REGISTRO='#arguments.pkRegistro#'
        </cfquery>
	<cfreturn resultadoQuery>
	</cffunction>
<!------------------------------------------------------------------------------------------->
<cffunction  name="obtenerRegistros">
	<cfquery name="resultadoQuery" datasource="myDataSource">
		SELECT 
			TPR_PK_PRODUCTO, TPR_NOMBRE, TPR_DESCRIPCION, 
			TPR_PRECIO, TPR_IMAGEN, TPR_FK_ESTADO, 
			TPR_FECHA_REGISTRO
			FROM TIENDAS.T_PRODUCTOS
			WHERE 
			TPR_FK_ESTADO>0
			ORDER BY TPR_PK_PRODUCTO DESC
    </cfquery>
	<cfreturn resultadoQuery>
</cffunction>
/*-----------------------------------------------------------------------------------------------------------------------*/
<!---<cffunction  name="obtenerEntidades" access="remote">
	<cfquery name="resultadoQuery" datasource="myDataSource">
  SELECT PK_ENTIDAD, 
         ENTIDADES
    FROM MYUSER.C_ENTIDADES
ORDER BY PK_ENTIDAD ASC
        </cfquery>
	<cfreturn resultadoQuery>
</cffunction>--->

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

/*-----------------------------------------------------------------------------------------------------------------------*/

<cffunction  name="obtenerPaises" access="remote">
	<cfquery name="resultadoQuery" datasource="myDataSource">
SELECT PK_PAIS,
		PAIS
	FROM MYUSER.C_PAIS
	ORDER BY PK_PAIS ASC
        </cfquery>
	<cfreturn resultadoQuery>
</cffunction>
/*-----------------------------------------------------------------------------------------------------------------------*/

</cfcomponent>