module ApplicationHelper
	def follower_btn_tag(user, opts = {})
    return "" if user == current_user

    label = ['关注作者', '已关注作者']
    title = ['关注作者', '取消关注作者']
    btn_class = ['btn btn-info', 'btn btn-info review_followed_btn']
    i_class = ['fa fa-plus', 'fa fa-check']
    url = [user_followers_path(user), user_followers_path(user)]
    method = ['post', 'delete']
    has_icon = true

    if opts[:style] == 'following-follower-btn'
      has_icon = false
      label = ['关注', '已关注']
      title = ['关注', '取消关注']
      btn_class = ['btn btn-info btn-following-follow', 'btn btn-info btn-followed-follow']
    end

    if current_user.blank?
      icon = content_tag("i", "", class: i_class.first)
      icon = '' unless has_icon
      follow_label = raw "#{icon} <span>#{label.first}</span>"
      return link_to(follow_label, new_session_path, class: btn_class.first)
    end

    state = 0
    state = 1 if user.followed_by_user?(current_user)

    icon = content_tag("i", "", class: i_class[state])
    icon = '' unless has_icon
    follow_label = raw "#{icon} <span>#{label[state]}</span>"

    link_to(follow_label, url[state], title: title[state], class: btn_class[state], :method => method[state], :remote => true,
      'data-state-btn' => 'true', 'data-h-label' => label.join(','), 'data-h-title' => title.join(','),
      'data-h-btn-class' => btn_class.join(','), 'data-h-i-class' => i_class.join(','), 'data-h-url' => url.join(','),
      'data-h-method' => method.join(','), 'data-has-icon' => has_icon
    )
  end
end
