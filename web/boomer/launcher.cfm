<cfscript>
  // a = application
  // p = parameters

  // Application is a reserved word
  app = "C:\\boomer-git\\games\\snes9x\\snes9x-x64.exe";
  parameters  = [];
  if(isDefined("url.p")) {
    parameters = ListToArray(url.p);
  }
</cfscript>

<!-- http://localhost/boomer/launcher.cfm?p=C:\boomer-git\games\snes9x\Roms\Mega%20Man%20X.smc -->
<cfscript language="java">
  String application = cf.getString("app");
  cfArray parameters = cf.getArray("parameters");

  cf.print(application);
  if(parameters.size() > 0) {
    cf.print(parameters.get(0));
  }

  try {
    ProcessBuilder pb = new ProcessBuilder(application);
    if(parameters.size() > 0) {
      pb = new ProcessBuilder(application, (String)parameters.get(0));
    }
    Process p = pb.start();
  } catch(Exception e) {
    cf.print(e.getMessage());
  }
</cfscript>