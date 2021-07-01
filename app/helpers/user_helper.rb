# frozen_string_literal: true

module UserHelper
  def user_avatar_tag(user)
    avatar = user.avatar? ? user.avatar.url : 'default_a.png'
    image_tag(avatar, alt: 'Image', class: 'user-avatar')
  end
end
