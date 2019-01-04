    <!---
    * Descripcion: 
    * Fecha creacion: 14/12/2018
    * Author: Edgar Cruz Hernández
    ---> 
<cfcomponent>
<!------------------------------------------------------------------------------------------->
	<!---<cffunction name="initLogin" access="remote">
	<cfinclude template="/header.cfm">
	<cfinclude template="/Personal/V_login.cfm">
	<cfinclude template="/footer.cfm">
	</cffunction>---->
<!------------------------------------------------------------------------------------------->	
	<cffunction name="initRegistro" access="remote">
	<cfscript>

		var cnPersonal=CreateObject("component","Repositorio.Personal.CN_Personal");
		Request.resultadoQuery=cnPersonal.obtenerRegistros();

		var cnPersonal=CreateObject("component","Repositorio.Personal.CN_Personal");
		Request.resultadoQueryEntidad=cnPersonal.obtenerEntidades();

		var cnPersonal=CreateObject("component","Repositorio.Personal.CN_Personal");
		Request.resultadoQueryPais=cnPersonal.obtenerPaises();

	</cfscript>
	<cfinclude template="/header.cfm">
	<cfinclude template="/Personal/V_Formulario.cfm">
	<cfinclude template="/Personal/T_dataBaseBeta.cfm"> 
	<cfinclude template="/footer.cfm">
	</cffunction>
<!------------------------------------------------------------------------------------------->
	<!---<cffunction name="PDF" access="remote">
	<cfscript>
	var cnPersonal=CreateObject("component","Repositorio.Personal.CN_Personal");
		Request.resultadoQuery=cnPersonal.obtenerRegistros();//PErfecto
	</cfscript>
	<cfinclude template="T_PDF.cfm">
	</cffunction>

	<cffunction name="demoHeaderFooter3" access="remote">
	<cfscript>
	</cfscript>
	<cfinclude template="header.cfm">
	<cfinclude template="dataBase.cfm">
	<cfinclude template="footer.cfm">
	</cffunction>--->
<!------------------------------------------------------------------------------------------->
	<cffunction  name="registrar" access="remote">
			<cfargument name="Nombre"   type="any">
            <cfargument name="Edad"     type="any">
            <!---<cfargument name="Estado"   type="any">--->
            <cfargument name="Num_Tel"  type="any">
            <cfargument name="Entidad"  type="any">
            <!---<cfargument name="Pais"     type="any">--->
	<cfscript>
	//writedump(arguments);
	//FileCopy(archivo,"d:/cosa.txt");
	var cnPersonal=CreateObject("component","Repositorio.Personal.CN_Personal");
	var pkEmpleado=cnPersonal.preRegistrar(Nombre,Edad,Num_Tel,Entidad);
	//Para regresar Json
	//writeoutput(SerializeJSON(pkEmpleado));//Puede sert así o fuera del cfscript como <cfoutput>#pkEmpleado#</cfoutput>
	</cfscript>
	<cfoutput>#SerializeJSON(pkEmpleado)#</cfoutput><!---Va a dar lo mismo por que el json de un numero es el mismo nmero--->
	
	</cffunction>
<!------------------------------------------------------------------------------------------->
	<cffunction  name="registrarExtranjero" access="remote">
			<cfargument name="Nombre"   type="any">
            <cfargument name="Edad"     type="any">
            <cfargument name="Num_Tel"  type="any">
            <cfargument name="Pais"  type="any">
	<cfscript>
	//writedump(arguments);
	//FileCopy(archivo,"d:/cosa.txt");
	var cnPersonal=CreateObject("component","Repositorio.Personal.CN_Personal");
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
	var cnPersonal=CreateObject("component","Repositorio.Personal.CN_Personal");
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
	var cnPersonal = CreateObject("component","Repositorio.Personal.CN_Personal");
	var pkRegistro = cnPersonal.ActualizarRegistroNacional(Pk_registro,Nombre,Edad,Num_Tel,Entidad);
	</cfscript>
	<cfoutput>#SerializeJSON(pkRegistro)#</cfoutput>
	</cffunction>
<!------------------------------------------------------------------------------------------->
	<cffunction  name="obtenerRegistro" access="remote">
			<cfargument name="pkRegistro"   type="any">
	<cfscript>

	var cnPersonal=CreateObject("component","Repositorio.Personal.CN_Personal");
	var resultadoQuery=cnPersonal.obtenerRegistro(pkRegistro);
	</cfscript>
	<cfoutput>#SerializeJSON(resultadoQuery)#</cfoutput>
	</cffunction>
<!------------------------------------------------------------------------------------------->
	<cffunction  name="obtenerRegistroModal" access="remote">
			<cfargument name="pkRegistro"   type="any">
	<cfscript>

	var cnPersonal=CreateObject("component","Repositorio.Personal.CN_Personal");
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
	var cnPersonal=CreateObject("component","Repositorio.Personal.CN_Personal");
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
	var cnPersonal=CreateObject("component","Repositorio.Personal.CN_Personal");
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

