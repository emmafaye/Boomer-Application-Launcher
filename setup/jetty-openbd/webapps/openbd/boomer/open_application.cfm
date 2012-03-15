<cfscript>
/**
 Added the following to Mongo:
 DB    : "boomerdb"
 Table : applications

 applications schema:
  _id
  title
  command

 1 | Snes9x   | /loc/to/snes9x.exe %game%
 2 | Diablo 3 | /loc/to/diablo3.exe
 3 | Shank    | cmd /loc/to/shank.lnk

 We will then run command through param rewrites (%game% will turn in to the location for a game)

 db.applications.insert({"title":"League of Legends", "command":"\"C:\\Riot Games\\League of Legends\\lol.launcher.exe\""});

 This insert will add an object with an _id. This value is how we'll access the applications passed by the URL param 'o'.
**/
  MongoRegister(name="mongo", server="127.0.0.1", db="boomerdb");

  // Get ObjectId for our application
  objectid = "";
  if(isDefined("url.id")) {
    objectid = url.id;
  }

  // Make sure the ID passed is a valid ObjectId
  // TODO: I don't know how else to catch this issue without using try/catch
  // When setting MongoObjectid to a non-valid ObjectId it will return "object of [undefined class]" but I'm unable
  // to use isInstanceOf. It throws a NullPointerException.
  command      = "";
  appCanLaunch = false;
  try {
    mongoObjectId = MongoObjectid(objectid);

    if(IsInstanceof(mongoObjectId, "org.bson.types.ObjectId")) {
      app = MongoCollectionfindone("mongo", "applications", {"_id":mongoObjectId});

      if(IsNull(app) == false) {
        command      = app.command;
        appCanLaunch = true;
      }
    }
  } catch(Any e) { }
</cfscript>

<cfif appCanLaunch>
  <cfscript language="java">
    String command = cf.getString("command");
    // cfArray parameters = cf.getArray("parameters");

    try {
      ProcessBuilder pb = new ProcessBuilder("cmd", "/c", command);
      //ProcessBuilder pb = new ProcessBuilder(command);
      /*if(parameters.size() > 0) {
        pb = new ProcessBuilder(application, (String)parameters.get(0));
      }*/
      Process p = pb.start();
    } catch(Exception e) {
      cf.print(e.getMessage());
    }
  </cfscript>
<cfelse>
    Not a valid Application Passed
</cfif>
