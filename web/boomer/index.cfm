<cfscript language="java">
try {
  ProcessBuilder pb = new ProcessBuilder("C:\\boomer\\games\\snes9x\\snes9x-x64.exe", "C:\\boomer\\games\\snes9x\\Roms\\Mega Man X.smc");
  Process p = pb.start();
} catch(Exception e) {
  cf.print(e.getMessage());
}
</cfscript>