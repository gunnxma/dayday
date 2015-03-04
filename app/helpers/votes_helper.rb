module VotesHelper
	def voteable_tag(voteable, opts = {})
		return "" if voteable.blank?

		label = "#{voteable.votes.count}"
    label = "" if voteable.votes.count == 0

    if current_user.blank?
      return link_to(raw("<i class=\"fa fa-thumbs-o-up fa-fw\"></i><span>#{label}</span>"), new_session_path)
    end    

    if voteable.voted_by_user?(current_user)
      title = "取消赞"
      state = "voted"
      icon = content_tag("i", "", class: "fa fa-thumbs-up fa-fw")
    else
      title = "赞"
      state = ""
      icon = content_tag("i", "", class: "fa fa-thumbs-o-up fa-fw")
    end
    vote_label = raw "#{icon} <span>#{label}</span>"

    link_to(vote_label, "#", title: title, 'data-count' => voteable.votes.count,
          'data-state' => state, 'data-type' => voteable.class,'data-id' => voteable.id,
          onclick: "return App.voteable(this);")
  end
end
