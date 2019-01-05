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
		<cfargument name="inNombre"   		type="string" required="yes">
		<cfargument name="inDescripcion"    type="string"  required="yes">
		<cfargument name="inPrecio"     	type="string"  required="yes">
		<cfargument name="inImagen"     	type="string"  required="yes">
		<cfscript>
            var dao =   CreateObject("component","Administradores/Productos/DAO");
            var pkRegistro=dao.registrar(inNombre,inDescripcion,inPrecio,inImagen);
            return pkRegistro;
		</cfscript>
	</cffunction>

    <cffunction name="modificar" access="remote">
        <cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfargument name="inNombre"   		type="string" required="yes">
		<cfargument name="inDescripcion"    type="string"  required="yes">
		<cfargument name="inPrecio"     	type="string"  required="yes">
		<cfargument name="inImagen"     	type="string"  required="yes">
		<cfscript>
            var dao =   CreateObject("component","Administradores/Productos/DAO");
            var pkRegistro=dao.modificar(inPkRegistro,inNombre,inDescripcion,inPrecio,inImagen);
            return pkRegistro;
		</cfscript>
	</cffunction>

    <cffunction name="eliminar" access="remote">
        <cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfscript>
            var dao =   CreateObject("component","Administradores/Productos/DAO");
            var pkRegistro=dao.actualizarEstado(inPkRegistro,0);
            return pkRegistro;
		</cfscript>
	</cffunction>

    <cffunction name="validar" access="remote">
        <cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfscript>
            var dao =   CreateObject("component","Administradores/Productos/DAO");
            var pkRegistro=dao.actualizarEstado(inPkRegistro,2);
            return pkRegistro;
		</cfscript>
	</cffunction>

    <cffunction name="invalidar" access="remote">
        <cfargument name="inPkRegistro"   		type="string" required="yes">
		<cfscript>
            var dao =   CreateObject("component","Administradores/Productos/DAO");
            var pkRegistro=dao.actualizarEstado(inPkRegistro,3);
            return pkRegistro;
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
            var daoPersonal =   CreateObject("component","Administradores/Productos/DAO");
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
            var daoPersonal =   CreateObject("component","Administradores/Productos/DAO");
            daoPersonal.actualizarDatosRegistro(Pk_registro,Nombre,Edad,Num_Tel,Entidad,0);
		</cfscript>
	</cffunction>

    <cffunction  name="obtenerRegistros">
        <cfscript>
            var daoPersonal=CreateObject("component","Administradores/Productos/DAO");
            return daoPersonal.obtenerRegistros();
        </cfscript>
    </cffunction>


    <cffunction  name="obtenerRegistrosFiltrado">
    <cfargument name="categoria" type="string" required="yes">
    <cfargument name="minPrecio" type="string" required="no" default="">
    <cfargument name="maxPrecio" type="string" required="no" default="">
        <cfscript>
            var daoPersonal=CreateObject("component","Administradores/Productos/DAO");
            return daoPersonal.obtenerProductosTienda(
                categoria=arguments.categoria,
                minPrecio=arguments.minPrecio,
                maxPrecio=arguments.maxPrecio
                );
        </cfscript>
    </cffunction>


    <cffunction  name="obtenerRegistro">
        <cfargument name="pkRegistro"   type="any">
	    <cfscript>
            var daoPersonal=CreateObject("component","Administradores/Productos/DAO");
            return daoPersonal.obtenerDatosRegistro1(pkRegistro);
        </cfscript>
    </cffunction>
<!------------------------------------------------------------------------------------------->
    

    <cffunction  name="actualizarEstado">
        <cfargument name="pkRegistro"   type="any">
        <cfargument name="Estado"       type="any">
	    <cfscript>
            var daoPersonal =   CreateObject("component","Administradores/Productos/DAO");
            return daoPersonal.obtenerDatosRegistro(pkRegistro,Estado);
        </cfscript>
    </cffunction>
<!------------------------------------------------------------------------------------------->
    <cffunction  name="obtenerDelte">
        <cfargument name="pkRegistro"   type="any">
        <cfargument name="Estado"       type="any">
	    <cfscript> 
            var daoPersonal=CreateObject("component","Administradores/Productos/DAO");
            return daoPersonal.obtenerDatosRegistro(pkRegistro,Estado);
        </cfscript>
    </cffunction>
<!------------------------------------------------------------------------------------------->

</cfcomponent>