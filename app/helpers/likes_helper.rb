module LikesHelper
	def likeable_tag(likeable, opts = {})
		return "" if likeable.blank?

		label = "#{likeable.likes.count}"
    label = "" if likeable.likes.count == 0
    link_class = opts[:link_class] unless opts[:link_class].blank?
    active_class = opts[:active_class] unless opts[:active_class].blank?
    small_label = opts[:small_label] unless opts[:small_label].blank?

    if current_user.blank?
      return link_to(raw("<i class=\"fa fa-heart-o\"></i><span>#{label}</span><small>#{small_label}</small>"), new_session_path, :class => link_class)
    end    

    if likeable.liked_by_user?(current_user)
      title = "取消喜欢"
      state = "liked"
      icon = content_tag("i", "", class: "fa fa-heart")
      l_class = "#{link_class} #{active_class}"
    else
      title = "喜欢"
      state = ""
      icon = content_tag("i", "", class: "fa fa-heart-o")
      l_class = link_class
    end
    like_label = raw "#{icon} <span>#{label}</span><small>#{small_label}</small>"

    link_to(like_label, "#", title: title, 'data-count' => likeable.likes.count,
          'data-state' => state, 'data-type' => likeable.class,'data-id' => likeable.id,
          'data-active-class' => active_class,
          :class => l_class, onclick: "return App.likeable(this);")
  end
end
