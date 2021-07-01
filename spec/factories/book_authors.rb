# frozen_string_literal: true

FactoryBot.define do
  factory :book_author do
    book
    author
  end
end
