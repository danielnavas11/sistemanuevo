$(document).ready(function (e) {
    // FULL SCREEN MENU (Layout 02)
    $('.menu-sidebar-collapse').sideNav({
        menuWidth: 240,
        edge: 'left', // Choose the horizontal origin     
        //defaultOpen:true // Set if default menu open is true
    });
    // Fullscreen
    function toggleFullScreen() {
        if ((document.fullScreenElement && document.fullScreenElement !== null) ||
                (!document.mozFullScreen && !document.webkitIsFullScreen)) {
            if (document.documentElement.requestFullScreen) {
                document.documentElement.requestFullScreen();
            } else if (document.documentElement.mozRequestFullScreen) {
                document.documentElement.mozRequestFullScreen();
            } else if (document.documentElement.webkitRequestFullScreen) {
                document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
            }
        } else {
            if (document.cancelFullScreen) {
                document.cancelFullScreen();
            } else if (document.mozCancelFullScreen) {
                document.mozCancelFullScreen();
            } else if (document.webkitCancelFullScreen) {
                document.webkitCancelFullScreen();
            }
        }
    }

    $('.toggle-fullscreen').click(function () {
        toggleFullScreen();
    });
    
    //evita que el dropdown menu al darle click se cierre
    $(".dropdown")[0] && ($("body").on("click", ".dropdown.open .dropdown-menu", function (a) {
        a.stopPropagation();
    }), $(".dropdown").on("shown.bs.dropdown", function (a) {
        $(this).attr("data-animation") && ($animArray = [], $animation = $(this).data("animation"),
                $animArray = $animation.split(","), $animationIn = "animated " + $animArray[0],
                $animationOut = "animated " + $animArray[1], $animationDuration = "", $animArray[2] ? $animationDuration = $animArray[2] : $animationDuration = 500,
                $(this).find(".dropdown-menu").removeClass($animationOut), $(this).find(".dropdown-menu").addClass($animationIn));
    }), $(".dropdown").on("hide.bs.dropdown", function (a) {
        $(this).attr("data-animation") && (a.preventDefault(), $this = $(this), $dropdownMenu = $this.find(".dropdown-menu"),
                $dropdownMenu.addClass($animationOut), setTimeout(function () {
            $this.removeClass("open");
        }, $animationDuration));
    }));
});


$(document).ready(function () {
    // Materialize Tabs
    $('.tab-demo').show().tabs();
    $('.tab-demo-active').show().tabs();
  
    $("body").on("click", "[data-ma-action]", function (e) {
        e.preventDefault();
        var $this = $(this);
        action = $(this).data("ma-action");
        switch (action) {
            case "sidebar-open":
                var target = $this.data("ma-target"),
                        backdrop = '<div data-ma-action="sidebar-close" class="ma-backdrop" />';
                $("body").addClass("sidebar-toggled"), $("#header, #header-alt, #main").append(backdrop), $this.addClass("toggled"), $(target).addClass("toggled");
                break;
            case "sidebar-close":
                $("body").removeClass("sidebar-toggled"), $(".ma-backdrop").remove(), $(".sidebar, .ma-trigger").removeClass("toggled");
                break;
            case "profile-menu-toggle":
                $this.parent().toggleClass("toggled"), $this.next().slideToggle(200);
                break;
            case "submenu-toggle":
                $this.next().slideToggle(200), $this.parent().toggleClass("toggled");
                break;
            case "search-open":
                $("#header").addClass("search-toggled"), $("#top-search-wrap input").focus();
                break;
            case "search-close":
                $("#header").removeClass("search-toggled");
                break;
            case "clear-notification":
                var x = $this.closest(".list-group");
                var y = x.find(".list-group-item");
                var z = y.size();
                $this.parent().fadeOut();
                x.find(".list-group").prepend('<i class="grid-loading hide-it"></i>'); 
                x.find(".grid-loading").fadeIn(1500);
                var w = 0;
                y.each(function () {
                    var z = $(this);
                    setTimeout(function () {
                        z.addClass("animated fadeOutRightBig").delay(1e3).queue(function () {
                            z.remove();
                        });
                    }, w += 150);
                }), setTimeout(function () {
                    $(".him-notification").addClass("empty");
                }, 150 * z + 200);
                break;
            case "clear-localstorage":
                swal({
                    title: "Are you sure?",
                    text: "All your saved localStorage values will be removed",
                    type: "warning",
                    showCancelButton: !0,
                    confirmButtonText: "Yes, delete it!",
                    closeOnConfirm: !1
                }, function () {
                    localStorage.clear(), swal("Done!", "localStorage is cleared", "success")
                });
                break;
            case "print":
                window.print();
                break;
            case "login-switch":
                var loginblock = $this.data("ma-block"),
                        loginParent = $this.closest(".lc-block");
                loginParent.removeClass("toggled"), setTimeout(function () {
                    $(loginblock).addClass("toggled")
                });
                break;
            case "profile-edit":
                $this.closest(".pmb-block").toggleClass("toggled");
                break;
            case "profile-edit-cancel":
                $(this).closest(".pmb-block").removeClass("toggled");
                break;
            case "action-header-open":
                ahParent = $this.closest(".action-header").find(".ah-search"), ahParent.fadeIn(300), ahParent.find(".ahs-input").focus();
                break;
            case "action-header-close":
                ahParent.fadeOut(300), setTimeout(function () {
                    ahParent.find(".ahs-input").val("")
                }, 350);
                break;
            case "wall-comment-open":
                $this.closest(".wic-form").hasClass("toggled") || $this.closest(".wic-form").addClass("toggled");
                break;
            case "wall-comment-close":
                $this.closest(".wic-form").find("textarea").val(""), $this.closest(".wic-form").removeClass("toggled");
                break;
            case "todo-form-open":
                $this.closest(".t-add").addClass("toggled");
                break;
            case "todo-form-close":
                $this.closest(".t-add").removeClass("toggled"), $this.closest(".t-add").find("textarea").val("");
                break;
            case "change-skin":
                var skin = $this.data("ma-skin");
                $("[data-ma-theme]").attr("data-ma-theme", skin);
        }
    });
});


