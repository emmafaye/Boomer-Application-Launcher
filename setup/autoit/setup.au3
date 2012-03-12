Local $install = MsgBox(4, "Install Boomer", 'This setup will install the Boomer Application Launcher, Java and the Developement build of Google Chrome for Gamepad Support.' & @LF & @LF & 'Proceed with Installation?')

If ($install = 6) Then
	  Local $JRE = Run(@ScriptDir & "/setup/jre.exe")
	  ProcessWaitClose($JRE)
	  
	  Local $GC = Run(@ScriptDir & "/setup/ChromeSetup.exe")
	  ProcessWaitClose($GC)
	  
	  Local $installLocation = InputBox("Install Directory", "Where should the Boomer Application Launcher be Installed?", "C:\Program Files\Boomer", "")
	  If $installLocation = @error = 0 or StringLen($installLocation) < 1 Then
		 $installLocation = "C:\Program Files\Boomer"
	  EndIf
	  
	  FileCopy(@ScriptDir & "/setup/*", $installLocation & "/", 9)
	  DirCopy(@ScriptDir & "/setup/", $installLocation & "/", 1)
	  
	  Local $startup = MsgBox(4, "Start with Windows", 'Would you like Boomer Application Launcher to Start with Windows?')
	  If ($startup = 6) Then
		 FileCopy(@ScriptDir & "/setup/Boomer.lnk", "C:\Users\" & @UserName & "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\", 1)
	  EndIf
	  
	  ;Clean up
	  FileDelete($installLocation & "/jre.exe")
	  FileDelete($installLocation & "/ChromeSetup.exe")
	  FileDelete($installLocation & "/Boomer.lnk")
	  DirRemove($installLocation & "/autoit/", 1)
	  
	  Local $launch = MsgBox(4, "Launch Boomer Application Launcher", 'Installation is Complete.' & @LF & @LF & 'Would you like to Launch Boomer Application Launcher?')
	  If ($launch = 6) Then
		 Run($installLocation & "/boomer.exe")
	  EndIf
EndIf

