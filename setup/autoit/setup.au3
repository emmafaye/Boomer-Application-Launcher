If ProcessExists("java.exe") Then ProcessClose("java.exe")
If ProcessExists("mongod.exe") Then ProcessClose("mongod.exe")
   
Local $install = MsgBox(4, "Install Boomer", 'This setup will install the Boomer Application Launcher, Java and the Developement build of Google Chrome for Gamepad Support.' & @LF & @LF & 'Proceed with Installation?')

If ($install = 6) Then
	  Local $JRE = Run(@ScriptDir & "\setup\jre.exe")
	  ProcessWait($JRE)
	  Send("!y")
	  WinWaitActive("Java Setup - Welcome","")
	  Send("!i")
	  WinWaitActive("Java Setup - Complete","")
	  Send("{Enter}")
	  ProcessWaitClose($JRE)
	  FileCopy(@ScriptDir & "\setup\tools.jar", "C:\Program Files\Java\jre6\lib", 1)
	  
	  Local $CMD = Run("cmd.exe /k set CLASSPATH=%CLASSPATH%;C:\Prorgram Files\jre6\bin", @SW_HIDE)
	  ProcessClose($CMD)
	  
	  Local $GC = Run(@ScriptDir & "\setup\ChromeSetup.exe")
	  ProcessWaitClose($GC)
	  
	  ProcessWait("chrome.exe")
	  ProcessClose("chrome.exe")
	  
	  Local $installLocation = InputBox("Install Directory", "Where should the Boomer Application Launcher be Installed?", "C:\Program Files\Boomer", "")
	  If $installLocation = @error = 0 or StringLen($installLocation) < 1 Then
		 $installLocation = "C:\Program Files\Boomer"
	  EndIf
	  
	  FileCopy(@ScriptDir & "\setup\*", $installLocation & "\", 9)
	  DirCopy(@ScriptDir & "\setup\", $installLocation & "\", 1)
	  
	  Local $startup = MsgBox(4, "Start with Windows", 'Would you like Boomer Application Launcher to Start with Windows?')
	  If ($startup = 6) Then
		 FileCreateShortcut($installLocation & "\boomer.exe", "C:\Users\" & @UserName & "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Boomer.lnk", $installLocation, "", "Launch the Boomer Application Launcher.", @SystemDir & "\shell32.dll", "", "15")
	  EndIf
	  
	  ;Clean up
	  FileDelete($installLocation & "\jre.exe")
	  FileDelete($installLocation & "\ChromeSetup.exe")
	  FileDelete($installLocation & "\tools.jar")
          FileDelete($installLocation & "\Run Server.lnk")
	  DirRemove($installLocation & "\autoit\", 1)
	  
	  Local $launch = MsgBox(4, "Launch Boomer Application Launcher", 'Installation is Complete.' & @LF & @LF & 'Would you like to Launch Boomer Application Launcher?')
	  If ($launch = 6) Then
		 Run($installLocation & "\boomer.exe")
	  EndIf
EndIf

