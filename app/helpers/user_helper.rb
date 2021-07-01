# frozen_string_literal: true

module UserHelper
  def user_avatar_tag(user)
    unless user.avatar?
      return image_tag('default_a.png', alt: 'Image',
                                        class: 'user-avatar')
    end

    image_tag(user.avatar.url, alt: 'Image', class: 'user-avatar')
  end
end
