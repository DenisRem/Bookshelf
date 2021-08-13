# frozen_string_literal: true

module AuthorHelper
  def user_avatar_tag(author)
    avatar = author.avatar? ? author.avatar.url : 'default_a.png'
    image_tag(avatar, alt: 'Image', class: 'user-avatar')
  end
end
