# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :book_authors, dependent: :destroy
  has_many :book_lists, dependent: :destroy
  has_many :authors, through: :book_authors
  has_many :lists, through: :book_lists

  validates :title, presence: true, length: { maximum: 50 }
  validates :publishing_house, presence: true, length: { maximum: 50 }
  validates :language, presence: true, length: { maximum: 20 }
  validates :year_of_publication, presence: true,
                                  format: { with: /\A(19|20)\d{2}\z/ },
                                  numericality: { only_integer: true,
                                                  greater_than_or_equal_to: 1900,
                                                  less_than_or_equal_to: Date.today.year }
  validates :number_of_pages, numericality: true, allow_nil: true,
                              length: { maximum: 4 }
  validates :ISBN, numericality: true, allow_nil: true,
                   length: { minimum: 10, maximum: 13 }
end
