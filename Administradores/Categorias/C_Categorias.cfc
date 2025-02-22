    <!---
    * Descripcion: 
    * Fecha creacion: 14/12/2018
    * Author: Heriberto Cruz Hernández
    ---> 
<cfcomponent>

	<cffunction name="init" access="remote">
	<cfscript>

		var cnPersonal=CreateObject("component","/Models/Administradores/Categorias/Model");
		Request.registros=cnPersonal.obtenerRegistros();
	</cfscript>
	<cfinclude template="/Administradores/header.cfm">
	<cfinclude template="/Administradores/Categorias/V_Formulario.cfm">
	<cfinclude template="/Administradores/Categorias/T_dataBaseBeta.cfm"> 
	<cfinclude template="/Administradores/footer.cfm">
	</cffunction>

	<cffunction  name="registrar" access="remote">
		<cfargument name="inNombre"   		type="string" required="yes">
		<cfargument name="inDescripcion"    type="string"  required="yes">
	<cfscript>
		var model=CreateObject("component","/Models/Administradores/Categorias/Model");
		var pkRegistro=model.Registrar(inNombre,inDescripcion);
		if(pkRegistro>0)pkRegistro=1;
		writeoutput(SerializeJSON(pkRegistro));
	</cfscript>
	</cffunction>


	<cffunction  name="modificar" access="remote">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfargument name="inNombre"   		type="string" required="yes">
		<cfargument name="inDescripcion"    type="string"  required="yes">
	<cfscript>
		var model=CreateObject("component","/Models/Administradores/Categorias/Model");
		var pkRegistro=model.modificar(inPkRegistro,inNombre,inDescripcion);
		if(pkRegistro>0)pkRegistro=1;
		writeoutput(SerializeJSON(pkRegistro));
	</cfscript>
	</cffunction>
	

	<cffunction  name="eliminar" access="remote">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
	<cfscript>
		//Guardando Imagen en ruta local
		var model=CreateObject("component","/Models/Administradores/Categorias/Model");
		var pkRegistro=model.eliminar(inPkRegistro);
		if(pkRegistro>0)pkRegistro=1;
		writeoutput(SerializeJSON(pkRegistro));
	</cfscript>
	</cffunction>

	<cffunction  name="validar" access="remote">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
	<cfscript>
		//Guardando Imagen en ruta local
		var model=CreateObject("component","/Models/Administradores/Categorias/Model");
		var pkRegistro=model.validar(inPkRegistro);
		if(pkRegistro>0)pkRegistro=1;
		writeoutput(SerializeJSON(pkRegistro));
	</cfscript>
	</cffunction>

	<cffunction  name="invalidar" access="remote">
		<cfargument name="inPkRegistro"   		type="string" required="yes">
	<cfscript>
		//Guardando Imagen en ruta local
		var model=CreateObject("component","/Models/Administradores/Categorias/Model");
		var pkRegistro=model.invalidar(inPkRegistro);
		if(pkRegistro>0)pkRegistro=1;
		writeoutput(SerializeJSON(pkRegistro));
	</cfscript>
	</cffunction>


	<cffunction  name="registrarExtranjero" access="remote">
			<cfargument name="Nombre"   type="any">
            <cfargument name="Edad"     type="any">
            <cfargument name="Num_Tel"  type="any">
            <cfargument name="Pais"  type="any">
	<cfscript>
	//writedump(arguments);
	//FileCopy(archivo,"d:/cosa.txt");
	var cnPersonal=CreateObject("component","/Models/Administradores/Categorias/Model");
	var pkEmpleado=cnPersonal.preRegistrarExtranjero(Nombre,Edad,Num_Tel,Pais);
	</cfscript>
	<cfoutput>#SerializeJSON(pkEmpleado)#</cfoutput>
	</cffunction>
