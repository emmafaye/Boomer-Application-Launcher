$(document).ready(function() {
    $().controls('init', {
            'mapped' : {
                'controllers' : {
                    'dpadUp'        : {
                        'continous'     : true,
                        'func'          : function(){$().menu('input', 'navigate', 'up');}
                    },
                    'dpadDown'      : {
                        'continous'     : true,
                        'func'          : function(){$().menu('input', 'navigate', 'down');}
                    },
                    'dpadLeft'      : {
                        'continous'     : true,
                        'func'          : function(){$().menu('input', 'navigate', 'left');}
                    },
                    'dpadRight'     : {
                        'continous'     : true,
                        'func'          : function(){$().menu('input', 'navigate', 'right');}
                    },
                    'faceButton0'   : {
                        'continous'     : false,
                        'func'          : function(){$().menu('input', 'execute');}
                    },
                    'faceButton1'   : {
                        'continous'     : false,
                        'func'          : function(){$().menu('input', 'goBack');}
                    },
                    'faceButton3' : {
                        'continous'     : false,
                        'func'          : function(){$().menu('input', 'moreInfo');}
                    }
                },
                'keyboard' : {
                    'up arrow'        : {
                        'continous'     : true,
                        'func'          : function(){$().menu('input', 'navigate', 'up');}
                    },
                    'down arrow'      : {
                        'continous'     : true,
                        'func'          : function(){$().menu('input', 'navigate', 'down');}
                    },
                    'left arrow'      : {
                        'continous'     : true,
                        'func'          : function(){$().menu('input', 'navigate', 'left');}
                    },
                    'right arrow'     : {
                        'continous'     : true,
                        'func'          : function(){$().menu('input', 'navigate', 'right');}
                    },
                    'enter' : {
                        'continous'     : false,
                        'func'          : function(){$().menu('input', 'execute');}
                    },
                    'space' : {
                        'continous'     : false,
                        'func'          : function(){$().menu('input', 'moreInfo');}
                    },
                    'escape' : {
                        'continous'     : false,
                        'func'          : function(){$().menu('input', 'goBack');}
                    },
                    'backspace' : {
                        'continous'     : false,
                        'func'          : function(){$().menu('input', 'goBack');}
                    }
                },
                'mouse' : {
                    'left button' : {
                        'continous'     : false,
                        'func'          : function(){$().menu('input', 'execute');}
                    },
                    'right button' : {
                        'continous'     : false,
                        'func'          : function(){$().menu('input', 'edit');}
                    }
                }
            }
        }
    );
});

