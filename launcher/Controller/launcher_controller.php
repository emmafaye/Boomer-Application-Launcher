<?php

    class LauncherController extends AppController {
        function showcase() {
            //This won't work
            echo exec('open /Applications/Utilities/Console.app');
        }

    }

?>
