<cfcomponent>
	<cffunction name="registrar" access="package">
		<cfargument name="inNombre"   		type="string" required="yes">
		<cfargument name="inDescripcion"    type="string"  required="yes">
		<cfargument name="inPrecio"     	type="string"  required="yes">
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

		<!---Adding a default category--->
		<cfquery  datasource="myDatasource" result="resultData">
			INSERT INTO TIENDAS.T_CATEGORIAS_PRODUCTOS (
			TCP_PK_CATEGORIA_PRODUCTO, TCP_FK_CATEGORIA, TCP_FK_PRODUCTO, 
			TCP_FK_ESTADO) 
			VALUES ( 0,
			9,
			#resultData2.TPR_PK_PRODUCTO#,
			2)
		</cfquery>

		<cfreturn resultData2.TPR_PK_PRODUCTO>
	</cffunction>

	<cffunction name="modificar" access="package">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfargument name="inNombre"   		type="string" required="yes">
		<cfargument name="inDescripcion"    type="string"  required="yes">
		<cfargument name="inPrecio"     	type="string"  required="yes">
		<cfargument name="inImagen"     	type="string"  required="yes">
		<cfscript>
		</cfscript>
		<cfquery  datasource="myDatasource" result="resultData">
			UPDATE  T_PRODUCTOS SET 
			TPR_NOMBRE='#inNombre#',
			TPR_DESCRIPCION='#inDescripcion#', 
			TPR_PRECIO='#inPrecio#'
			<cfif inImagen NEQ ''>
			,TPR_IMAGEN='#inImagen#'
			</cfif>
			WHERE 
			TPR_PK_PRODUCTO='#inPkRegistro#'
		</cfquery>
		<cfreturn resultData.RECORDCOUNT>
	</cffunction>

	<cffunction name="actualizarEstado" access="package">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfargument name="inEstado"   		type="numeric" required="yes">
		<cfscript>
		</cfscript>
		<cfquery  datasource="myDatasource" result="resultData">
			UPDATE  T_PRODUCTOS SET 
			TPR_FK_ESTADO='#inEstado#'
			WHERE 
			TPR_PK_PRODUCTO='#inPkRegistro#'
		</cfquery>
		<cfreturn resultData.RECORDCOUNT>
	</cffunction>s
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
			<cfquery name="registro" datasource="myDataSource">
		SELECT 
			TPR_PK_PRODUCTO, TPR_NOMBRE, TPR_DESCRIPCION, 
			TPR_PRECIO, TPR_IMAGEN, TPR_FK_ESTADO, 
			TPR_FECHA_REGISTRO
			FROM TIENDAS.T_PRODUCTOS
			WHERE 
			TPR_FK_ESTADO>0 AND
			TPR_PK_PRODUCTO='#pkRegistro#'
        </cfquery>
	<cfreturn registro>
	</cffunction>
<!------------------------------------------------------------------------------------------->
<cffunction  name="obtenerRegistros">
	<cfquery name="resultadoQuery" datasource="myDataSource">
		SELECT 
			TPR_PK_PRODUCTO, TPR_NOMBRE, TPR_DESCRIPCION, 
			TO_CHAR(TPR_PRECIO,'99,999,999.99') TPR_PRECIO, TPR_IMAGEN, TPR_FK_ESTADO, 
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


<cffunction  name="obtenerProductosTienda">
	<cfargument name="categoria" type="string" required="yes">
    <cfargument name="minPrecio" type="string" required="no" default="">
    <cfargument name="maxPrecio" type="string" required="no" default="">
		<cfquery name="resultadoQuery" datasource="myDataSource">
		SELECT 
			PRO.TPR_PK_PRODUCTO, 
			PRO.TPR_NOMBRE, 
			PRO.TPR_DESCRIPCION, 
			TO_CHAR(PRO.TPR_PRECIO,'9999999.99') TPR_PRECIO, 
			PRO.TPR_IMAGEN, 
			PRO.TPR_FK_ESTADO, 
			PRO.TPR_FECHA_REGISTRO
			FROM TIENDAS.T_PRODUCTOS PRO, TIENDAS.T_CATEGORIAS_PRODUCTOS CPR
			WHERE 
			PRO.TPR_FK_ESTADO=2 AND
			CPR.TCP_FK_ESTADO=2 AND
			CPR.TCP_FK_PRODUCTO=PRO.TPR_PK_PRODUCTO AND
			CPR.TCP_FK_CATEGORIA='#categoria#' 
			<cfif minPrecio NEQ "">
				AND PRO.TPR_PRECIO>='#minPrecio#'
			</cfif>
			<cfif maxPrecio NEQ "">
				AND PRO.TPR_PRECIO<='#maxPrecio#'
			</cfif>

			ORDER BY TPR_PK_PRODUCTO DESC
    </cfquery>
	<cfreturn resultadoQuery>
</cffunction>


<cffunction name="addToCart" access="package">
		<cfargument name="pkProducto"   		type="string" required="yes">
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
</cffunction>

</cfcomponent>