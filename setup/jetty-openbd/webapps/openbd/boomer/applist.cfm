<cfscript>
  MongoRegister(name="mongo", server="127.0.0.1", db="boomerdb");

  applist  = MongoCollectionfind("mongo", "applications", {});
  appcount = ArrayLen(applist);
</cfscript>

<!-- This is how you loop through each application and execute it -->
<cfloop index="i" from="1" to="#appcount#">
  <cfoutput><p>
    <span>#applist[i].title#</span>
    <a href="/boomer/launcher.cfm?o=#applist[i]._id.toString()#">Launch</a>
    <a href="/boomer/editapp.cfm?o=#applist[i]._id.toString()#">Edit</a>
  </p></cfoutput>
</cfloop>

<p><a href="/boomer/addapp.cfm">Add Application</a></p>