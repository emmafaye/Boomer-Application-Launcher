<cfscript>
  MongoRegister(name="mongo", server="127.0.0.1", db="boomerdb");

  applist  = MongoCollectionfind("mongo", "applications", {});
  appcount = ArrayLen(applist);
</cfscript>

<!-- This is how you loop through each application and execute it -->
<cfloop index="i" from="1" to="#appcount#">
  <p>
    <cfoutput>
      <a href="/boomer/launcher.cfm?o=#applist[i]._id.toString()#">#applist[i].title#</a>
    </cfoutput>
  </p>
</cfloop>