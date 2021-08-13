# frozen_string_literal: true

class BookManager < ApplicationService
  def initialize(list, book_ids)
    @list = list
    @book_ids = book_ids
  end

  def call
    list.book_lists.delete_all
    books.compact.each do |book|
      list.book_lists.create!(book: book)
    end
  end

  private

  attr_reader :list, :book_ids

  def books
    book_ids.map do |book_id|
      next if book_id.blank?
      next Book.find_by(id: book_id) if Float(book_id, exception: false)

      Book.create(title: book_id)
    end
  end
end