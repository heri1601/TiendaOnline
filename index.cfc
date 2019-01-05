<cfcomponent>
    <cffunction name="init" access="remote">
    <cfargument name="tienda" required="no" default="">
    <cfscript>
        var mCategorias=CreateObject("component","Administradores/Categorias/Model");
		Request.categorias=mCategorias.obtenerRegistros();

        var mProductos=CreateObject("component","Administradores/Productos/Model");
		Request.productos=mProductos.obtenerRegistros();
        //writedump(Request.categorias);
        //writedump(Request.productos);
    </cfscript>
    <cfinclude template="/indexTemplate.cfm">
    </cffunction>


    <cffunction name="initCategorias" access="remote">
    <cfargument name="act" type="string" required="no" default="">
    <cfargument name="minPrecio" type="string" required="no" default="">
    <cfargument name="maxPrecio" type="string" required="no" default="">
    <cfscript>
        var mCategorias=CreateObject("component","Administradores/Categorias/Model");
		Request.categorias=mCategorias.obtenerRegistros();

        //Selecting the category
        var Request.categoria=act;
        if(Request.categoria==""){
            Request.categoria=Request.categorias.PK[1];
        }
        //writeDump(Request);

        var mProductos=CreateObject("component","Administradores/Productos/Model");
		Request.productos=mProductos.obtenerRegistrosFiltrado(
                categoria=arguments.act,
                minPrecio=arguments.minPrecio,
                maxPrecio=arguments.maxPrecio
        );
        //writedump(Request.categorias);
        //writedump(Request.productos);
    </cfscript>
    <cfinclude template="/shop.cfm">
    </cffunction>

</cfcomponent>
