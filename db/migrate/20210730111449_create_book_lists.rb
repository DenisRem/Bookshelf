# frozen_string_literal: true

class CreateBookLists < ActiveRecord::Migration[6.1]
  def change
    create_table :book_lists do |t|
      t.belongs_to :book, index: true, foreign_key: true
      t.belongs_to :list, index: true, foreign_key: true

      t.timestamps
    end
  end
end
