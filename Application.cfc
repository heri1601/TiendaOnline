<cfcomponent>
<cfset This.name = "TiendaOnline">
<cfset This.sessionManagement="Yes">
<cfset This.loginstorage="session">
<cfset This.sessionTimeout="#CreateTimeSpan(0,0,30,0)#">
<cfset This.applicationtimeout="#CreateTimeSpan(0,1,0,0)#">
<cffunction name="OnApplicationStart">
	<cfscript>
		
	</cfscript>
</cffunction>

<cffunction name="OnRequestStart">
	<cfargument name = "thisRequest" required="true"/>
	<cfscript>
	//writedump(session);
	</cfscript>
</cffunction>


</cfcomponent>