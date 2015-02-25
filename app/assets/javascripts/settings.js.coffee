# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("a[data-del-link]").on("ajax:success", (e, data, status, xhr) ->
  	$(this).parents('tr').remove()
  )