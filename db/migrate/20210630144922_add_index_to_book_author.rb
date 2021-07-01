# frozen_string_literal: true

class AddIndexToBookAuthor < ActiveRecord::Migration[6.1]
  def change
    add_index :book_authors, [:book_id, :author_id], unique: true
  end
end
