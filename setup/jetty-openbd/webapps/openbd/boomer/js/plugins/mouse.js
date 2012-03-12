(function ($) {
    var _self  = this;
    var mouseX = 0;
    var mouseY = 0;

    var methods = {
        init : function() {
            $(document).on('mousemove', function(event) {
                _self.mouseX = event.pageX;
                _self.mouseY = event.pageY;
            });
        
            return this;
        },
        getMouseX : function() {
            return _self.mouseX;
        },
        getMouseY : function() {
            return _self.mouseY;
        },
        isOver : function() {
            var $element = this;
            var $elementPosition = $($element).offset();
            var $elementWidth = $($element).width();
            var $elementHeight = $($element).height();
            var $returnValue = true;
            
            if (_self.mouseX !== null) {
                if (_self.mouseX < $elementPosition.left) { $returnValue = false; }
                if (_self.mouseY < $elementPosition.top) { $returnValue = false; }
                if (_self.mouseX > $elementPosition.left + $elementWidth) { $returnValue = false; }
                if (_self.mouseY > $elementPosition.top + $elementHeight) { $returnValue = false; }
            }
            
            return $returnValue;
        }
    };
    
    $.fn.mouse = function(method) {
        if(methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if(typeof method === 'object' || ! method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' +  method + ' does not exist on jQuery.controls');
        }

    };
})(jQuery);

$(document).ready(function() {
    $().mouse('init');
});

// Determining Mouseover
//if ($('#elementId').isOver()) {
//    alert('Is over');
//}