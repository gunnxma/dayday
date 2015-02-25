# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#new_lfeeling").on("ajax:before", () -> 
    $('#btn_feeling').attr('disabled','disabled')    
    $("#new_feeling_error").css('display','none')
  ).on("ajax:success", (e, data, status, xhr) ->
    $('#lfeeling_body').val('')
    $('.feed_empty').css('display','none')
    $('#btn_feeling').removeAttr('disabled')
  )