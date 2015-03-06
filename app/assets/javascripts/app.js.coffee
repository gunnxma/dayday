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
      $el.removeClass($el.data("active-class"))
    false

  voteableAsvoted : (el) ->
    votes_count = $(el).data("count")
    $(el).data("state","voted").attr("title", "取消赞")
    $('span',el).text("#{votes_count}")
    $("i",el).attr("class","fa fa-thumbs-up fa-fw")
    $(el).addClass($(el).data("active-class"))

  likeable : (el) ->
    $el = $(el)
    likeable_type = $el.data("type")
    likeable_id = $el.data("id")
    likes_count = parseInt($el.data("count"))
    if $el.data("state") != "liked"
      $.ajax
        url : "/likes"
        type : "POST"
        data :
          type : likeable_type
          id : likeable_id

      likes_count += 1
      $el.data('count', likes_count)
      App.likeableAsliked(el)
    else
      $.ajax
        url : "/likes/#{likeable_id}"
        type : "DELETE"
        data :
          type : likeable_type
      if likes_count > 0
        likes_count -= 1
      $el.data("state","").data('count', likes_count).attr("title", "喜欢")
      if likes_count == 0
        $('span',el).text("")
      else
        $('span',el).text("#{likes_count}")
      $("i",el).attr("class","fa fa-heart-o")        
      $el.removeClass($el.data("active-class"))
    false

  likeableAsliked : (el) ->
    likes_count = $(el).data("count")
    $(el).data("state","liked").attr("title", "取消喜欢")
    $('span',el).text("#{likes_count}")
    $("i",el).attr("class","fa fa-heart")
    $(el).addClass($(el).data("active-class"))
      
  ownable : (el) ->
    $el = $(el)
    ownable_type = $el.data("type")
    ownable_id = $el.data("id")
    owns_count = parseInt($el.data("count"))
    if $el.data("state") != "owned"
      $.ajax
        url : "/owns"
        type : "POST"
        data :
          type : ownable_type
          id : ownable_id

      owns_count += 1
      $el.data('count', owns_count)
      App.ownableAsowned(el)
    else
      $.ajax
        url : "/owns/#{ownable_id}"
        type : "DELETE"
        data :
          type : ownable_type
      if owns_count > 0
        owns_count -= 1
      $el.data("state","").data('count', owns_count).attr("title", "喜欢")
      if owns_count == 0
        $('span',el).text("")
      else
        $('span',el).text("#{owns_count}")
      $("i",el).attr("class","fa fa-circle-o")        
      $el.removeClass($el.data("active-class"))
    false

  ownableAsowned : (el) ->
    owns_count = $(el).data("count")
    $(el).data("state","owned").attr("title", "取消拥有")
    $('span',el).text("#{owns_count}")
    $("i",el).attr("class","fa fa-check-circle-o")
    $(el).addClass($(el).data("active-class"))  