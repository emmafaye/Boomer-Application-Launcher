$(document).ready(function() {

    first_app = $('#applications-container').find('.app:first');
    $('body').on('keydown', function(event) {
        console.log(event.which);
        
        keyCode = event.which;
        switch(keyCode) {
            case 37:
                //move left
                first_app.prev('.app').find('.app-boxart-container').addClass('selected');
                break;
            case 38:
                //move up
                break;
            case 39:
                first_app.next('.app').find('.app-boxart-container').addClass('selected')
                //first_app.find('.app-boxart-shadow').addClass('app-boxart-shadow-hover');
                //move right
                break;
            case 40:
                //move down
                break;
        }
    });
});