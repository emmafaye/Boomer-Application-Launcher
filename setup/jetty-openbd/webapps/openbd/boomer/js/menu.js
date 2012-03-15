(function($){
    var _self = this;
    
    var options = {};
    var default_options = {};
    
//    <div id="menu">
//        <div class="menu-item">
//            <div class="menu-item-title">Name</div>
//            <input id="menu-app-name" type="text" />
//        </div>
//        <div class="menu-item">
//            <div class="menu-item-title">Application Command</div>
//            <input id="menu-app-command" type="text" />
//        </div>
//        <div class="menu-item">
//            <div class="menu-item-title">Image</div>
//            <input id="menu-app-image" type="text" />
//        </div>
//        <div class="menu-item">
//            <div class="menu-item-title">Genre</div>
//            <input id="menu-app-genre" type="text" />
//        </div>
//        <div class="menu-item">
//            <div class="menu-item-title">Screenshot 1</div>
//            <input id="menu-app-screenshot-1" type="text" />
//        </div>
//        <div class="menu-item">
//            <div class="menu-item-title">Screenshot 2</div>
//            <input id="menu-app-screenshot-2" type="text" />
//        </div>
//        <div class="menu-item">
//            <div class="menu-item-title">Screenshot 3</div>
//            <input id="menu-app-screenshot-3" type="text" />
//        </div>
//        <div class="menu-item">
//            <div class="menu-item-title">Description</div>
//            <textarea id="menu-app-description"></textarea>
//        </div>
//
//        <span id="menu-set-app" class="menu-button">Set Application</span>
//    </div>
    
    var methods = {
        init : function(set_options) {
            options = $.extend({}, default_options, set_options);
            menuEvents();
            
            return this;
        },
        destroy : function() {
            
            return this;
        }
    };
    
    var displayMenu = function() {
        var mousePos = $.fn.mouse('getMousePos');
        $('#menu').css({'top': mousePos['y'] + 'px', 'left': mousePos['x'] + 'px', 'bottom': 'auto', 'right': 'auto'}).fadeIn('slow');
    }
    
    var menuEvents = function() {
        $('#add-button').on('click', function() {
            $('#menu').css({'top': 'auto', 'left': 'auto', 'bottom': 50 + 'px', 'right': 50 + 'px'}).fadeIn('slow');
        })
//        $.ajax({
//            type: 'POST',
//            url: url,
//            data: data,
//            success: success,
//            dataType: dataType
//        });

        //disables right-click context menu
        $('body').on("contextmenu", function(event) {
            return false;
        });
        $('body').on('click', function(event) {
            if($(event.target).attr('id') != 'add-button' && $(event.target).attr('id') != 'menu' && $(event.target).closest('#menu').attr('id') != 'menu') {
                $('#menu').fadeOut('slow'); 
            }
        });
        $('#menu').on('click', function(event) {
            switch($(event.target).attr('id')) {
                case 'menu-set-location':
                    applications.apps[selected_application].location = $('#menu-app-command').val();
                    $('#menu-app-command').closest('.menu-item').prepend('<span id="completed-icon">&#10004;</span>');
                    $('#completed-icon').fadeIn().fadeOut();

                    break;
                case 'edit-parameters':
                    break;
            }
        });
    }
    
    $.fn.menu = function(method) {
        if(methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if(typeof method === 'object' || ! method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' +  method + ' does not exist on jQuery.menu');
        }

    };
    
    //$docReady.push(methods.init);
})(jQuery);