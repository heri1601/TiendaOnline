<cfcomponent>
    <cffunction name="init" access="remote">
    <cfargument name="tienda" required="no" default="">
    <cfscript>
        var mCategorias=CreateObject("component","/Models/Administradores/Categorias/DAO");
		Request.categorias=mCategorias.obtenerRegistros();

        var mProductos=CreateObject("component","/Models/Administradores/Productos/Model");
		Request.productos=mProductos.obtenerRegistros();

        var mCart=CreateObject("component","/Models/Cart/model");
        Request.cartCount=0;
        if(isDefined("Session.usuario")){
		    Request.elementosCarrito=mCart.getCart(Session.usuario,Session.pkTienda);
            Request.cartCount=Request.elementosCarrito.count;
        }

    </cfscript>
    <cfinclude template="/indexTemplate.cfm">
    </cffunction>


    <cffunction name="initCategorias" access="remote">
    <cfargument name="act" type="string" required="no" default="">
    <cfargument name="minPrecio" type="string" required="no" default="">
    <cfargument name="maxPrecio" type="string" required="no" default="">
    <cfscript>
        var mCategorias=CreateObject("component","/Models/Administradores/Categorias/DAO");
		Request.categorias=mCategorias.obtenerRegistros();

        //Selecting the category
        var Request.categoria=act;
        if(Request.categoria==""){
            Request.categoria=9;//General
        }
        

        var mProductos=CreateObject("component","/Models/Administradores/Productos/Model");
		Request.productos=mProductos.obtenerRegistrosFiltrado(
                categoria=Request.categoria,
                minPrecio=arguments.minPrecio,
                maxPrecio=arguments.maxPrecio
        );
        
        var mCart=CreateObject("component","/Models/Cart/model");
        Request.cartCount=0;
        if(isDefined("Session.usuario")){
		    Request.elementosCarrito=mCart.getCart(Session.usuario,Session.pkTienda);
            Request.cartCount=Request.elementosCarrito.count;
        }

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

    <cffunction name="logout" access="remote">
    <cfscript>
        structdelete(session, 'usuario', true);
        location('/index.cfm');
    </cfscript>
    </cffunction>

    <cffunction name="loginCheck" access="remote">
    <cfargument name="e" type="string" required="no" default="">
    <cfargument name="p" type="string" required="no" default="">
    <cfscript>
        //writedump(arguments);
        var model=CreateObject("component","/Models/Usuarios/model");            
        var registroUsuario=model.obtenerRegistroUsuario(e,p);
        if(registroUsuario.exists){
            writeoutput(SerializeJSON(registroUsuario.type));
            //Creating user in session
            Session.usuario=registroUsuario.registro.PK_USUARIO[1];
            Session.registroUsuario=registroUsuario;
        }
        else{
            writeoutput(SerializeJSON("bad"));
        }
    </cfscript>
    </cffunction>

    <cffunction name="signUp" access="remote">
    <cfargument name="inNombre" type="string" required="yes">
    <cfargument name="inApellidos" type="string" required="yes">
    <cfargument name="e" type="string" required="yes">
    <cfargument name="p" type="string" required="yes">
    <cfscript>
        var model=CreateObject("component","/Models/Usuarios/model");            
        var registroUsuario=model.registrarUsuario(inNombre,inApellidos,e,p);
        if(registroUsuario.exists=='error'){
            writeoutput(SerializeJSON("bad"));
            return;
        }
        if(registroUsuario.registro.recordcount==1){
            writeoutput(SerializeJSON("ok"));
            return;
        }
        else{
            writeoutput(SerializeJSON("bad"));
        }
    </cfscript>
    </cffunction>

    <cffunction name="goProduct" access="remote">
    <cfscript>
        if(isDefined('Session.cartProduct'))
        location(Session.cartProduct);        
        else
        location('/index.cfm');        
    </cfscript>
    </cffunction>

    <cffunction name="initSignUp" access="remote">
        <cfscript>
            include "/signUp.cfm";
        </cfscript>
    </cffunction>

</cfcomponent>
