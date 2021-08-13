# frozen_string_literal: true

class ListCreator < ApplicationService
  attr_reader :list, :book_title, :permitted_attributes

  def initialize(list, book_title, permitted_attributes)
    @list = list
    @book_title = book_title
    @permitted_attributes = permitted_attributes
  end

  def call
    book = Book.find_by title: @book_title

    @list.book_id = book[:id]
    @list.save
  end
end