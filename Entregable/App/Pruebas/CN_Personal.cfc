<cfcomponent>	
	<cffunction name="preRegistrar" access="remote">
		<cfargument name="Nombre"   type="any">
        <cfargument name="Edad"     type="any">
        <!---<cfargument name="Estado"   type="any">--->
        <cfargument name="Num_Tel"  type="any">
        <cfargument name="Entidad"  type="any">
        <!---<cfargument name="Pais"     type="any">--->
	    <cfscript>
            return Registrar(Nombre,Edad,Num_Tel,1,Entidad,0);
        </cfscript>
	</cffunction>

	<cffunction name="Registrar" access="remote">
		<cfargument name="Nombre"   type="any">
        <cfargument name="Edad"     type="any">
        <cfargument name="Num_Tel"  type="any">
        <cfargument name="Estado"   type="any">
        <cfargument name="Entidad"  type="any">
        <cfargument name="Pais"     type="any">
		<cfscript>
            var daoPersonal =   CreateObject("component","Repositorio.Personal.DAO_Personal");
            daoPersonal.insertUserNacional(Nombre,Edad,Num_Tel,Estado,Entidad,Pais);
		</cfscript>
	</cffunction>
<!------------------------------------------------------------------------------------------->
	<cffunction name="preRegistrarExtranjero" access="remote">
		<cfargument name="Nombre"   type="any">
        <cfargument name="Edad"     type="any">
        <cfargument name="Num_Tel"  type="any">
        <cfargument name="Pais"     type="any">
	    <cfscript>
            return Registrar(Nombre,Edad,Num_Tel,1,0,Pais);
        </cfscript>
	</cffunction>
<!------------------------------------------------------------------------------------------->	
   <cffunction name="ActualizarRegistroExtranjero" access="remote">
		<cfargument name="Pk_registro" type="any">
        <cfargument name="Nombre"      type="any">
        <cfargument name="Edad"        type="any">
        <cfargument name="Num_Tel"     type="any">
        <cfargument name="Pais"     type="any">
		<cfscript>
            var daoPersonal =   CreateObject("component","Repositorio.Personal.DAO_Personal");
            daoPersonal.actualizarDatosRegistro(Pk_registro,Nombre,Edad,Num_Tel,0,Pais);
		</cfscript>
	</cffunction>

    <cffunction name="ActualizarRegistroNacional" access="remote">
		<cfargument name="Pk_registro" type="any">
        <cfargument name="Nombre"      type="any">
        <cfargument name="Edad"        type="any">
        <cfargument name="Num_Tel"     type="any">
        <cfargument name="Entidad"     type="any">
		<cfscript>
            var daoPersonal =   CreateObject("component","Repositorio.Personal.DAO_Personal");
            daoPersonal.actualizarDatosRegistro(Pk_registro,Nombre,Edad,Num_Tel,Entidad,0);
		</cfscript>
	</cffunction>
<!------------------------------------------------------------------------------------------->
    <cffunction  name="obtenerRegistros">
        <cfscript>
            var daoPersonal=CreateObject("component","Repositorio.Personal.DAO_Personal");
            return daoPersonal.obtenerRegistros();//Perfecto
        </cfscript>
    </cffunction>
<!------------------------------------------------------------------------------------------->
    <cffunction  name="obtenerEntidades">
	    <cfscript>
            var daoPersonalEntidad=CreateObject("component","Repositorio.Personal.DAO_Personal");
            return daoPersonalEntidad.obtenerEntidades();
        </cfscript>
    </cffunction>
<!------------------------------------------------------------------------------------------->
    <cffunction  name="obtenerPaises">
        <cfscript>
            var daoPersonalPais=CreateObject("component","Repositorio.Personal.DAO_Personal");
            return daoPersonalPais.obtenerPaises();
        </cfscript>
    </cffunction>
<!------------------------------------------------------------------------------------------->
    <cffunction  name="obtenerRegistro">
        <cfargument name="pkRegistro"   type="any">
	    <cfscript>
            var daoPersonal=CreateObject("component","Repositorio.Personal.DAO_Personal");
            return daoPersonal.obtenerDatosRegistro1(pkRegistro);//Perfecto //llevamoe a ese metodo
        </cfscript>
    </cffunction>
<!------------------------------------------------------------------------------------------->
    <cffunction  name="validar">
        <cfargument name="pkRegistro"   type="any">
	    <cfscript>
            return actualizarEstado(pkRegistro,2);
        </cfscript>
    </cffunction>

    <cffunction  name="actualizarEstado">
        <cfargument name="pkRegistro"   type="any">
        <cfargument name="Estado"       type="any">
	    <cfscript>
            var daoPersonal =   CreateObject("component","Repositorio.Personal.DAO_Personal");
            return daoPersonal.obtenerDatosRegistro(pkRegistro,Estado);
        </cfscript>
    </cffunction>
<!------------------------------------------------------------------------------------------->
    <cffunction  name="obtenerDelte">
        <cfargument name="pkRegistro"   type="any">
        <cfargument name="Estado"       type="any">
	    <cfscript> 
            var daoPersonal=CreateObject("component","Repositorio.Personal.DAO_Personal");
            return daoPersonal.obtenerDatosRegistro(pkRegistro,Estado);
        </cfscript>
    </cffunction>
<!------------------------------------------------------------------------------------------->

</cfcomponent>