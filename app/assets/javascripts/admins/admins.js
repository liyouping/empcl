//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets
$(document).ready(function () {
    var screenWidth = document.body.clientWidth;
    if(screenWidth > 768){
        $("#wrapper").addClass("toggled");
    }
    $(".go-to-header").click(function (e) {
        $('html,body').animate({scrollTop: '0px'}, 300);
    });

    $(window).bind("scroll", function(){
        var top = $(this).scrollTop(); // 当前窗口的滚动距离
        if(top >100){
            $(".go-to-header").show(300);
        }else {
            $(".go-to-header").hide(300);
        }
    });

    var trigger = $('.hamburger'),
        isClosed = false;

    trigger.click(function () {
        hamburger_cross();
    });

    function hamburger_cross() {
        if (isClosed == true) {
            trigger.removeClass('is-open');
            trigger.addClass('is-closed');
            isClosed = false;
        } else {
            trigger.removeClass('is-closed');
            trigger.addClass('is-open');
            isClosed = true;
        }
    }

    $('[data-toggle="offcanvas"]').click(function () {
        $('#wrapper').toggleClass('toggled');
    });
});

