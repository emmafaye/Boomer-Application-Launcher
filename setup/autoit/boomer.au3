#NoTrayIcon
Opt("TrayMenuMode", 1) ; Default tray menu items (Script Paused/Exit) will not be shown.
Local $restartitem = TrayCreateItem("Restart", -1, -1, 1)
TrayCreateItem("")
Local $stopitem = TrayCreateItem("Stop", -1, -1, 1)
TrayCreateItem("")
Local $exititem = TrayCreateItem("Exit", -1, -1, 1)
;TraySetIcon("warning")
TraySetToolTip("Boomer Application Launcher")
TraySetState() ; Show the tray icon

StartLauncher()
;$CmdLine[1] == "--run-server"
If $CmdLine[0] == 0 Then
    If ProcessExists("java.exe") AND ProcessExists("mongod.exe") Then
        If WinExists("Windows Security Alert","") Then Send("!a")
        Sleep(3000)
        ;If WinExists("Launcher - Google Chrome","") Then ProcessClose("chrome.exe")
        Run("C:\Users\" & @UserName & "\AppData\Local\Google\Chrome\Application\chrome.exe -incognito --enable-gamepad --new-window http://127.0.0.1:8080/boomer/")
        If Not WinActive("Launcher - Google Chrome","") Then WinActivate("Launcher - Google Chrome","")
        WinWaitActive("Launcher - Google Chrome","")
        Send("{F11}")
    EndIf
EndIf

While 1
    Local $msg = TrayGetMsg()
    Select
        Case $msg = 0
            ContinueLoop
        Case $msg = $restartitem
            StartLauncher()
        Case $msg = $stopitem
            If ProcessExists("java.exe") Then ProcessClose("java.exe")
            If ProcessExists("mongod.exe") Then ProcessClose("mongod.exe")
        Case $msg = $exititem
            If ProcessExists("java.exe") Then ProcessClose("java.exe")
            If ProcessExists("mongod.exe") Then ProcessClose("mongod.exe")
			   
            ExitLoop
    EndSelect
WEnd

Func StartLauncher()
   If ProcessExists("java.exe") Then ProcessClose("java.exe")
   If ProcessExists("mongod.exe") Then ProcessClose("mongod.exe")
	
   ;MsgBox(4096, 'test', @ScriptDir & "\mongodb\bin\mongod.exe --dbpath " & @ScriptDir & "\mongodb\data\db\")
   Run('"' & @ScriptDir & '\mongodb\bin\mongod.exe" --dbpath "' & @ScriptDir & '\mongodb\data\db"', @ScriptDir & '\mongodb\bin\', @SW_HIDE)
   Run('"C:\Program Files\Java\jre6\bin\java.exe" -jar start.jar', @ScriptDir & "\jetty-openbd\", @SW_HIDE)
   ;Run("java -jar start.jar", @ScriptDir & "\jetty-openbd\", @SW_HIDE)
EndFunc