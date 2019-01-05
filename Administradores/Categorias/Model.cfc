<cfcomponent>	
	<cffunction name="Registrar" access="remote">
		<cfargument name="inNombre"   		type="string" required="yes">
		<cfargument name="inDescripcion"    type="string"  required="yes">
		<cfscript>
            var dao =   CreateObject("component","Administradores/Categorias/DAO");
            var pkRegistro=dao.registrar(inNombre,inDescripcion);
            return pkRegistro;
		</cfscript>
	</cffunction>

    <cffunction  name="obtenerRegistro">
        <cfargument name="pkRegistro"   type="any">
	    <cfscript>
            var daoPersonal=CreateObject("component","Administradores/Categorias/DAO");
            return daoPersonal.obtenerDatosRegistro(pkRegistro);
        </cfscript>
    </cffunction>

    <cffunction name="modificar" access="remote">
        <cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfargument name="inNombre"   		type="string" required="yes">
		<cfargument name="inDescripcion"    type="string"  required="yes">
		<cfscript>
            var dao =   CreateObject("component","Administradores/Categorias/DAO");
            var pkRegistro=dao.modificar(inPkRegistro,inNombre,inDescripcion);
            return pkRegistro;
		</cfscript>
	</cffunction>

    <cffunction name="eliminar" access="remote">
        <cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfscript>
            var dao =   CreateObject("component","Administradores/Categorias/DAO");
            var pkRegistro=dao.actualizarEstado(inPkRegistro,0);
            return pkRegistro;
		</cfscript>
	</cffunction>

    <cffunction name="validar" access="remote">
        <cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfscript>
            var dao =   CreateObject("component","Administradores/Categorias/DAO");
            var pkRegistro=dao.actualizarEstado(inPkRegistro,2);
            return pkRegistro;
		</cfscript>
	</cffunction>

    <cffunction name="invalidar" access="remote">
        <cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfscript>
            var dao =   CreateObject("component","Administradores/Categorias/DAO");
            var pkRegistro=dao.actualizarEstado(inPkRegistro,3);
            return pkRegistro;
		</cfscript>
	</cffunction>
    <cffunction  name="obtenerRegistros">
        <cfscript>
            var daoPersonal=CreateObject("component","Administradores/Categorias/DAO");
            return daoPersonal.obtenerRegistros();
        </cfscript>
    </cffunction>
</cfcomponent>