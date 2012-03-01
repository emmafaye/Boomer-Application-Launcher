<?php

    class LauncherController extends AppController {
        var $view = 'Theme';
        var $theme = 'Default';
        
        function display() {
            
        }
        
        //exec('runas /user:hellion\administrator cmd');
        //exec('open "M:\Emulation\Emulators\SNES\snes9x.exe" -fullscreen "M:\Emulation\Roms\SNES\Secret of Evermore (U) [!].smc"');
        //exec('start C:\test.exe');
        //$this->runAsynchronously('C:', 'test.lnk', '-fullscreen');
        
        function runAsynchronously($path, $program, $arguments) { 
            $WshShell = new COM("WScript.Shell"); 
            $oShellLink = $WshShell->CreateShortcut($program); 
            $oShellLink->TargetPath = $path; 
            $oShellLink->Arguments = $arguments; 
            $oShellLink->WorkingDirectory = dirname($path); 
            $oShellLink->WindowStyle = 1; 
            $oShellLink->Save(); 
            $oExec = $WshShell->Run($program, 7, false); 
            unset($WshShell,$oShellLink,$oExec); 
            unlink($program); 
        }

    }
?>
