<cfcomponent>
<cffunction  name="addToCart">
    <cfargument name="pkUsuario" type="string">
    <cfargument name="pkProducto" type="string">
    <cfargument name="pkTienda" type="string">
    <cfscript>
        var dao=CreateObject("component","/Models/Cart/DAO");            
        var response=dao.addToCart(pkUsuario,pkProducto,pkTienda);
        return response;
    </cfscript>
</cffunction>


<cffunction  name="getCart">
    <cfargument name="pkUsuario" type="string">
    <cfargument name="pkTienda" type="string">
    <cfscript>
        var dao=CreateObject("component","/Models/Cart/DAO");            
        var elementos=dao.getCart(pkUsuario,pkTienda);
        var response=StructNew();
        response.elementos=elementos;
        //Calculando totales
        response.subtotal=0.0;
        for(i=1;i<=response.elementos.recordcount;i++){
            response.subtotal+=response.elementos.TPR_PRECIO[i]*response.elementos.TEC_CANTIDAD[i];
        }
        response.delivery=150.00;
        response.total=response.subtotal+response.delivery;
        return response;
    </cfscript>
</cffunction>


<cffunction  name="updateCuantityCartProduct">
    <cfargument name="pkElementoCarrito" type="string">
    <cfargument name="num" type="string">
    <cfscript>
        var dao=CreateObject("component","/Models/Cart/DAO");            
        var response=dao.updateCuantityCartProduct(pkElementoCarrito,num);
        return response;
    </cfscript>
</cffunction>

<cffunction  name="getProduct">
    <cfargument name="pkProducto" type="string">
    <cfscript>
        var dao=CreateObject("component","/Models/Cart/DAO");            
        var response=dao.getProduct(pkProducto);
        return response;
    </cfscript>
</cffunction>
 

</cfcomponent>
