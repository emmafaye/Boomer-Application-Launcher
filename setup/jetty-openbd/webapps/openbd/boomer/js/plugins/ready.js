var $docReady = [];
// Custom jQuery plugin to start multiple items on document ready
(function ($) {
    $.fn.documentReady = function() {
        $.each($docReady, function() {
            this();
        });
    }
})(jQuery);
$('document').ready(function() { $.fn.documentReady(); });