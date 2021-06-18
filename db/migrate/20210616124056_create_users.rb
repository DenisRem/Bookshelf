# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :role
      t.string :photo

      t.timestamps
      t.index :email, unique: true
    end
  end
end
