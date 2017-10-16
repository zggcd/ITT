(function($) {
  //"use strict";

  $.fn.socialButtonsShare = function(customOptions, customSocialNetworks) {
    var that = this;
    var options = customOptions || {};
    var socialNetworks = customSocialNetworks || {};
  
    that.options = {
      socialNetworks: ["facebook", "googleplus", "linkedin", "twitter", "pinterest", "wordpress", "gmail"],
      url: "",
      text: "",
      sharelabel: true,
      sharelabelText: "SHARE",
      verticalAlign: false
    };
    $.extend(that.options, options);
    if (that.options.url==="" && $("link[rel=canonical]").length && $("link[rel=canonical]").attr('href').indexOf("://") != -1) {
      that.options.url = $("link[rel=canonical]").attr('href');
    } else if (that.options.url==="" && !$("link[rel=canonical]").length && window.location.href!==undefined) {
      that.options.url = window.location.href;
    }
    if (that.options.text==="" && document.title!=="") {
      that.options.text = document.title;
    }
    that.options.url = encodeURIComponent(that.options.url);
    that.options.text = encodeURIComponent(that.options.text);
  
    that.socialNetworks = {
      facebook: {
        title: "Chia sẻ trên Facebook",
        text:"Facebook",
        cssclass: "social-facebook",
        image: "/Content2/style/img/icon-facebook.jpg",
        shareurl: "https://www.facebook.com/sharer/sharer.php?u=" + that.options.url,
        height: 600,
        width: 600
      },
      twitter: {
        title: "Chia sẻ trên Twitter",
        text:"Twitter",
        cssclass: "social-twitter",
        image: "/Content2/style/img/icon-t.jpg",
        shareurl: "https://twitter.com/intent/tweet?text=" + that.options.text + "&url=" + that.options.url,
        height: 600,
        width: 600
      },
      pinterest: {
        title: "Chia sẻ trên Pinterest",
        text:"Pinterest",
        cssclass: "social-pinterest",
        image: "/Content2/style/img/icon-pin.jpg",
        shareurl: "https://pinterest.com/pin/create/bookmarklet/?url=" + that.options.url,
        height: 600,
        width: 600
		},
      linkedin: {
        title: "Chia sẻ trên Linkedin",
        text:"Linkedin",
        cssclass: "social-linkedin",
        image: "/Content2/style/img/icon-in.jpg",
        shareurl: "https://www.linkedin.com/shareArticle?url=" + that.options.url,
        height: 600,
        width: 600
		},
	gmail: {
        title: "Chia sẻ trên Gmail",
        text:"Gmail",
        cssclass: "social-gmail",
        image: "/Content2/style/img/icon-gmail.jpg",
        shareurl: "https://mail.google.com/mail/u/0/?view=cm&fs=1&to&su=&body=" + that.options.url,
        height: 600,
        width: 600
		},

      googleplus: {
        title: "Chia sẻ trên Google+",
        text:"Google+",
        cssclass: "social-googleplus",
        image: "/Content2/style/img/icon-g.jpg",
        shareurl: "https://plus.google.com/share?url=" + that.options.url,
        height: 600,
        width: 600
      },
       wordpress: {
        title: "Chia sẻ trên WordPress",
        text:"WordPress",
        cssclass: "social-wordpress",
        image: "/Content2/style/img/icon-w.jpg",
        shareurl: "http://api.addthis.com/oexchange/0.8/forward/wordpress/offer?url="+that.options.url,
        height: 600,
        width: 600
      },
      googleplus: {
         title: "Chia sẻ trên Google+",
        text:"Google+",
        cssclass: "social-googleplus",
        image: "/Content2/style/img/icon-g.jpg",
        shareurl: "https://plus.google.com/share?url=" + that.options.url,
        height: 600,
        width: 600
      }

    };
    $.each(that.socialNetworks, function(index, value) {
      if (socialNetworks.hasOwnProperty(index)) {
        $.extend(that.socialNetworks[index], socialNetworks[index]);
      }
    });

    if (that.options.socialNetworks.length>0) {
      var container = $(that);
      var verticalAlign = that.options.verticalAlign;

      if (that.options.sharelabel) {
        var classVerticalLabel = (verticalAlign) ? " class=\"list-share\"" : "";
        var htmlLabel = "<label" + classVerticalLabel + ">" + that.options.sharelabelText + "</label>";
        container.append(htmlLabel);
      }

      var classVertical = (verticalAlign) ? " class=\"list-share\"" : "";
      var htmlUl = "<ul" + classVertical + "></ul><div></div>";
      container.append(htmlUl);

      $.each(that.options.socialNetworks, function(index, value) {
        if (that.socialNetworks.hasOwnProperty(value)) {
          var classVertical = (verticalAlign) ? " vertical" : "";

          var liShare ="";
          if(classVertical==" vertical"){ 
           	liShare ="<li><a href=\"#\"><img style='width:16px' alt=\"" + that.socialNetworks[value].title + "\" src=\"" + that.socialNetworks[value].image + "\"> " + that.socialNetworks[value].text + "</a></li>";//"<li class=\"" + that.socialNetworks[value].cssclass + classVertical + "\" title=\"" + that.socialNetworks[value].title + "\">" + that.socialNetworks[value].text + "</li>";
          }else{
	          liShare ="<li><a href=\"#\"><img style='width:27px'  src=\"" + that.socialNetworks[value].image + "\" alt=\"" + that.socialNetworks[value].title + "\"></a></li>";
          }
           

          var shareHeight = that.socialNetworks[value].height;
          var shareWidth = that.socialNetworks[value].width;
          var shareTop = ((screen.height/2) - (that.socialNetworks[value].height/2));
          var shareLeft = ((screen.width/2)-(that.socialNetworks[value].width/2))

          $(liShare).appendTo(container.find("ul")).on("click", function() {
            window.open(that.socialNetworks[value].shareurl, '', 'menubar=no,toolbar=no,resizeable=no,scrollbars=no,height=' + shareHeight + ',width=' + shareWidth + ',top=' + shareTop + ',left=' + shareLeft);
          });
        }
      });
    }
  };
})(jQuery);

