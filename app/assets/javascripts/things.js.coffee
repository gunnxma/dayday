$(document).ready ->
  $("#new_feeling").on("ajax:before", () -> 
  	$('#btn_feeling').attr('disabled','disabled')    
  	$("#new_feeling_error").css('display','none')
  ).on("ajax:success", (e, data, status, xhr) ->
  	$('#feeling_body').val('')
  	$('#btn_feeling').removeAttr('disabled')
  )

  $("a[data-new-feeling-up]").on("ajax:success", (e, data, status, xhr) ->
  	if data == "ok"
  		$(this).children('i').removeClass('fa fa-thumbs-o-up fa-fw')
  		$(this).children('i').addClass('fa fa-thumbs-up fa-fw')
  		$(this).children('span').html(parseInt($(this).children('span').html())+1)
  )