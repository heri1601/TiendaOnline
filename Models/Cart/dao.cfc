<cfcomponent>
<cffunction  name="addToCart">
    <cfargument name="pkUsuario" type="string">
    <cfargument name="pkProducto" type="string">
    <cfargument name="pkTienda" type="string">
    <cfscript>
        var pkCarrito=0;
    </cfscript>
    <!---Verificar si ya existe un carrito--->
    <cfquery name="responseSearch" datasource="myDatasource">
        SELECT 
            TCA_PK_CARRITO, TCA_FK_USUARIO, TCA_FK_ESTADO_CARRITO, 
            TCA_FK_ESTADO, TCA_IMPORTE_PAGADO, TCA_TARJETA_PAGO, 
            TCA_FECHA_AUTORIZACION, TCA_NUM_REFERENCIA, TCA_BANCO, 
            TCA_REQUIERE_FACTURA, TCA_FK_TIENDA
            FROM TIENDAS.T_CARRITO
            WHERE 
            TCA_FK_USUARIO='#pkUsuario#' AND
            TCA_FK_TIENDA='#pkTienda#' AND
            TCA_FK_ESTADO_CARRITO=1
    </cfquery>
    <cfset cartExistance=#responseSearch.recordcount#>
    <cfif cartExistance EQ 0>
        <cfquery name="response" datasource="myDatasource" result="resultData">
            INSERT INTO TIENDAS.T_CARRITO (
            TCA_PK_CARRITO, TCA_FK_USUARIO, TCA_FK_ESTADO_CARRITO, 
            TCA_FK_ESTADO,  TCA_FK_TIENDA) 
            VALUES ( 0,
            '#pkUsuario#',
            1,<!---Estado carrito--->
            1,<!---Estado registro--->
            '#pkTienda#')
        </cfquery>
        <cfscript>
        </cfscript>
            <cfquery name="response" datasource="myDatasource">
                SELECT 
                    TCA_PK_CARRITO
                    FROM TIENDAS.T_CARRITO
                    WHERE 
                    ROWID='#resultData.GENERATEDKEY#'
            </cfquery>
            <cfset pkCarrito=response.TCA_PK_CARRITO[1]>
        <cfelse>
            <cfset pkCarrito=responseSearch.TCA_PK_CARRITO[1]>
    </cfif>
    <!---Agregando una unidad del producto al carrito--->
    <cfquery name="response" datasource="myDatasource" result="resultData">
            INSERT INTO TIENDAS.T_ELEMENTO_CARRITO (
            TEC_PK_ELEMENTO_CARRITO, TEC_FK_CARRITO, TEC_FK_PRODUCTO, 
            TEC_CANTIDAD, TEC_FK_ESTADO) 
            VALUES ( 0,
            '#pkCarrito#',
            '#pkProducto#',
            1,
            1)
        </cfquery>
    <cfreturn resultData.GENERATEDKEY>
</cffunction>


<cffunction  name="getCart">
    <cfargument name="pkUsuario" type="string">
    <cfargument name="pkTienda" type="string">
    <cfquery name="responseSearch" datasource="myDatasource">
            SELECT 
                ECA.TEC_PK_ELEMENTO_CARRITO, 
                ECA.TEC_FK_CARRITO, 
                ECA.TEC_FK_PRODUCTO, 
                ECA.TEC_CANTIDAD, 
                ECA.TEC_FK_ESTADO,
                PRO.TPR_PK_PRODUCTO, 
                PRO.TPR_NOMBRE, 
                PRO.TPR_DESCRIPCION, 
                TO_CHAR(TPR_PRECIO,'99999.99') TPR_PRECIO, 
                PRO.TPR_IMAGEN
                FROM TIENDAS.T_ELEMENTO_CARRITO ECA,TIENDAS.T_CARRITO CAR, TIENDAS.T_PRODUCTOS PRO
                WHERE 
                PRO.TPR_PK_PRODUCTO=ECA.TEC_FK_PRODUCTO AND
                ECA.TEC_FK_CARRITO=TCA_PK_CARRITO AND
                ECA.TEC_FK_ESTADO>0 AND
                TCA_FK_ESTADO=1 AND
                TCA_FK_USUARIO='#pkUsuario#' AND
                TCA_FK_TIENDA='#pkTienda#'

    </cfquery>
    <cfreturn responseSearch>
</cffunction>

<cffunction  name="updateCuantityCartProduct">
    <cfargument name="pkElementoCarrito" type="string">
    <cfargument name="num" type="string">
    <cfquery name="responseSearch" datasource="myDatasource" result="responseData">
        UPDATE TIENDAS.T_ELEMENTO_CARRITO
        SET    
            TEC_CANTIDAD            = TEC_CANTIDAD+'#num#'
        WHERE  TEC_PK_ELEMENTO_CARRITO = '#pkElementoCarrito#'
    </cfquery>
    <cfreturn responseData.RECORDCOUNT>
</cffunction>

<cffunction  name="getProduct">
    <cfargument name="pkProducto" type="string">
    <cfquery name="responseSearch" datasource="myDatasource">
            SELECT 
             TPR_PK_PRODUCTO, TPR_NOMBRE, TPR_DESCRIPCION, 
            TO_CHAR(TPR_PRECIO,'99999.99') TPR_PRECIO, TPR_IMAGEN, TPR_FK_ESTADO, 
            TPR_FECHA_REGISTRO
            FROM TIENDAS.T_PRODUCTOS
            WHERE 
            TPR_PK_PRODUCTO='#pkProducto#' AND
            TPR_FK_ESTADO=2
    </cfquery>
    <cfreturn responseSearch>
</cffunction>

</cfcomponent>
