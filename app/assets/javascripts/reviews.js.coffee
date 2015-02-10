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