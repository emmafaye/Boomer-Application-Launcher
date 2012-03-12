If ProcessExists("java.exe") Then ProcessClose("java.exe")
If ProcessExists("mongod.exe") Then ProcessClose("mongod.exe")
   
Run(@ScriptDir & "/mongodb/bin/mongod.exe --dbpath " & @ScriptDir & "/mongodb/data/db", @ScriptDir & "/mongodb/bin/", @SW_HIDE)
Run("java -jar start.jar", @ScriptDir & "/jetty-openbd/", @SW_HIDE)

Sleep(2000)
;If WinExists("Launcher - Google Chrome","") Then ProcessClose("chrome.exe")
Run("C:\Users\" & @UserName & "\AppData\Local\Google\Chrome\Application\chrome.exe --enable-gamepad http://127.0.0.1:8080/boomer/")
If Not WinActive("Launcher - Google Chrome","") Then WinActivate("Launcher - Google Chrome","")
WinWaitActive("Launcher - Google Chrome","")
Send("{F11}") 