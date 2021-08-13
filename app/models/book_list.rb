# frozen_string_literal: true

class BookList < ApplicationRecord
  belongs_to :book
  belongs_to :list
end
