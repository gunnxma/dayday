# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#new_rfeeling").on("ajax:before", () -> 
    $('#btn_feeling').attr('disabled','disabled')    
    $("#new_feeling_error").css('display','none')
  ).on("ajax:success", (e, data, status, xhr) ->
    $('#rfeeling_body').val('')
    $('.feed_empty').css('display','none')
    $('#btn_feeling').removeAttr('disabled')
  )

  $("#review_up").on("ajax:success", (e, data, status, xhr) ->
    if data == "ok"
      $(this).children('i').removeClass('fa fa-thumbs-o-up fa-fw heartbeat')
      $(this).children('i').addClass('fa fa-thumbs-up fa-fw heartbeat')
      $(this).addClass("like-active")
      $(this).children('span').html(parseInt($(this).children('span').html())+1)
      $(this).attr('title', $(this).data("unlike"))
    
    if data == "removeok"
      $(this).children('i').removeClass('fa fa-thumbs-up fa-fw heartbeat')
      $(this).children('i').addClass('fa fa-thumbs-o-up fa-fw heartbeat')
      $(this).removeClass("like-active")
      $(this).children('span').html(parseInt($(this).children('span').html())-1)
      $(this).attr('title', $(this).data("like"))
  )

  $("a[data-state-btn]").on("ajax:success", (e, data, status, xhr) ->
    if data == "ok"
      state = 1
      old_state = 0
    else
      state = 0
      old_state = 1

    $(this).children('span').html($(this).data("h-label").split(',')[state])
    $(this).attr('title', $(this).data("h-title").split(',')[state])
    $(this).removeClass($(this).data("h-btn-class").split(',')[old_state])
    $(this).addClass($(this).data("h-btn-class").split(',')[state])
    $(this).attr('href', $(this).data("h-url").split(',')[state])
    $(this).data('method', $(this).data("h-method").split(',')[state])
    if $(this).data("has-icon")
      $(this).children('i').removeClass($(this).data("h-i-class").split(',')[old_state])
      $(this).children('i').addClass($(this).data("h-i-class").split(',')[state])
  )