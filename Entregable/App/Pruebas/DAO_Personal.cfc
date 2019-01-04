<cfcomponent>
	<cffunction name="insertUserNacional" access="package">
		<cfargument name="Nombre"					    type="string"	required="yes">
		<cfargument name="Edad"							type="numeric"	required="yes">
		<cfargument name="Num_Tel"					    type="numeric"	required="yes">
		<cfargument name="Estado"					    type="numeric"	required="yes">
		<cfargument name="Entidad"					    type="numeric"	required="yes">
		<cfargument name="Pais"					    	type="numeric"	required="yes">
		<cfstoredproc PROCEDURE="MYUSER.MYPACKAGE.NUEVO_EMPLEADO" datasource="MiDatasource">
				<cfprocparam value="#Nombre#" 					    cfsqltype="cf_sql_varchar" 	type="in">
				<cfprocparam value="#Edad#" 						cfsqltype="cf_sql_number" 	type="in">
				<cfprocparam value="#Num_Tel#" 				        cfsqltype="cf_sql_number" 	type="in">
				<cfprocparam value="#Estado#" 				        cfsqltype="cf_sql_number" 	type="in">
				<cfprocparam value="#Entidad#" 				        cfsqltype="cf_sql_number" 	type="in">
				<cfprocparam value="#Pais#" 				        cfsqltype="cf_sql_number" 	type="in">
				<cfprocparam variable="pkEmpleado"					cfsqltype="cf_sql_integer" 	type="out">
		</cfstoredproc>
		<cfreturn pkEmpleado>
	</cffunction>
/*----------------------------------------------------------------------------------------------------------------*/
	<cffunction name="obtenerDatosRegistro" access="remote">

		<cfargument name="Pk_registro"							type="numeric"	required="yes">
		<cfargument name="Estado"					    		type="numeric"	required="yes">
		<cfstoredproc PROCEDURE="MYUSER.MYPACKAGE.MODIFICAR_EMPLEADO" datasource="MiDatasource">
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
		<cfstoredproc PROCEDURE="MYUSER.MYPACKAGE.ACTUALIZAR_EMPLEADO" datasource="MiDatasource">
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
	<cfquery name="resultadoQuery" datasource="MiDatasource">

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
			<cfquery name="resultadoQuery" datasource="MiDatasource">
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
	<cfquery name="resultadoQuery" datasource="MiDatasource">
		SELECT DATASCHOOL.PK_REGISTRO,
			NOMBRE,
			EDAD,
			NUM_TEL,
			ESTADO,
			C_ENTIDADES.ENTIDADES,
			C_PAIS.PAIS
		FROM DATASCHOOL
			INNER JOIN C_ENTIDADES
				ON DATASCHOOL.FK_ENTIDAD = C_ENTIDADES.PK_ENTIDAD
				INNER JOIN C_PAIS
				ON DATASCHOOL.FK_PAIS = C_PAIS.PK_PAIS
		WHERE    (ESTADO BETWEEN 1 AND 2)--Perfecto estado>0
		ORDER BY PK_REGISTRO ASC
    </cfquery>
	<cfreturn resultadoQuery>
</cffunction>
/*-----------------------------------------------------------------------------------------------------------------------*/
<cffunction  name="obtenerEntidades" access="remote">
	<cfquery name="resultadoQuery" datasource="MiDatasource">
  SELECT PK_ENTIDAD, 
         ENTIDADES
    FROM MYUSER.C_ENTIDADES
ORDER BY PK_ENTIDAD ASC
        </cfquery>
	<cfreturn resultadoQuery>
</cffunction>
/*-----------------------------------------------------------------------------------------------------------------------*/

<cffunction  name="obtenerPaises" access="remote">
	<cfquery name="resultadoQuery" datasource="MiDatasource">
SELECT PK_PAIS,
		PAIS
	FROM MYUSER.C_PAIS
	ORDER BY PK_PAIS ASC
        </cfquery>
	<cfreturn resultadoQuery>
</cffunction>
/*-----------------------------------------------------------------------------------------------------------------------*/

</cfcomponent>