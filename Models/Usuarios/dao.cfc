<cfcomponent>

<cffunction  name="obtenerRegistroUsuario"  access="package">
<cfargument name="userName" type="string">
<cfargument name="password" type="string">
    <cfquery name="responseQuery" datasource="myDatasource">
    SELECT 
        TUS_PK_USUARIO PK_USUARIO, 
        TUS_NOMBRE, 
        TUS_APELLIDOS, 
        TUS_USERNAME, 
        TUS_PASSWORD, 
        TUS_EMAIL, 
        TUS_FK_ESTADO, 
        TUS_FK_TIPO_USUARIO TIPO_USUARIO
        FROM T_USUARIOS
        WHERE 
        TUS_USERNAME='#userName#' AND
        TUS_PASSWORD='#password#' AND
        TUS_FK_ESTADO=2
    </cfquery>
    <cfreturn responseQuery>
</cffunction>

<cffunction  name="registrarUsuario"  access="package">
<cfargument name="nombre" type="string">
<cfargument name="apellido" type="string">
<cfargument name="userName" type="string">
<cfargument name="password" type="string">
    <cfquery name="responseQuery" datasource="myDatasource" result="resultInsert">
    INSERT INTO T_USUARIOS (
    TUS_PK_USUARIO, TUS_NOMBRE, TUS_APELLIDOS, 
    TUS_USERNAME, TUS_PASSWORD, TUS_EMAIL, 
    TUS_FK_ESTADO, TUS_FK_TIPO_USUARIO) 
    VALUES ( 0,
    '#nombre#',
    '#apellido#',
    '#userName#',
    '#password#',
    '#userName#',
    2,
    1)
    </cfquery>
    

    <cfquery name="responseQuery" datasource="myDatasource">
    SELECT 
        TUS_PK_USUARIO PK_USUARIO, 
        TUS_NOMBRE, 
        TUS_APELLIDOS, 
        TUS_USERNAME, 
        TUS_PASSWORD, 
        TUS_EMAIL, 
        TUS_FK_ESTADO, 
        TUS_FK_TIPO_USUARIO TIPO_USUARIO
        FROM T_USUARIOS
        WHERE 
        rowid ='#resultInsert.GENERATEDKEY#' AND
        TUS_FK_ESTADO=2
    </cfquery>
    <cfreturn responseQuery>
</cffunction>

</cfcomponent>