function info(mensaje) {
    notify(mensaje,undefined,undefined,undefined,'inverse','animated flipInY','animated flipOutY');
}

function errorlogin(mensaje) {
    swal("ERROR",mensaje);
}
function notify(mensaje, from, align, icon, type, animIn, animOut) {
    $.growl({
        icon: icon,
        title: '',
        message: mensaje,
        url: ''
    }, {
        element: 'body',
        type: type,
        allow_dismiss: true,
        placement: {
            from: from,
            align: align
        },
        offset: {
            x: 20,
            y: 85
        },
        spacing: 10,
        z_index: 1031,
        delay: 2500,
        timer: 1000,
        url_target: '_blank',
        mouse_over: false,
        animate: {
            enter: animIn,
            exit: animOut
        },
        icon_type: 'class',
        template: '<div data-growl="container" class="alert" role="alert">' +
                '<button type="button" class="close" data-growl="dismiss">' +
                '<span aria-hidden="true">&times;</span>' +
                '<span class="sr-only">Close</span>' +
                '</button>' +
                '<span data-growl="icon"></span>' +
                '<span data-growl="title"></span>' +
                '<span data-growl="message"></span>' +
                '<a href="#" data-growl="url"></a>' +
                '</div>'
    });
};

(function ($) {
 $(document).ready(function() {

    // jQuery reverse
    $.fn.reverse = [].reverse;

    $(document).on('mouseenter.fixedActionBtn', '.fixed-action-btn', function(e) {
      var $this = $(this);
      openFABMenu($this);

    });

    $(document).on('mouseleave.fixedActionBtn', '.fixed-action-btn', function(e) {
      var $this = $(this);
      closeFABMenu($this);
    });

  });

  $.fn.extend({
    openFAB: function() {
      var $this = $(this);
      openFABMenu($this);
    },
    closeFAB: function() {
      closeFABMenu($this);
    }
  });


  var openFABMenu = function (btn) {
    $this = btn;
    if ($this.hasClass('active') === false) {
      $this.addClass('active');
      $this.find('ul .btn-floating').velocity(
        { scaleY: ".4", scaleX: ".4", translateY: "40px"},
        { duration: 0 });

      var time = 0;
      $this.find('ul .btn-floating').reverse().each(function () {
        $(this).velocity(
          { opacity: "1", scaleX: "1", scaleY: "1", translateY: "0"},
          { duration: 80, delay: time });
        time += 40;
      });
    }
  };

  var closeFABMenu = function (btn) {
    $this = btn;
    $this.removeClass('active');
    var time = 0;
    $this.find('ul .btn-floating').velocity("stop", true);
    $this.find('ul .btn-floating').velocity(
      { opacity: "0", scaleX: ".4", scaleY: ".4", translateY: "40px"},
      { duration: 80 }
    );
  };


}(jQuery));