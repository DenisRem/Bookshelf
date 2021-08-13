# frozen_string_literal: true

class AuthorManager < ApplicationService
  def initialize(book, author_ids)
    @book = book
    @author_ids = author_ids
  end

  def call
    book.book_authors.delete_all
    authors.compact.each do |author|
      book.book_authors.create!(author: author)
    end
  end

  private

  attr_reader :book, :author_ids

  def authors
    author_ids.map do |author_id|
      next if author_id.blank?
      next Author.find_by(id: author_id) if Float(author_id, exception: false)

      Author.create(name: author_id)
    end
  end
end
