(function($){
    var _self = this;
    
    var options = {};
    var default_options = {};
    
    var applicationsJSON = {
        "apps": [
            {"id": 0, "name": "Bastion", "image": "img/boxart/bastion.jpg", "location": ""},
            {"id": 1, "name": "CaveStory+", "image": "img/boxart/cavestory+.jpg", "location": ""},
            {"id": 2, "name": "Dead Island", "image": "img/boxart/deadisland.jpg", "location": ""},
            {"id": 3, "name": "Diablo 3", "image": "img/boxart/diablo3.jpg", "location": ""},
            {"id": 4, "name": "Dustforce", "image": "img/boxart/dustforce.jpg", "location": ""},
            {"id": 5, "name": "From Dust", "image": "img/boxart/fromdust.jpg", "location": ""},
            {"id": 6, "name": "Left 4 Dead 2", "image": "img/boxart/left4dead2.jpg", "location": ""},
            {"id": 7, "name": "Limbo", "image": "img/boxart/limbo.jpg", "location": ""},
            {"id": 8, "name": "Rochard", "image": "img/boxart/rochard.jpg", "location": ""},
            {"id": 9, "name": "Shank", "image": "img/boxart/shank.jpg", "location": ""},
            {"id": 10, "name": "Shank 2", "image": "img/boxart/shank2.jpg", "location": ""},
            {"id": 11, "name": "Skyrim", "image": "img/boxart/skyrim.jpg", "location": ""},
            {"id": 12, "name": "Starcraft 2", "image": "img/boxart/starcraft2.jpg", "location": ""},
            {"id": 13, "name": "Stealth Bastard", "image": "img/boxart/stealthbastard.jpg", "location": ""},
            {"id": 14, "name": "Super Meat Boy", "image": "img/boxart/supermeatboy.jpg", "location": ""},
            {"id": 15, "name": "Team Fortress 2", "image": "img/boxart/teamfortress2.jpg", "location": ""},
            {"id": 16, "name": "Terraria", "image": "img/boxart/terraria.jpg", "location": ""},
            {"id": 17, "name": "Trine", "image": "img/boxart/trine.jpg", "location": ""},
            {"id": 18, "name": "Unreal Tournament 3", "image": "img/boxart/ut3.jpg", "location": ""}
        ]
    };
    var applications = applicationsJSON;
    var selected_application = 0;
    var previous_application = 0;
    var app_boxart_padding   = 40;
    
    var app_boxart_width = 355 + app_boxart_padding;
    
    var methods = {
        init : function(set_options) {
            options = $.extend({}, default_options, set_options);
            parseApplications();
            selectApplication();
            
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
        setSelectedApplication : function(application) {
            setApplication(application);
            
//            if((previous_application - application) > 0) {
//                navigateApplications('right');
//            } else {
//                navigateApplications('left');
//            }
        },
        destroy : function() {
            
            return this;
        }
    };
    
    this.execute = function(location) {
        console.log('Open App: ' + selected_application);

        $.ajax({
            url: "launcher.cfm?location=" + applications.apps[selected_application].location,
            success: function(){
                console.log('App loaded.');
            }
        });
    }
    
    this.moreInfo = function() {
        console.log('moreInfo');
        
        var selected_app = findAppById(selected_application);
        $('#applications-container').find('.app').fadeOut({queue:true, duration:300});
        $('[app_id=' + selected_application + ']').fadeIn();
        $('#applications-container').css({left:app_boxart_width + 'px'});
        $('#applications-container').animate({
            top:'10%'
        }, {queue:false, duration:800});
    }
    
    this.goBack = function() {
        console.log('goBack');
    }
    
    this.navigate = function(direction) {
        console.log('Menu Navigate: ' + direction);
        
        switch(direction) {
            case 'up':
                break;
            case 'down':
                break;
            case 'left':
                navigateApplications(direction);
                break;
            case 'right':
                navigateApplications(direction);
                break;
        }
    }
    
    var setApplication = function(application) {
        previous_application = selected_application;

        selected_application = application;
        selectApplication();
    }
    
    var navigateApplications = function(direction) {
        var apps_container = $('#applications-container');
        var apps_container_left = parseInt(apps_container.css('left'));
        
        if(direction == 'left' && selected_application > 0) {
            apps_container.animate({left:(-(selected_application) * app_boxart_width + app_boxart_width + app_boxart_width) + 'px'}, {queue:false, duration:300});
            setApplication(selected_application-1);
        } else if(direction == 'right' && selected_application < Object.keys(applications.apps).length - 1) {
            apps_container.animate({left:((parseInt(selected_application)+1) * -app_boxart_width + app_boxart_width) + 'px'}, {queue:false, duration:300});
            setApplication(parseInt(selected_application)+1);
        }
    }
    
    var selectApplication = function() {
        var previous_app = findAppById(previous_application);
        var selected_app = findAppById(selected_application);
        
        previous_app.find('.app-boxart-container').removeClass('selected');
        previous_app.find('.app-title').slideUp();
        
        selected_app.find('.app-boxart-container').addClass('selected');
        selected_app.find('.app-title').slideDown();
    }
    
    var parseApplications = function() {
        $.each(applications.apps, function() {
            $('#applications-container').append(
                '<div class="app" app_id="' + this.id +'">' +
                    '<div class="app-boxart-container"><div class="app-boxart" style="background:url(' + this.image + ') no-repeat"></div></div>' +
                    '<div class="app-title">' + this.name + '</div>' +
                '</div>'
            );
            $('#applications-container').find('[app_id=' + this.id + '] .app-title').autoTextSize(20, 40, 20, true);
            $('#applications-container').find('[app_id=' + this.id + '] .app-title').hide();
        });
    }
    
    var findAppById = function(app_id) {
        return $('#applications-container').find('[app_id=' + app_id + ']');
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