// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//require jquery.turbolinks
//= require jquery_ujs
//= require kindeditor
//= require faye
//= require_tree .
//= require bootstrap-sprockets
//require turbolinks

$(function(){
	pop_init();
	checkScroll();

	$(window).bind("scroll", function(){

      // 获取网页文档对象滚动条的垂直偏移
      var scrollTopNum = $(document).scrollTop(),
          // 获取浏览器当前窗口的高度
          winHeight = $(window).height(),
          returnTop = $("div.returnTop");

      // 滚动条的垂直偏移大于 0 时显示，反之隐藏
      (scrollTopNum > 0) ? returnTop.fadeIn("fast") : returnTop.fadeOut("fast");

      // 给 IE6 定位
      if (!-[1,]&&!window.XMLHttpRequest) {
          returnTop.css("top", scrollTopNum + winHeight - 200);
      }

  });

  // 点击按钮后，滚动条的垂直方向的值逐渐变为0，也就是滑动向上的效果
  $("div.returnTop").click(function() {
      $("html, body").animate({ scrollTop: 0 }, 100);
  });

  //thing.js
  //设置body中的图片为响应式并且居中
  $(".post_content img").each(function() {
    $(this).addClass('img-responsive');
    $(this).addClass('center-block');
  });
  
});

function pop_init() {
	$(".pop").each(function() {
	  var $pElem = $(this);
	  $pElem.popover({
	    html: true,
	    trigger: "manual",
	    title: getPopoverTitle($pElem.attr("id")),
	    content: getPopoverContent($pElem.attr("id")),
	    container: 'body',
	    animation: false,
	    template: '<div class="popover" role="tooltip"><div class="arrow"></div><div class="popover-content" style="overflow:auto;height:600px"></div></div>'
	  });
	}).on("mouseenter",
		function() {
		  var _this = this;
		  $(this).popover("show");
		  $(".popover").on("mouseleave",
			  function() {
			    $(_this).popover('hide');
			  }
			);
	}).on("mouseleave",
				function() {
				  var _this = this;
				  setTimeout(function() {
				    if (!$(".popover:hover").length) {
				      $(_this).popover("hide");
				    }
				  },
				  100);
				});

		function getPopoverTitle(target) {
		  return $("#" + target + "_content > h2.popover-title").html();
		};

		function getPopoverContent(target) {
		  return $("#" + target + "_content > div.popover-content").html();
		};
}

function crawler() {
	var url = $("#url").val();

	var form = new FormData();
    form.append("url", url);

    $('#progress').css('display', '');
    $('#crawler_error').css('display','none');
    $('#crawler_button').attr("disabled",true);
    // XMLHttpRequest 对象
    var xhr = new XMLHttpRequest();
    xhr.open("post", '/things/crawler', true);
    xhr.upload.addEventListener("progress", uploadProgress, false);
    xhr.onload = function (data) {
    		var result = false;
        if (this.status == 200) {
        	if (this.responseText != "error") {
        		$('#crawler_success').css('display','');
        		window.location.href='/things/'+this.responseText+"/edit";
        		result = true;
        	}
        }
        if (!result){
	        $('#progress').css('display', 'none');
	        $('#crawler_error').css('display','');
	    		$('#crawler_button').removeAttr("disabled");
	    	}
    };
    xhr.send(form);
}

function uploadProgress(evt) {
  if (evt.lengthComputable) {
    var percentComplete = Math.round(evt.loaded * 100 / evt.total);
    $('#progressbar').css('width', percentComplete.toString() + '%');
  }
}

function checkScroll() {
  if (nearBottomOfPage()) {
    if($(".next a").length != 0){
    	$('.spinner').css('display','');
      $.rails.handleRemote($(".next a"));
    }
  } else {
    setTimeout("checkScroll()", 250);
  }
}

function nearBottomOfPage() {
  return scrollDistanceFromBottom() < 150;
}

function scrollDistanceFromBottom(argument) {
  return pageHeight() - (window.pageYOffset + self.innerHeight);
}

function pageHeight() {
  return Math.max(document.body.scrollHeight, document.body.offsetHeight);
}