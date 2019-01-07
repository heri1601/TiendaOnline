<cfcomponent>
	<cffunction name="registrar" access="package">
		<cfargument name="pkTienda"   		type="string" required="yes">
		<cfargument name="pkProducto"    type="string"  required="yes">
        <cfargument name="Cantidad"    type="string"  required="yes">
        <cfargument name="Descripcion"    type="string"  required="yes">
		<cfscript>
		</cfscript>
		<cfquery  datasource="myDatasource" result="resultData">
			/* Formatted on 05/01/2019 07:12:58 a. m. (QP5 v5.269.14213.34769) */
		INSERT INTO T_INVENTARIOS (
		TIN_PK_REGINVENTARIO, TIN_FK_TIENDA, TIN_FK_PRODUCTO, 
		TIN_CANTIDAD, TIN_DESCRIPCION, FK_ESTADO) 
		VALUES ( 0,
		'#pkTienda#',
		'#pkProducto#',
		'#Cantidad#',
		'#Descripcion#',
		1 )
		</cfquery>
		<cfreturn resultData.GENERATEDKEY>
	</cffunction>

	<cffunction name="modificar" access="package">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfargument name="inTienda"   		type="string" required="yes">
		<cfargument name="inProducto"   		type="string" required="yes">
		<cfargument name="inCantidad"   		type="string" required="yes">
		<cfargument name="inDescripcion"    type="string"  required="yes">
		<cfscript>
		</cfscript>
		<cfquery  datasource="myDatasource" result="resultData">
		UPDATE T_INVENTARIOS
			SET   
				TIN_FK_TIENDA        = '#inTienda#',
				TIN_FK_PRODUCTO      = '#inProducto#',
				TIN_CANTIDAD         = '#inCantidad#',
				TIN_DESCRIPCION      = '#inDescripcion#'
			WHERE  TIN_PK_REGINVENTARIO = '#inPkRegistro#'
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
			UPDATE T_INVENTARIOS
				SET    
					FK_ESTADO            = '#inEstado#'
				WHERE  TIN_PK_REGINVENTARIO = ' #inPkRegistro#'
		</cfquery>
		<cfreturn resultData.RECORDCOUNT>
	</cffunction>

<cffunction  name="obtenerRegistros">
	<cfquery name="resultadoQuery" datasource="myDataSource">
			SELECT 
			TIN.TIN_PK_REGINVENTARIO PK, 
			TIN.TIN_FK_TIENDA PK_TIENDA, 
			TIN.TIN_FK_PRODUCTO, 
			TTI_NOMBRE_TIENDA NOMBRE_TIENDA,
			TPR.TPR_NOMBRE NOMBRE_PRODUCTO,
			TIN.TIN_CANTIDAD CANTIDAD, 
			TIN.TIN_DESCRIPCION DESCRIPCION,
			TIN.FK_ESTADO ESTADO
			FROM TIENDAS.T_INVENTARIOS TIN, 
			TIENDAS.T_PRODUCTOS TPR,
			TIENDAS.T_TIENDAS TTI
			WHERE 
			TPR.TPR_PK_PRODUCTO=TIN.TIN_FK_PRODUCTO AND 
			TTI.TTI_PK_TIENDA=TIN.TIN_FK_TIENDA AND
			TIN.FK_ESTADO>0
    </cfquery>
	<cfreturn resultadoQuery>
</cffunction>

<cffunction name="obtenerDatosRegistro" access="remote">
		<cfargument name="pkRegistro"					    type="any"	required="yes">
			<cfquery name="registro" datasource="myDataSource">
					SELECT 
			TIN_PK_REGINVENTARIO, TIN_FK_TIENDA, TIN_FK_PRODUCTO, 
			TIN_CANTIDAD, TIN_DESCRIPCION, FK_ESTADO
			FROM TIENDAS.T_INVENTARIOS
			WHERE
				TIN_PK_REGINVENTARIO='#pkRegistro#'
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