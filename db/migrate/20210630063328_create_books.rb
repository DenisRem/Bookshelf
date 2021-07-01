# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :publishing_house
      t.string :language
      t.integer :year_of_publication
      t.integer :number_of_pages
      t.string :format
      t.string :binding
      t.string :ISBN
      t.string :avatar
      t.boolean :availability

      t.timestamps
    end
  end
end
