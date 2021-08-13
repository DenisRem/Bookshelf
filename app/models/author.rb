# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :book_authors, dependent: :destroy
  has_many :books, through: :book_authors

  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true, length: { maximum: 50 }
end
