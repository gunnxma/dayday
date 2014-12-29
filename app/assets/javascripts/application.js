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
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets


$(function(){
	$(".pop").each(function() {
	  var $pElem = $(this);
	  $pElem.popover({
	    html: true,
	    trigger: "manual",
	    title: getPopoverTitle($pElem.attr("id")),
	    content: getPopoverContent($pElem.attr("id")),
	    container: 'body',
	    animation: false,
	    template: '<div class="popover" role="tooltip"><div class="arrow"></div><div class="popover-content"></div></div>'
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
});