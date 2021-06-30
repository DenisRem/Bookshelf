# frozen_string_literal: true

class CreateBookAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :book_authors do |t|
      t.belongs_to :book, index: true, foreign_key: true
      t.belongs_to :author, index: true, foreign_key: true

      t.timestamps
    end
  end
end