<!------------------------------------------------------------------------------------------->
	<cffunction  name="ActualizarRegistroExtranjero" access="remote">
			<cfargument name="Pk_registro" 	type="any">
            <cfargument name="Nombre"      	type="any">
            <cfargument name="Edad"        	type="any">
            <cfargument name="Num_Tel"     	type="any">
            <cfargument name="Pais"		   	type="any">
	<cfscript>
	//FileCopy(archivo,"d:/cosa.txt");
	var cnPersonal=CreateObject("component","/Models/Administradores/Categorias/Model");
	var pkRegistro=cnPersonal.ActualizarRegistroExtranjero(Pk_registro,Nombre,Edad,Num_Tel,Pais);
	</cfscript>
	<cfoutput>#SerializeJSON(pkRegistro)#</cfoutput>
	</cffunction>
<!------------------------------------------------------------------------------------------->
	<cffunction  name="ActualizarRegistroNacional" access="remote">
			<cfargument name="Pk_registro" type="any">
            <cfargument name="Nombre"      type="any">
            <cfargument name="Edad"        type="any">
            <cfargument name="Num_Tel"     type="any">
            <cfargument name="Entidad"     type="any">
	<cfscript>
	//FileCopy(archivo,"d:/cosa.txt");
	var cnPersonal = CreateObject("component","/Models/Administradores/Categorias/Model");
	var pkRegistro = cnPersonal.ActualizarRegistroNacional(Pk_registro,Nombre,Edad,Num_Tel,Entidad);
	</cfscript>
	<cfoutput>#SerializeJSON(pkRegistro)#</cfoutput>
	</cffunction>
<!------------------------------------------------------------------------------------------->
	<cffunction  name="obtenerRegistro" access="remote">
			<cfargument name="pkRegistro"   type="any">
	<cfscript>

	var cnPersonal=CreateObject("component","/Models/Administradores/Categorias/Model");
	var resultadoQuery=cnPersonal.obtenerRegistro(pkRegistro);
	</cfscript>
	<cfoutput>#SerializeJSON(resultadoQuery)#</cfoutput>
	</cffunction>
<!------------------------------------------------------------------------------------------->
	<cffunction  name="obtenerRegistroModal" access="remote">
			<cfargument name="pkRegistro"   type="any">
	<cfscript>

	var cnPersonal=CreateObject("component","/Models/Administradores/Categorias/Model");
	var informacionRegistro=cnPersonal.obtenerRegistro(pkRegistro);
	
	request=StructNew();
	request.Nombre=informacionRegistro.Nombre[1];
	request.edad=informacionRegistro.Edad[1];
	request.Num=informacionRegistro.Num_Tel[1];
	</cfscript>
	
	<cfinclude template="Modal_infoRegistro.cfm">
	</cffunction>
<!------------------------------------------------------------------------------------------->
	<cffunction  name="obtenerUpgrade" access="remote">
			<cfargument name="pkRegistro"   type="any">
	<cfscript>
	//FileCopy(archivo,"d:/cosa.txt");
	var cnPersonal=CreateObject("component","/Models/Administradores/Categorias/Model");
	var pkReg = cnPersonal.validar(pkRegistro);
	</cfscript>
	<cfoutput>#SerializeJSON(pkReg)#</cfoutput>
	</cffunction>
<!------------------------------------------------------------------------------------------->	
	<cffunction  name="obtenerUpgradeDelte" access="remote">
	        <cfargument name="pkRegistro"   type="any">
            <cfargument name="Estado"       type="any">
	<cfscript>
	//FileCopy(archivo,"d:/cosa.txt");
	var cnPersonal=CreateObject("component","/Models/Administradores/Categorias/Model");
	var pkReg = cnPersonal.obtenerDelte(pkRegistro,Estado);
	</cfscript>
	<cfoutput>#SerializeJSON(pkReg)#</cfoutput>
	</cffunction>
<!------------------------------------------------------------------------------------------->

	

	<cffunction  name="variableSessionEjemplo" access="remote">
	<cfscript>
	
		session.valor=151;
		


	</cfscript>
	

<cfset mailAttributes = {
server="smtp.gmail.com",
username="edd9405@gmail.com",
password="edd9405gmail",
from="edd9405@gmail.com",
to="heri1601@gmail.com",
subject="Eat my shorts, man!"
}
/>


<cfmail port="587" useTLS="true"
attributeCollection="#mailAttributes#">
hello
</cfmail>ss


	</cffunction>
</cfcomponent>

