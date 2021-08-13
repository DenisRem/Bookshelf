# frozen_string_literal: true

class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
