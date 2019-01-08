<cfcomponent>
<cffunction name="init" access="remote">
    <cfscript>
    if(!isDefined("Session.usuario")){
        location('/index.cfc?method=login');
    }
    //Obtener los elementos actuales del carrito y los totales
    var model=CreateObject("component","/Models/Cart/model");
    var carrito=model.getCart(Session.usuario,Session.pkTienda);
    Request.elementosCarrito=carrito.elementos;
    Request.subtotal=carrito.subtotal;
    Request.delivery=carrito.delivery;
    Request.total=carrito.total;
    var mCart=CreateObject("component","/Models/Cart/model");
    Request.cartCount=0;
    if(isDefined("Session.usuario")){
        elementosCarrito=mCart.getCart(Session.usuario,Session.pkTienda);
        Request.cartCount=elementosCarrito.count;
    }
    include "/cart.cfm";        
    </cfscript>
</cffunction>

<cffunction name="initCheckout" access="remote">
    <cfscript>
    if(!isDefined("Session.usuario")){
        location('/index.cfc?method=login');
    }
    //Obtener los elementos actuales del carrito y los totales
    var model=CreateObject("component","/Models/Cart/model");
    var carrito=model.getCart(Session.usuario,Session.pkTienda);
    Request.elementosCarrito=carrito.elementos;
    Request.subtotal=carrito.subtotal;
    Request.delivery=carrito.delivery;
    Request.total=carrito.total;
    var mCart=CreateObject("component","/Models/Cart/model");
    Request.cartCount=0;
    if(isDefined("Session.usuario")){
        elementosCarrito=mCart.getCart(Session.usuario,Session.pkTienda);
        Request.cartCount=elementosCarrito.count;
    }
    include "/checkout.cfm";        
    </cfscript>
</cffunction>

<cffunction name="affectProduct" access="remote">
<cfargument  name="p" type="string" required="yes">
<cfargument  name="sign" type="string" required="yes">
    <cfscript>
        var response='';
        var model=CreateObject("component","/Models/Cart/model");
        if(sign=='increment'){
            response=model.updateCuantityCartProduct(p,1);
        }
        if(sign=='decrement'){
            response=model.updateCuantityCartProduct(p,-1);
        }
        if(response==1){
            response="true";
        }
        return response;
    </cfscript>
</cffunction>


<cffunction name="viewProduct" access="remote">
<cfargument  name="p" type="string" required="yes">
    <cfscript>
        var model=CreateObject("component","/Models/Cart/model");
        Request.producto=model.getProduct(p);
        include "product-details.cfm";
    </cfscript>
</cffunction>


</cfcomponent>

