(function($){
    var _self = this;
    
    var options = {};
    var default_options = {};
    
    var applicationsJSON = {
        "apps": [
            {"name": "Diablo 3", "image": "img/boxart/diablo3.jpg", "location": ""},
            {"name": "Starcraft 2", "image": "img/boxart/starcraft2.jpg", "location": ""}
        ]
    };
    
    var methods = {
        init : function(set_options) {
            options = $.extend({}, default_options, set_options);
            parseApplications();
            
            return this;
        },
        input : function(command, argument) {
            if(_self[command]) {
                if(argument) {
                    _self[command](argument);
                } else {
                    _self[command]();
                }
            } else {
                $.error('Menu function "' + command + '" doesn\'t exisit');
            }
        },
        destroy : function() {
            
            return this;
        }
    };
    
    this.execute = function() {
        console.log('executed');
    }
    
    this.goBack = function() {
        console.log('goBack');
    }
    
    this.navigate = function(direction) {
        console.log('navigate' + direction);
    }
    
    var parseApplications = function() {
        $.each(applicationsJSON.apps, function() {
            $('#applications-container').append(
                '<div class="app">' +
                    '<div class="app-boxart-container"><div class="app-boxart" style="background:url(' + this.image + ') no-repeat"></div></div>' +
                    '<div class="app-title">' + this.name + '</div>' +
                '</div>'
            );
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
})(jQuery);

$(document).ready(function() {
    $().menu('init');
});