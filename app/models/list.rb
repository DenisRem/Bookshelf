# frozen_string_literal: true

class List < ApplicationRecord
  has_many :book_lists, dependent: :destroy
  has_many :books, through: :book_lists
  has_many :users, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
end
