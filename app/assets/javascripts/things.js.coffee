$(document).ready ->
  $("#new_feeling").on("ajax:before", () -> 
    $('#btn_feeling').attr('disabled','disabled')    
    $("#new_feeling_error").css('display','none')
  ).on("ajax:success", (e, data, status, xhr) ->
    $('#feeling_body').val('')
    $('.feed_empty').css('display','none')
    $('#btn_feeling').removeAttr('disabled')
  )

  $("a[data-new-feeling-up]").on("ajax:success", (e, data, status, xhr) ->
    if data == "ok"
      $(this).children('i').removeClass('fa fa-thumbs-o-up fa-fw')
      $(this).children('i').addClass('fa fa-thumbs-up fa-fw')
      $(this).children('span').html(parseInt($(this).children('span').html())+1)
  )

  $("a[data-new-review-up]").on("ajax:success", (e, data, status, xhr) ->
    if data == "ok"
      $(this).children('i').removeClass('fa fa-thumbs-o-up fa-fw')
      $(this).children('i').addClass('fa fa-thumbs-up fa-fw')
      $(this).children('span').html(parseInt($(this).children('span').html())+1)
  )

  $("#new_fancier").on("ajax:success", (e, data, status, xhr) ->
    if data == "ok"
      $(this).children('i').removeClass('fa fa-heart-o')
      $(this).children('i').addClass('fa fa-heart')
      $(this).children('span').html(parseInt($(this).children('span').html())+1)
      $(this).attr('title', $(this).data("unlike"))
    
    if data == "removeok"
      $(this).children('i').removeClass('fa fa-heart')
      $(this).children('i').addClass('fa fa-heart-o')
      $(this).children('span').html(parseInt($(this).children('span').html())-1)
      $(this).attr('title', $(this).data("like"))
  )

  $("#new_owner").on("ajax:success", (e, data, status, xhr) ->
    if data == "ok"
      $(this).children('i').removeClass('fa fa-circle-o')
      $(this).children('i').addClass('fa fa-check-circle-o')
      $(this).children('span').html(parseInt($(this).children('span').html())+1)
      $(this).attr('title', $(this).data("unlike"))
    
    if data == "removeok"
      $(this).children('i').removeClass('fa fa-check-circle-o')
      $(this).children('i').addClass('fa fa-circle-o')
      $(this).children('span').html(parseInt($(this).children('span').html())-1)
      $(this).attr('title', $(this).data("like"))
  )