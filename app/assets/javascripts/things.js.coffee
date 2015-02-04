$(document).ready ->
  $("#new_feeling").on("ajax:before", () -> 
  	$('#btn_feeling').attr('disabled','disabled')
  	$("#new_feeling_error").css('display','none')
  ).on("ajax:success", (e, data, status, xhr) ->
  	$('#feeling_body').val('')
  	$('#btn_feeling').removeAttr('disabled')
  )