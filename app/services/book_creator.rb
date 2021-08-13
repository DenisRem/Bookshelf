# frozen_string_literal: true

class BookCreator < ApplicationService
  attr_reader :book, :author_name, :permitted_attributes

  def initialize(book, author_name, permitted_attributes)
    @book = book
    @author_name = author_name
    @permitted_attributes = permitted_attributes
  end

  def call
    author = Author.find_by name: @author_name

    @book.author_id = author[:id]
    @book.save
  end
end
