<cfcomponent>	
	<cffunction name="Registrar" access="remote">
		<cfargument name="pkTienda"   		type="string" required="yes">
		<cfargument name="pkProducto"    type="string"  required="yes">
        <cfargument name="Cantidad"    type="string"  required="yes">
        <cfargument name="Descripcion"    type="string"  required="yes">
		<cfscript>
            var dao =   CreateObject("component","/Models/Administradores/Inventarios/DAO");
            var pkRegistro=dao.registrar(inTienda,inProducto,inCantidad,inDescripcion);
            return pkRegistro;
		</cfscript>
	</cffunction>

    <cffunction  name="obtenerRegistro">
        <cfargument name="pkRegistro"   type="any">
	    <cfscript>
            var daoPersonal=CreateObject("component","/Models/Administradores/Inventarios/DAO");
            return daoPersonal.obtenerDatosRegistro(pkRegistro);
        </cfscript>
    </cffunction>

    <cffunction name="modificar" access="remote">
        <cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfargument name="inTienda"   		type="string" required="yes">
		<cfargument name="inProducto"   		type="string" required="yes">
		<cfargument name="inCantidad"   		type="string" required="yes">
		<cfargument name="inDescripcion"    type="string"  required="yes">
		<cfscript>
            var dao =   CreateObject("component","/Models/Administradores/Inventarios/DAO");
            var pkRegistro=dao.modificar(inPkRegistro,inTienda,inProducto,inCantidad,inDescripcion);
            return pkRegistro;
		</cfscript>
	</cffunction>

    <cffunction name="eliminar" access="remote">
        <cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfscript>
            var dao =   CreateObject("component","/Models/Administradores/Inventarios/DAO");
            var pkRegistro=dao.actualizarEstado(inPkRegistro,0);
            return pkRegistro;
		</cfscript>
	</cffunction>

    <cffunction name="validar" access="remote">
        <cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfscript>
            var dao =   CreateObject("component","/Models/Administradores/Inventarios/DAO");
            var pkRegistro=dao.actualizarEstado(inPkRegistro,2);
            return pkRegistro;
		</cfscript>
	</cffunction>

    <cffunction name="invalidar" access="remote">
        <cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfscript>
            var dao =   CreateObject("component","/Models/Administradores/Inventarios/DAO");
            var pkRegistro=dao.actualizarEstado(inPkRegistro,3);
            return pkRegistro;
		</cfscript>
	</cffunction>
    <cffunction  name="obtenerRegistros">
        <cfscript>
            var daoPersonal=CreateObject("component","/Models/Administradores/Inventarios/DAO");
            return daoPersonal.obtenerRegistros();
        </cfscript>
    </cffunction>

    <cffunction  name="obtenerCatalogo" >
	<cfargument name="tableName">
	<cfargument name="KeyField">
	<cfargument name="TextField">
	<cfargument name="StateField">
	<cfscript>
        var daoPersonal=CreateObject("component","/Models/Administradores/Inventarios/DAO");
        return daoPersonal.obtenerCatalogo(tableName,KeyField,TextField,StateField);
    </cfscript>
</cffunction>
</cfcomponent>