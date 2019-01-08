<cfcomponent>

<cffunction  name="obtenerRegistroUsuario" >
<cfargument name="userName" type="string">
<cfargument name="password" type="string">
<cfscript>
    var dao=CreateObject("component","/Models/Usuarios/dao");            
    var registro=dao.obtenerRegistroUsuario(userName,password);
    var response=StructNew();
    response.exists=false;
    response.type='client';
    if(registro.recordcount==1){
        response.exists=true;
    }
    if(registro.TIPO_USUARIO[1]==2){
        response.type='admin';
    }
    response.registro=registro;
    return response;
</cfscript>
</cffunction>

<cffunction  name="registrarUsuario" >
<cfargument name="nombre" type="string">
<cfargument name="apellidos" type="string">
<cfargument name="userName" type="string">
<cfargument name="password" type="string">
<cfscript>
    var dao=CreateObject("component","/Models/Usuarios/dao");            
    
    var registro=dao.obtenerRegistroUsuario(userName,password);
    if(registro.recordcount>0){//El usuario ya existe
        var response=StructNew();
        response.exists='error';
        return response;
    }
    var registro=dao.registrarUsuario(nombre,apellidos,userName,password);
    var response=StructNew();
    response.exists=true;
    response.type='client';
    response.registro=registro;
    return response;
</cfscript>
</cffunction>

</cfcomponent>