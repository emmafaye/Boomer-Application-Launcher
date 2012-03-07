<cfset location = url['location'] />
<cfset s = [url['location']]>

<!-- http://localhost/boomer/launcher.cfm?location=M:\\WORK-DMI\\Web\\wamp\\www\\boomer\\games\\snes9x\\snes9x-x64.exe -->
<cfscript language="java">
    cfArray d = cf.getArray("s");
    cf.print(d.get(0));

    try {
        ProcessBuilder pb = new ProcessBuilder("test", "C:\\boomer\\games\\snes9x\\Roms\\Mega Man X.smc");
        Process p = pb.start();
    } catch(Exception e) {
        cf.print(e.getMessage());
    }
</cfscript>