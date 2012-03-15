<cfscript>
  MongoRegister(name="mongo", server="127.0.0.1", db="boomerdb");

  // Get ObjectId for our application
  objectid    = "";
  saving      = false;
  saveSuccess = false;
  if(isDefined("url.o")) {
    objectid = url.o;
  }
  if(isDefined("form.title")) {
    saving = true;
  }

  // Make sure the ID passed is a valid ObjectId
  canEdit = false;
  app     = [];
  try {
    mongoObjectId = MongoObjectid(objectid);

    if(IsInstanceof(mongoObjectId, "org.bson.types.ObjectId")) {
      if(saving) {
        saveSuccess = MongoCollectionUpdate("mongo", "applications", {"_id":mongoObjectId}, {
          "title": form.title,
          "command": form.command,
          "image": form.image
        });
      } else {
        app = MongoCollectionfindone("mongo", "applications", {"_id":mongoObjectId});

        if(IsNull(app) == false) {
          canEdit = true;
        }
      }
    }
  } catch(Any e) { }
</cfscript>

<cfif canEdit>
  <cfscript>
    _title   = app.title;
    _command = app.command;
    _image   = app.image;

    __action = cgi.SCRIPT_NAME&"?"&cgi.QUERY_STRING;
  </cfscript>
<cfoutput><form action="#__action#" method="post">
    <p><label for="_title">Title: </label><input type="text" id="_title" name="title" value="#HtmlEditFormat(_title)#" /></p>
    <p><label for="_command">Command: </label><input type="text" id="_command" name="command" value="#HtmlEditFormat(_command)#" /></p>
    <p><label for="_image">Image: </label><input type="text" id="_image" name="image" value="#HtmlEditFormat(_image)#" /></p>
    <p><input type="submit" value="Edit Application" /></p>
</form></cfoutput>
<cfelseif saving>
This application was saved.
<cfoutput>Successful: #saveSuccess#</cfoutput>
<cfelse>
This application is either uneditable or doesn't exist
</cfif>