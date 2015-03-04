window.App =
	voteable : (el) ->
    $el = $(el)
    voteable_type = $el.data("type")
    voteable_id = $el.data("id")
    votes_count = parseInt($el.data("count"))
    if $el.data("state") != "voted"
      $.ajax
        url : "/votes"
        type : "POST"
        data :
          type : voteable_type
          id : voteable_id

      votes_count += 1
      $el.data('count', votes_count)
      App.voteableAsvoted(el)
    else
      $.ajax
        url : "/votes/#{voteable_id}"
        type : "DELETE"
        data :
          type : voteable_type
      if votes_count > 0
        votes_count -= 1
      $el.data("state","").data('count', votes_count).attr("title", "赞")
      if votes_count == 0
        $('span',el).text("")
      else
        $('span',el).text("#{votes_count}")
      $("i",el).attr("class","fa fa-thumbs-o-up fa-fw")
    false

  voteableAsvoted : (el) ->
    votes_count = $(el).data("count")
    $(el).data("state","voted").attr("title", "取消赞")
    $('span',el).text("#{votes_count}")
    $("i",el).attr("class","fa fa-thumbs-up fa-fw")