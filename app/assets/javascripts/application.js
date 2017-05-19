// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details//= require_tree .
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require 'admins/wangEditor.js'
//= require_tree .

$(document).ready(function () {
    if($("#errorsKey")[0] != undefined){
        var errorsKey = $("#errorsKey").val();
        if(errorsKey != ""){
            // var errorKeyList = errorsKey.split(",");
            // for(var i=0;i<errorKeyList.length;i++){
            //     $("input[name*='["+errorKeyList[i]+"]'],select[name*='["+errorKeyList[i]+"]'],textarea[name*='["+errorKeyList[i]+"]']").parent().parent().addClass("has-error");
            // }
            var errorList = JSON.parse(errorsKey);
            for(var key in errorList){
                $("input[name*='["+key+"]'],select[name*='["+key+"]'],textarea[name*='["+key+"]']").parent().parent().addClass("has-error");
                $("input[name*='["+key+"]'],select[name*='["+key+"]'],textarea[name*='["+key+"]']").parent().next("label").text(errorList[key][0]);
            }
        }
    }
    var screenWidth = document.body.clientWidth;
    if(screenWidth <= 768){
        $(".dropdown-submenu").addClass("open");
    }


    //admin-----------
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

function showLink(link,urlPre) {
    if(link == ""){return;}
    if(link.indexOf("http://")<0 && link.indexOf("https://")<0){
        link =urlPre+ link;
    }
    window.open(link);
}