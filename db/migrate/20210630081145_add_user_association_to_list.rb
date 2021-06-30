# frozen_string_literal: true

class AddUserAssociationToList < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :list, index: true, foreign_key: true
  end
end
