<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Launcher</title>
        <link rel="stylesheet" type="text/css" href="css/reset.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <script type="text/javascript">
            //console.log = function() {};
        </script>
        <script type="text/javascript" src="js/plugins/jquery.js"></script>
        <script type="text/javascript" src="js/plugins/mouse.js"></script>
        <script type="text/javascript" src="js/plugins/keycodes.js"></script>
        <script type="text/javascript" src="js/plugins/gamepad.js"></script>
        <script type="text/javascript" src="js/plugins/truncatinator.js"></script>
        <script type="text/javascript" src="js/controls.js"></script>
        <script type="text/javascript" src="js/menu.js"></script>
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    </head>
    <body>
        <div id="menu">
            <div class="menu-item">
                <div class="menu-item-title">Name</div>
                <input id="menu-app-name" type="text" />
            </div>
            <div class="menu-item">
                <div class="menu-item-title">Application Command</div>
                <input id="menu-app-command" type="text" />
            </div>
            <div class="menu-item">
                <div class="menu-item-title">Image</div>
                <input id="menu-app-image" type="text" />
            </div>
            <div class="menu-item">
                <div class="menu-item-title">Genre</div>
                <input id="menu-app-genre" type="text" />
            </div>
            <div class="menu-item">
                <div class="menu-item-title">Screenshot 1</div>
                <input id="menu-app-screenshot-1" type="text" />
            </div>
            <div class="menu-item">
                <div class="menu-item-title">Screenshot 2</div>
                <input id="menu-app-screenshot-2" type="text" />
            </div>
            <div class="menu-item">
                <div class="menu-item-title">Screenshot 3</div>
                <input id="menu-app-screenshot-3" type="text" />
            </div>
            <div class="menu-item">
                <div class="menu-item-title">Description</div>
                <textarea id="menu-app-description"></textarea>
            </div>
                
            <span id="menu-set-app" class="menu-button">Set Application</span>
        </div>
        
        <div id="applications-types-container">
            <div class="application-type">PC Games</div>
            <div class="application-type">SNES</div>
            <div class="application-type">Nintendo 64</div>
        </div>
        <div id="applications-scroll-container">
            <div id="applications-container">
                <div id="applications-info">
                    Screenshots
                    <div id="applications-screenshots"></div>
                    <div id="applications-description"></div>
                </div>
                <div id="applications-genre"></div>
            </div>
        </div>
        <div id="add-button">+</div>
    </body>
</html>