(function($){
    var _self = this;
    
    var options = {};
    var default_options = {};
    
    var buttons = [
        'dpadUp',
        'dpadDown',
        'dpadLeft',
        'dpadRight',
        'leftStickX',
        'leftStickY',
        'leftStickButton',
        'rightStickX',
        'rightStickY',
        'rightStickButton',
        'faceButton0',
        'faceButton1',
        'faceButton2',
        'faceButton3',
        'leftShoulder0',
        'rightShoulder0',
        'leftShoulder1',
        'rightShoulder1',
        'select',
        'start'
    ];
    var disabled_buttons = [
        'f5',
        'f11'
    ]
    var pressed_buttons = {};
//    var gamepads_start = {};
    
    var methods = {
        init : function(set_options) {
            options = $.extend({}, default_options, set_options);
         
            $('body').on({
                'keydown' : function(event) {
                    var button = $.charcode(event.which);
                    if($.inArray(button, disabled_buttons)) {
                        //event.preventDefault();
                    }
                    
                    _self.buttonDown(button, 'keyboard');
                },
                'keyup' : function(event) {
                    var button = $.charcode(event.which);
                    if($.inArray(button, disabled_buttons)) {
                        //event.preventDefault();
                    }
                    
                    _self.buttonUp(button, 'keyboard');
                }
            });
            $('#applications-container').on({
                'mousedown' : function(event) {
                    event.preventDefault();
                    
                    console.log('mousedown: ' + $(event.target).closest('[app_id]').attr('app_id'))
                    _self.buttonDown($.charcode(event.which), 'mouse');
                },
                'mouseup' : function(event) {
                    event.preventDefault();
                    
                    console.log('mouseup: ' + $(event.target).closest('[app_id]').attr('app_id'))
                    $().menu('setSelectedApplication', $(event.target).closest('[app_id]').attr('app_id'));
                    _self.buttonUp($.charcode(event.which), 'mouse');
                }
            });
            
            if(!window.requestAnimationFrame) {
                window.requestAnimationFrame = (function() {
                    return window.webkitRequestAnimationFrame ||
                    window.mozRequestAnimationFrame ||
                    window.oRequestAnimationFrame ||
                    window.msRequestAnimationFrame ||
                    function(/* function FrameRequestCallback */ callback, /* DOMElement Element */ element) {
                        window.setTimeout(callback, 1000 / 60);
                    };
                })();
            }

            if(Gamepad.supported) {
                // Ready to rock!
                console.log('Controllers are supported in this Browser');
            } else {
                // Fallback or encourage user to bug their browser vendor
                alert('Controller support is not available in your browser.');
            }
//            gamepads_start = Gamepad.getStates();
//            console.log(gamepads_start);
            
            
            _self.update();
            
            return this;
        },
        destroy : function() {
            
            return this;
        }
    };
    
    this.update = function() {
        var gamepads      = Gamepad.getStates();
        var gamepads_last = Gamepad.getPreviousStates();

        for(var i = 0; i < gamepads.length; ++i) {
            var gamepad      = gamepads[i];
            var gamepad_last = gamepads_last[i];
//            console.log(gamepad != undefined && gamepads_start[i] == undefined);
//            if(gamepad != undefined && gamepads_start[i] == undefined) {
//                console.log('Controller Connected: ' + gamepad.name);
//            }
            if(gamepad && gamepad_last) {
                for(var b = 0; b < buttons.length; ++b) {
                    if((gamepad[buttons[b]] == gamepad_last[buttons[b]]) && gamepad[buttons[b]] == 1) {
                        _self.buttonDown(buttons[b], 'controllers');
                    } else if(pressed_buttons[buttons[b]] == 1 && gamepad[buttons[b]] == 0) {
                        _self.buttonUp(buttons[b], 'controllers');
                    }
                }
            }
        }
        
//        window.setTimeout(_self.update, 20);
        window.requestAnimationFrame(update);
    }
    
    this.buttonDown = function(button, type) {
        console.log(button + ': down');
        if(options.mapped[type][button]) {
            pressed_buttons[button] = 1;
            _self.executeButton(button, 'down', type);
        }
    }
    
    this.buttonUp = function(button, type) {
        console.log(button + ': up');
        if(options.mapped[type][button]) {
            pressed_buttons[button] = 0;
            _self.executeButton(button, 'up', type);
        }

    }
    
    this.executeButton = function(button, state, type) {
        if(options.mapped[type][button].continous == true && state == 'down') {
            console.log(button + ' executed (down)');
            options.mapped[type][button].func();
        } else if(options.mapped[type][button].continous == false && state == 'up') {
            console.log(button + ' executed (up)');
            options.mapped[type][button].func();
        }
    }
    
    $.fn.controls = function(method) {
        if(methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if(typeof method === 'object' || ! method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' +  method + ' does not exist on jQuery.controls');
        }

    };
})(jQuery);


//            leftStick.style.left = Math.floor((pad.leftStickX + 1.0) / 2.0 * 256 - imgSize) + 'px';
//            leftStick.style.top = Math.floor((pad.leftStickY + 1.0) / 2.0 * 256 - imgSize) + 'px';
//            rightStick.style.left = Math.floor((pad.rightStickX + 1.0) / 2.0 * 256 - imgSize) + 'px';
//            rightStick.style.top = Math.floor((pad.rightStickY + 1.0) / 2.0 * 256 - imgSize) + 'px';