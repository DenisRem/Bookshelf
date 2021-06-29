# frozen_string_literal: true

module UserHelper
  def user_avatar_tag(user)
    return image_tag('default_a.png', alt: 'Image', class: 'user-avatar') unless user.avatar?

    image_tag(user.avatar.url, alt: 'Image', class: 'user-avatar')
  end
end
