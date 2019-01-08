    <!---
    * Descripcion: 
    * Fecha creacion: 02/01/2019
    * Author: Heriberto Cruz Hernández
    ---> 
<cfcomponent>

	<cffunction name="init" access="remote">
	<cfscript>

		var cnPersonal=CreateObject("component","/Models/Administradores/Productos/Model");
		Request.registros=cnPersonal.obtenerRegistros();

		
	</cfscript>
	<cfinclude template="/Administradores/header.cfm">
	<cfinclude template="/Administradores/Productos/V_Formulario.cfm">
	<cfinclude template="/Administradores/Productos/T_dataBaseBeta.cfm"> 
	<cfinclude template="/Administradores/footer.cfm">
	</cffunction>

	<cffunction  name="registrar" access="remote">
		<cfargument name="inNombre"   		type="string" required="yes">
		<cfargument name="inDescripcion"    type="string"  required="yes">
		<cfargument name="inPrecio"     	type="string"  required="yes">
		<cfargument name="inImagen"     	type="any"  required="yes">
		<cfargument name="inImagenName"     	type="any"  required="yes">
	<cfscript>
		
		//Guardando Imagen en ruta local

		var model=CreateObject("component","/Models/Administradores/Productos/Model");
		var uuid=CreateUUID();
		//Saving file in structured path
		var rutaImagen="d:/Productos/"&uuid&"-"&inImagenName;
		FileCopy(inImagen,rutaImagen);
		
		var pkRegistro=model.Registrar(inNombre,inDescripcion,inPrecio,rutaImagen);
		
		if(pkRegistro>0)pkRegistro=1;
		writeoutput(SerializeJSON(pkRegistro));
	</cfscript>
	</cffunction>


	<cffunction  name="modificar" access="remote">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfargument name="inNombre"   		type="string" required="yes">
		<cfargument name="inDescripcion"    type="string"  required="yes">
		<cfargument name="inPrecio"     	type="string"  required="yes">
		<cfargument name="inImagen"     	type="any"  required="no" default="">
		<cfargument name="inImagenName"     	type="any"  required="no" default="">
	<cfscript>
		//Guardando Imagen en ruta local
		var model=CreateObject("component","/Models/Administradores/Productos/Model");
		var uuid=CreateUUID();
		//Saving file in structured path
		var rutaImagen='';
		if(inImagenName!=''){
			rutaImagen="d:/Productos/"&uuid&"-"&inImagenName;
			FileCopy(inImagen,rutaImagen);
		}
		
		var pkRegistro=model.modificar(inPkRegistro,inNombre,inDescripcion,inPrecio,rutaImagen);
		
		if(pkRegistro>0)pkRegistro=1;
		writeoutput(SerializeJSON(pkRegistro));
	</cfscript>
	</cffunction>
	

	<cffunction  name="eliminar" access="remote">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
	<cfscript>
		//Guardando Imagen en ruta local
		var model=CreateObject("component","/Models/Administradores/Productos/Model");
		var pkRegistro=model.eliminar(inPkRegistro);
		if(pkRegistro>0)pkRegistro=1;
		writeoutput(SerializeJSON(pkRegistro));
	</cfscript>
	</cffunction>

	<cffunction  name="validar" access="remote">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
	<cfscript>
		//Guardando Imagen en ruta local
		var model=CreateObject("component","/Models/Administradores/Productos/Model");
		var pkRegistro=model.validar(inPkRegistro);
		if(pkRegistro>0)pkRegistro=1;
		writeoutput(SerializeJSON(pkRegistro));
	</cfscript>
	</cffunction>

	<cffunction  name="invalidar" access="remote">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
	<cfscript>
		//Guardando Imagen en ruta local
		var model=CreateObject("component","/Models/Administradores/Productos/Model");
		var pkRegistro=model.invalidar(inPkRegistro);
		if(pkRegistro>0)pkRegistro=1;
		writeoutput(SerializeJSON(pkRegistro));
	</cfscript>
	</cffunction>

	<cffunction  name="obtenerRegistro" access="remote">
			<cfargument name="pkRegistro"   type="any">
	<cfscript>

	var cnPersonal=CreateObject("component","/Models/Administradores/Productos/Model");
	var resultadoQuery=cnPersonal.obtenerRegistro(pkRegistro);
	</cfscript>
	<cfoutput>#SerializeJSON(resultadoQuery)#</cfoutput>
	</cffunction>
</cfcomponent>

