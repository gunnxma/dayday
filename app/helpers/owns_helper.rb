module OwnsHelper
	def ownable_tag(ownable, opts = {})
		return "" if ownable.blank?

		label = "#{ownable.owns.count}"
    label = "" if ownable.owns.count == 0
    link_class = opts[:link_class] unless opts[:link_class].blank?
    active_class = opts[:active_class] unless opts[:active_class].blank?
    small_label = opts[:small_label] unless opts[:small_label].blank?

    if current_user.blank?
      return link_to(raw("<i class=\"fa fa-circle-o\"></i><span>#{label}</span><small>#{small_label}</small>"), new_session_path, :class => link_class)
    end    

    if ownable.owned_by_user?(current_user)
      title = "取消拥有"
      state = "owned"
      icon = content_tag("i", "", class: "fa fa-check-circle-o")
      l_class = "#{link_class} #{active_class}"
    else
      title = "拥有"
      state = ""
      icon = content_tag("i", "", class: "fa fa-circle-o")
      l_class = link_class
    end
    own_label = raw "#{icon} <span>#{label}</span><small>#{small_label}</small>"

    link_to(own_label, "#", title: title, 'data-count' => ownable.owns.count,
          'data-state' => state, 'data-type' => ownable.class,'data-id' => ownable.id,
          'data-active-class' => active_class,
          :class => l_class, onclick: "return App.ownable(this);")
  end
end
