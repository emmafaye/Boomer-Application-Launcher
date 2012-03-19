<cfif isDefined("form.title")>
  <cfscript>
    MongoRegister(name="mongo", server="127.0.0.1", db="boomerdb");

    MongoCollectionInsert("mongo", "applications", {
      "title": form.title,
      "command": form.command,
      "image": form.image
    });
  </cfscript>

  <p>Application was registered with the following information:</p>
  <cfoutput>
    <p><strong>Title:</strong> <span>#form.title#</span></p>
    <p><strong>Command:</strong> <span>#form.command#</span></p>
    <p><strong>Image:</strong> <span>#form.image#</span></p>
  </cfoutput>
<cfelse>
  <form action="?" method="post">
    <p><label for="_title">Title: </label><input type="text" id="_title" name="title" /></p>
    <p><label for="_command">Command: </label><input type="text" id="_command" name="command" /></p>
    <p><label for="_image">Image: </label><input type="text" id="_image" name="image" /></p>
    <p><input type="submit" value="Add Application" /></p>
  </form>
</cfif>