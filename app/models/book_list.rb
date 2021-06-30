# frozen_string_literal: true

class BookList < ApplicationRecord
  belongs_to :book, optional: true
  belongs_to :list, optional: true
end
