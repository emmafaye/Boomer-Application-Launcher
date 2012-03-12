#NoTrayIcon

Opt("TrayMenuMode", 1) ; Default tray menu items (Script Paused/Exit) will not be shown.

Local $exititem = TrayCreateItem("Exit")

TraySetIcon("warning")
TraySetToolTip("SOS")

TraySetState() ; Show the tray icon

Local $toggle = 0

If ProcessExists("java.exe") Then ProcessClose("java.exe")
If ProcessExists("mongod.exe") Then ProcessClose("mongod.exe")
   
Run(@ScriptDir & "/mongodb/bin/mongod.exe --dbpath " & @ScriptDir & "/mongodb/data/db", @ScriptDir & "/mongodb/bin/", @SW_HIDE)
Run('"C:/Program Files/Java/jre6/bin/java.exe" -jar start.jar', @ScriptDir & "/jetty-openbd/", @SW_HIDE)
;Run("java -jar start.jar", @ScriptDir & "/jetty-openbd/", @SW_HIDE)

Sleep(2000)
;If WinExists("Launcher - Google Chrome","") Then ProcessClose("chrome.exe")
Run("C:\Users\" & @UserName & "\AppData\Local\Google\Chrome\Application\chrome.exe --enable-gamepad http://127.0.0.1:8080/boomer/")
If Not WinActive("Launcher - Google Chrome","") Then WinActivate("Launcher - Google Chrome","")
WinWaitActive("Launcher - Google Chrome","")
Send("{F11}") 

While 1
    Local $msg = TrayGetMsg()
    Select
        Case $msg = 0
            Sleep(1000)
            If $toggle = 0 Then
                TraySetState() ; Show the tray icon
                $toggle = 1
            Else
                TraySetState(2) ; Hide the tray icon
                $toggle = 0
            EndIf
        Case $msg = $exititem
            ExitLoop
    EndSelect

WEnd

Exit