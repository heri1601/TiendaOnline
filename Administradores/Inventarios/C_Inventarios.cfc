    <!---
    * Descripcion: 
    * Fecha creacion: 02/01/2019
    * Author: Heriberto Cruz Hernández
    ---> 
<cfcomponent>

	<cffunction name="init" access="remote">
	<cfscript>

		var model=CreateObject("component","/Models/Administradores/Inventarios/Model");
		//Obteniendo el catalogo de tiendas
		Request.cTiendas=model.obtenerCatalogo('T_TIENDAS','TTI_PK_TIENDA','TTI_NOMBRE_TIENDA','TTI_FK_ESTADO');
		Request.cProductos=model.obtenerCatalogo('T_PRODUCTOS','TPR_PK_PRODUCTO','TPR_NOMBRE','TPR_FK_ESTADO');
		Request.registros=model.obtenerRegistros();
	</cfscript>
	<cfinclude template="/Administradores/header.cfm">
	<cfinclude template="/Administradores/Inventarios/V_Formulario.cfm">
	<cfinclude template="/Administradores/Inventarios/T_dataBaseBeta.cfm"> 
	<cfinclude template="/Administradores/footer.cfm">
	</cffunction>

	<cffunction  name="registrar" access="remote">
		<cfargument name="inTienda"   		type="string" required="yes">
		<cfargument name="inProducto"   		type="string" required="yes">
		<cfargument name="inCantidad"   		type="string" required="yes">
		<cfargument name="inDescripcion"    type="string"  required="yes">
	<cfscript>
		var model=CreateObject("component","/Models/Administradores/Inventarios/Model");
		var pkRegistro=model.Registrar(inTienda,inProducto,inCantidad,inDescripcion);
		if(pkRegistro>0)pkRegistro=1;
		writeoutput(SerializeJSON(pkRegistro));
	</cfscript>
	</cffunction>


	<cffunction  name="modificar" access="remote">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfargument name="inTienda"   		type="string" required="yes">
		<cfargument name="inProducto"   		type="string" required="yes">
		<cfargument name="inCantidad"   		type="string" required="yes">
		<cfargument name="inDescripcion"    type="string"  required="yes">
	<cfscript>
		var model=CreateObject("component","/Models/Administradores/Inventarios/Model");
		var pkRegistro=model.modificar(inPkRegistro,inTienda,inProducto,inCantidad,inDescripcion);
		if(pkRegistro>0)pkRegistro=1;
		writeoutput(SerializeJSON(pkRegistro));
	</cfscript>
	</cffunction>
	

	<cffunction  name="eliminar" access="remote">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
	<cfscript>
		//Guardando Imagen en ruta local
		var model=CreateObject("component","/Models/Administradores/Inventarios/Model");
		var pkRegistro=model.eliminar(inPkRegistro);
		if(pkRegistro>0)pkRegistro=1;
		writeoutput(SerializeJSON(pkRegistro));
	</cfscript>
	</cffunction>

	<cffunction  name="validar" access="remote">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
	<cfscript>
		//Guardando Imagen en ruta local
		var model=CreateObject("component","/Models/Administradores/Inventarios/Model");
		var pkRegistro=model.validar(inPkRegistro);
		if(pkRegistro>0)pkRegistro=1;
		writeoutput(SerializeJSON(pkRegistro));
	</cfscript>
	</cffunction>

	<cffunction  name="invalidar" access="remote">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
	<cfscript>
		//Guardando Imagen en ruta local
		var model=CreateObject("component","/Models/Administradores/Inventarios/Model");
		var pkRegistro=model.invalidar(inPkRegistro);
		if(pkRegistro>0)pkRegistro=1;
		writeoutput(SerializeJSON(pkRegistro));
	</cfscript>
	</cffunction>

	<cffunction  name="obtenerRegistro" access="remote">
			<cfargument name="pkRegistro"   type="any">
	<cfscript>

	var model=CreateObject("component","/Models/Administradores/Inventarios/Model");
	var resultadoQuery=model.obtenerRegistro(pkRegistro);
	</cfscript>
	<cfoutput>#SerializeJSON(resultadoQuery)#</cfoutput>
	</cffunction>
</cfcomponent>

