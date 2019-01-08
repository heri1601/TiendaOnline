    <!---
    * Descripcion: 
    * Fecha creacion: 02/01/2019
    * Author: Heriberto Cruz Hernández
    ---> 
<cfcomponent>

	<cffunction name="init" access="remote">
	<cfscript>

		var model=CreateObject("component","/Models/Administradores/Duenos/Model");
		Request.registros=model.obtenerRegistros();
	</cfscript>
	<cfinclude template="/Administradores/header.cfm">
	<cfinclude template="/Administradores/Duenos/V_Formulario.cfm">
	<cfinclude template="/Administradores/Duenos/T_dataBaseBeta.cfm"> 
	<cfinclude template="/Administradores/footer.cfm">
	</cffunction>

	<cffunction  name="registrar" access="remote">
		<cfargument name="inNombre"   		type="string" required="yes">
		<cfargument name="inApellidos"   		type="string" required="yes">
		<cfargument name="inEmail"   		type="string" required="yes">
		<cfargument name="inPassword"   		type="string" required="yes">
	<cfscript>
		var model=CreateObject("component","/Models/Administradores/Duenos/Model");
		var pkRegistro=model.Registrar(inNombre,inApellidos,inEmail,inPassword);
		if(pkRegistro>0)pkRegistro=1;
		writeoutput(SerializeJSON(pkRegistro));
	</cfscript>
	</cffunction>


	<cffunction  name="modificar" access="remote">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfargument name="inNombre"   		type="string" required="yes">
		<cfargument name="inApellidos"   		type="string" required="yes">
		<cfargument name="inEmail"   		type="string" required="yes">
		<cfargument name="inPassword"    type="string"  required="yes">
	<cfscript>
		var model=CreateObject("component","/Models/Administradores/Duenos/Model");
		var pkRegistro=model.modificar(inPkRegistro,inNombre,inApellidos,inEmail,inPassword);
		if(pkRegistro>0)pkRegistro=1;
		writeoutput(SerializeJSON(pkRegistro));
	</cfscript>
	</cffunction>
	

	<cffunction  name="eliminar" access="remote">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
	<cfscript>
		//Guardando Imagen en ruta local
		var model=CreateObject("component","/Models/Administradores/Duenos/Model");
		var pkRegistro=model.eliminar(inPkRegistro);
		if(pkRegistro>0)pkRegistro=1;
		writeoutput(SerializeJSON(pkRegistro));
	</cfscript>
	</cffunction>

	<cffunction  name="validar" access="remote">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
	<cfscript>
		//Guardando Imagen en ruta local
		var model=CreateObject("component","/Models/Administradores/Duenos/Model");
		var pkRegistro=model.validar(inPkRegistro);
		if(pkRegistro>0)pkRegistro=1;
		writeoutput(SerializeJSON(pkRegistro));
	</cfscript>
	</cffunction>

	<cffunction  name="invalidar" access="remote">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
	<cfscript>
		//Guardando Imagen en ruta local
		var model=CreateObject("component","/Models/Administradores/Duenos/Model");
		var pkRegistro=model.invalidar(inPkRegistro);
		if(pkRegistro>0)pkRegistro=1;
		writeoutput(SerializeJSON(pkRegistro));
	</cfscript>
	</cffunction>

	<cffunction  name="obtenerRegistro" access="remote">
		<cfargument name="pkRegistro"   type="any">
		<cfscript>
		var model=CreateObject("component","/Models/Administradores/Duenos/Model");
		var resultadoQuery=model.obtenerRegistro(pkRegistro);
		</cfscript>
		<cfoutput>#SerializeJSON(resultadoQuery)#</cfoutput>
	</cffunction>
</cfcomponent>

