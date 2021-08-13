# frozen_string_literal: true

class AddIndexToBookList < ActiveRecord::Migration[6.1]
  def change
    add_index :book_lists, %i[book_id list_id], unique: true
  end
end
