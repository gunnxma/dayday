module VotesHelper
	def voteable_tag(voteable, opts = {})
		return "" if voteable.blank?

		label = "#{voteable.votes.count}"
    label = "" if voteable.votes.count == 0
    link_class = opts[:link_class] unless opts[:link_class].blank?
    active_class = opts[:active_class] unless opts[:active_class].blank?

    if current_user.blank?
      return link_to(raw("<i class=\"fa fa-thumbs-o-up fa-fw\"></i><span>#{label}</span>"), new_session_path, :class => link_class)
    end    

    if voteable.voted_by_user?(current_user)
      title = "取消赞"
      state = "voted"
      icon = content_tag("i", "", class: "fa fa-thumbs-up fa-fw")
      l_class = "#{link_class} #{active_class}"
    else
      title = "赞"
      state = ""
      icon = content_tag("i", "", class: "fa fa-thumbs-o-up fa-fw")
      l_class = link_class
    end
    vote_label = raw "#{icon} <span>#{label}</span>"

    link_to(vote_label, "#", title: title, 'data-count' => voteable.votes.count,
          'data-state' => state, 'data-type' => voteable.class,'data-id' => voteable.id,
          'data-active-class' => active_class,
          :class => l_class, onclick: "return App.voteable(this);")
  end
end
