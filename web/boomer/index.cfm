<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Launcher</title>
        <link rel="stylesheet" type="text/css" href="css/reset.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
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
            <input id="new-location" type="text" />
            <div id="change-location" class="menu-action">Change Location</div>
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
    </body>
</html>