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
            Request.categoria=9;//General
        }
        //writeDump(Request);

        var mProductos=CreateObject("component","Administradores/Productos/Model");
		Request.productos=mProductos.obtenerRegistrosFiltrado(
                categoria=Request.categoria,
                minPrecio=arguments.minPrecio,
                maxPrecio=arguments.maxPrecio
        );
        //writedump(Request.categorias);
        //writedump(Request.productos);
    </cfscript>
    <cfinclude template="/shop.cfm">
    </cffunction>

    <cffunction name="addToCart" access="remote">
    <cfargument name="p" type="string" required="yes">
    <cfscript>
        Session.pkTienda=1;
        Session.cartProduct=cgi.HTTP_REFERER;
        if(isDefined("Session.usuario") EQ False){
            writeoutput(SerializeJSON("redirect"));
        }
        else{
            //verifyCartExistance
            var mCarrito=CreateObject("component","/Models/Cart/model");            
            var id=mCarrito.addToCart(Session.usuario,p,Session.pkTienda);
            writeoutput(SerializeJSON("true"));
            return;
        }
    </cfscript>
    </cffunction>

    <cffunction name="login" access="remote">
    <cfscript>
        include "login.cfm";
    </cfscript>
    </cffunction>

    <cffunction name="loginCheck" access="remote">
    <cfargument name="e" type="string" required="no" default="">
    <cfargument name="p" type="string" required="no" default="">
    <cfscript>
        //writedump(arguments);
        if(e=="heri1601@gmail.com"&&p=="123"){
            writeoutput(SerializeJSON("accept"));
            //Creating user in session
            Session.usuario=1;
        }
        else{
            writeoutput(SerializeJSON("bad"));
        }
    </cfscript>
    </cffunction>

    <cffunction name="goProduct" access="remote">
    <cfscript>
        location(Session.cartProduct);        
    </cfscript>
    </cffunction>

</cfcomponent>
