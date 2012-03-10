<cfscript>
  location   = "";
  parameters = [];
  
  if(isDefined("url.location")) {
    location = url.location;
  }
  if(isDefined("url.parameters")) {
    parameters = ListToArray(url.parameters);
  }
</cfscript>

<!-- http://localhost/boomer/launcher.cfm?location=C:\boomer-git\games\snes9x\snes9x.exe&parameters=C:\boomer-git\games\snes9x\Roms\Mega%20Man%20X.smc -->
<cfscript language="java">
  String application = cf.getString("location");
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