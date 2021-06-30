# frozen_string_literal: true

class BookAuthor < ApplicationRecord
  belongs_to :book, optional: true
  belongs_to :author, optional: true
end
